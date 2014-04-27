#!/usr/bin/perl
use strict;
use warnings;
use Time::Piece;

my $feature="INCREMENT";
my $current_time = localtime;

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
    if ($tm < $current_time) {
      print "#$line";
      if ($line =~ /\\\s*\n/) { $commented=1; }
    } else {
      print $line;
    }
    next;
  }
  print $line;
}
