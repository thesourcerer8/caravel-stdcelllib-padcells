#!/usr/bin/perl -w
$ENV{'OPENLANE_ROOT'}="/media/philipp/Daten/skywater/openlane/";
$ENV{'PDK_ROOT'}="/media/philipp/Daten/skywater/open_pdks/sky130/sky130A";

open OUT,">build.html";

print OUT "<html><body>";

print OUT "<h1>Reports:</h1><br/>";

foreach(scalar(@ARGV) ? @ARGV : <*>)
{
  next unless(-d $_);
  print "$_\n";

  print OUT "<h2>Submodule: $_</h2>\n<pre>";
  my $res=`make $_ 2>&1`;
  $res=~s/\&/&amp;/g;
  $res=~s/\r//g;
  $res=~s/\x1b\[31m/<div style="background:#ff8080;display:inline">/g;
  $res=~s/\x1b\[33m/<div style="background:#c0ffc0;display:inline">/g;
  $res=~s/\x1b\[36m/<div style="background:#c0c0ff;display:inline">/g;
  $res=~s/\x1b\[37m/<\/div>/g;
  $res=~s/(.*success.*)/<div style="background:#80ff80;display:inline">$1<\/div>/ig;
  $res=~s/(.*finish.*)/<div style="background:#80ff80;display:inline">$1<\/div>/ig;
  $res=~s/(.*error.*)/<div style="background:#ff8080;display:inline">$1<\/div>/ig;
  $res=~s/(.*fail.*)/<div style="background:#ff8080;display:inline">$1<\/div>/ig;
  $res=~s/(.*warn.*)/<div style="background:#ff8080;display:inline">$1<\/div>/ig;


  print OUT $res;
  print OUT "</pre><br/>";
}
print OUT "</body></html>";

system "firefox build.html &";
