#!/usr/bin/perl -w


foreach my $lef (<*.lef>)
{
  my $mag="../mag/orig/$lef"; $mag=~s/\.lef$/\.mag/;

  open LEFIN,"<orig/$lef";
  open LEFOUT,">$lef";
  while(<LEFIN>)
  {
    s/SYMMETRY X Y R90/SITE unithd/;
    s/SITE CORE/SYMMETRY X Y R90/;
    s/metal2/met2/;
    s/VDD/vdd/;
    s/GND/gnd/;

    print LEFOUT $_;	   
    #print $_;
    if(m/FOREIGN/)
    {
      open IN,"<$mag";
      while(<IN>)
      {
        if(m/rect 0 0 (\d+) (\d+)/)
        {
          my $h=$1;
          my $w=$2;
          print "$lef -> ".($1/100.0)." ".($2/100.0)."\n";
	  print LEFOUT " SIZE ".($1/100.0)." BY ".($2/100.0)." ;\n";
        }
      }
      close IN;
    }
  }
  close LEFOUT;
  close LEFIN;
}
