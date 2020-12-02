#!/usr/bin/perl -w
open IN,"<user_proj_example/runs/user_proj_example/config.tcl";
open OUT,">config.sh";
while(<IN>)
{
  s/^set\s+::env\(([^) ]+)\)\s+([\w.\-\/]+)/export $1="$2"/;
  s/^set\s+::env\(([^) ]+)\)\s+"([^"]+)"/export $1="$2"/;
  s/^set\s+::env\(([^) ]+)\)\s+(\[.*?\])/export $1="$2"/;

  print OUT $_;
}
close IN;
close OUT;
print "config.sh has been written.\n";
