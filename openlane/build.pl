#!/usr/bin/perl -w
$ENV{'OPENLANE_ROOT'}="/media/philipp/Daten/skywater/openlane/";
$ENV{'PDK_ROOT'}="/media/philipp/Daten/skywater/open_pdks/sky130/";

sub readfile($)
{
  if(open MYRIN,"<$_[0]")
  {
    my $old=$/;
    undef $/;
    my $content=<MYRIN>;
    close MYRIN;
    $/=$old;
    return $content;
  }
  return undef;
}

open OUT,">build.html";
print OUT "<html><body>";
print OUT "<h1>Reports:</h1><br/>";

sub processfile($)
{
  my $res=$_[0];	
  $res=~s/Error: cannot open '\/\.openroad'\.//g;
  $res=~s/Error: cannot open '\/\.sta'\.//g;
  $res=~s/Warning: Calma reading is not undoable!  I hope that's OK.//g;
  $res=~s/\&/&amp;/g;
  $res=~s/\r//g;
  $res=~s/\x1b\[31m/<div style="background:#ff8080;display:inline">/g;
  $res=~s/\x1b\[33m/<div style="background:#c0ffc0;display:inline">/g;
  $res=~s/\x1b\[36m/<div style="background:#c0c0ff;display:inline">/g;
  $res=~s/\x1b\[32m/<div style="background:#c0c0ff;display:inline">/g;
  $res=~s/\x1b\[37m/<\/div>/g;
  $res=~s/(.*success.*)/<div style="background:#80ff80;display:inline">$1<\/div>/ig;
  $res=~s/(.*finish.*)/<div style="background:#80ff80;display:inline">$1<\/div>/ig;
  $res=~s/(.*error.*)/<div style="background:#ff8080;display:inline">$1<\/div>/ig;
  $res=~s/(.*fail.*)/<div style="background:#ff8080;display:inline">$1<\/div>/ig;
  $res=~s/(.*warn.*)/<div style="background:#ff8080;display:inline">$1<\/div>/ig;
  print OUT $res;
}


if(scalar(@ARGV))
{
  foreach(@ARGV)
  {
    next unless(-d $_);
    print OUT "<h2>Submodule: $_</h2>\n<pre>";
    my $res=`make $_ 2>&1`;
    processfile($res);
  }
}
else
{
  foreach("user_proj_example","user_project_wrapper")
  {
    next unless(-d $_);
    print "$_\n";

    print OUT "<h2>Submodule: $_</h2>\n<pre>";
    foreach my $log(<$_/runs/$_/logs/*.log>,<$_/runs/$_/logs/*/*.log>)
    {
      print OUT "<h3>$log</h3>\n";
      my $res=readfile($log);
      processfile($res);
    }
    print OUT "</pre><br/>";
  }
}
print OUT "</body></html>";
system "firefox build.html &";
