#!/usr/bin/perl
use strict;
use warnings;
use Time::Piece;
use Getopt::Long;
use Term::ANSIColor qw(:constants);

my $feature="INCREMENT|FEATURE";
my $date = localtime->strftime("%e-%b-%Y");
my $before = '';
my $after = '';
my $color = '';
my $comment = "Commented $date, by perl-flexlm-commenter";

GetOptions ('before' => \$before,
            'after'  => \$after,
            'pretty'  => \$color,
            'comment=s'  => \$comment,
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
    print RESET;
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
	comment_line($line);
      } else {
        print $line;
      }
    } elsif ($after) {
      if ($tm > $comment_date) {
	comment_line($line);
      } else {
        print $line;
      }
    } else {
      if ($tm == $comment_date) {
	comment_line($line);
      } else {
        print $line;
      }
    }
    next;
  }
  print $line;
}

sub comment_line {
  if ($color) { print RED; }
  print "## $comment\n";
  my $commented_line = $_[0];
  print "#$commented_line";
  if ($commented_line =~ /\\\s*\n/) { $commented=1; }
}
