#!/usr/bin/perl
use strict;
use warnings;

my $filename = shift(@ARGV) or die "You need to specify filename!\n";

open (FILE, $filename) or die "Could not open file $filename\n";

while (my $line = <FILE>) {
  if (($line =~ /^\s*#/) or ($line =~ /^\s*$/)) { next; }
  print $line;
}
