#!/usr/bin/perl -w

open IN,"<libresilicon.lib";
undef $/;
my $content=<IN>;
$content=~s/area/pg_pin (vdd) { voltage_name : "vdd"; pg_type : "primary_power"; } pg_pin (gnd) { voltage_name : "gnd"; pg_type : "primary_ground"; } area/g;

#$content=~s/"\s*\n/"/gs;
#$content=~s/;\s*\n/;/gs;
$content=~s/\n//gs;
$content=~s/\\//gs;



print $content;
