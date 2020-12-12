#!/usr/bin/perl -w

our $nextla=2.72*5;

my $STDCELLLIB=$ENV{'STDCELLLIB'} || "/home/philipp/libresilicon/StdCellLib";

foreach my $mag(<$STDCELLLIB/Catalog/*.mag>)
{
  next if((-s $mag)<=50);
  #print `ls -la $mag`;
  my $cell=$mag; $cell=~s/\.mag$/.cell/;
  next unless(-f $cell);
  my $name=""; $name=$1 if($mag=~m/([\w\-\.]+)\.mag$/);
  print "$name ".(46-0.46*12)." $nextla N\n";
  $nextla+=2.72*2;
}
