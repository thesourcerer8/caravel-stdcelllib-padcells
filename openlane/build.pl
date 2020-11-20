#!/usr/bin/perl -w
$ENV{'OPENLANE_ROOT'}="/media/philipp/Daten/skywater/openlane/";
$ENV{'PDK_ROOT'}="/media/philipp/Daten/skywater/open_pdks/sky130/sky130A";

open OUT,">build.html";

print OUT "<html><body>";

print OUT "<h1>Reports:</h1><br/>";

foreach(<*>)
{
  next unless(-d $_);
  print "$_\n";
  print OUT "<h2>Submodule: $_</h2>\n<pre>";
  my $res=`make $_ 2>&1`;
  $res=~s/\&/&amp;/g;
  $res=~s/\x1b\[31m/<div style="background:#ff8080">/g;
  $res=~s/\x1b\[36m/<div style="background:#c0c0ff">/g;
  $res=~s/\x1b\[37m/<\/div>/g;

  $res=~s/(.*success.*)/<div style="background:#80ff80">$1<\/div>/ig;
  $res=~s/(.*finish.*)/<div style="background:#80ff80">$1<\/div>/ig;
  $res=~s/(.*error.*)/<div style="background:#ff8080">$1<\/div>/ig;
  $res=~s/(.*fail.*)/<div style="background:#ff8080">$1<\/div>/ig;
  $res=~s/(.*warn.*)/<div style="background:#ff8080">$1<\/div>/ig;


  print OUT $res;
  print OUT "</pre><br/>";
}
print OUT "</body></html>";

system "firefox build.html &";
