#!/usr/bin/perl
use strict;
use warnings;
use Time::Piece;
use Getopt::Long;

my $feature="INCREMENT";
my $date = localtime->strftime("%e-%b-%Y");
my $before = '';
my $after = '';

GetOptions ('before' => \$before,
            'after'  => \$after,
            'date=s' => \$date);

my $comment_date = Time::Piece->strptime($date, '%e-%b-%Y');

my $filename = shift(@ARGV) or die "You need to specify filename!\n";
my $commented=0;

open (FILE, $filename) or die "Could not open file $filename\n";

while (my $line = <FILE>) {
  if (($line =~ /\\\s*\n/) and ($commented == 1)) {
    print "#$line";
    next;
  } elsif ($commented == 1) {
    print "#$line";
    $commented = 0;
    next;
  }
  if (($line =~ /^\s*#/) or ($line =~ /^\s*$/)) {
    print $line;
    next;
  }
  if ($line =~ /^$feature/) {
    my @stringsplit = split(/ /, $line);
    my $tm = Time::Piece->strptime($stringsplit[4], '%e-%b-%Y');
    if ($before) {
      if ($tm < $comment_date) {
        print "#$line";
        if ($line =~ /\\\s*\n/) { $commented=1; }
      } else {
        print $line;
      }
    } elsif ($after) {
      if ($tm > $comment_date) {
        print "#$line";
        if ($line =~ /\\\s*\n/) { $commented=1; }
      } else {
        print $line;
      }
    } else {
      if ($tm == $comment_date) {
        print "#$line";
        if ($line =~ /\\\s*\n/) { $commented=1; }
      } else {
        print $line;
      }
    }
    next;
  }
  print $line;
}
