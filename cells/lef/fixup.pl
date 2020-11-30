#!/usr/bin/perl -w


foreach my $lef (<orig/*.lef>)
{
  $lef=~s/^orig\///;	
  my $mag="../mag/$lef"; $mag=~s/\.lef$/\.mag/;
  print "$lef\n";
  open LEFIN,"<orig/$lef";
  open LEFOUT,">$lef";
  while(<LEFIN>)
  {
    s/SYMMETRY X Y R90/SITE unithd/;
    s/SITE CORE/SYMMETRY X Y R90/;
    #s/SITE unithd.*//;
    s/metal2/met2/;
    s/VDD/vdd/;
    s/GND/gnd/;

    print LEFOUT $_;	   
    #print $_;
    if(m/FOREIGN/)
    {
      if(open(MAG,"<$mag"))
      {
        while(<MAG>)
        {
          if(m/rect 0 0 (\d+) (\d+)/)
          {
            my $h=$1;
            my $w=$2;
            my $factor=0.01;
            print "$lef -> ".($1*$factor)." ".($2*$factor)."\n";
            print LEFOUT " SIZE ".($1*$factor)." BY ".($2*$factor)." ;\n";
          }
          if(m/string FIXED_BBOX 0 0 (\d+) (\d+)/)
          {
            my $h=$1;
            my $w=$2;
            my $factor=0.01;
            print "$lef -> ".($1*$factor)." ".($2*$factor)."\n";
            print LEFOUT " SIZE ".($1*$factor)." BY ".($2*$factor)." ;\n";
          }

	}
        close MAG;
      }
    }
  }
  close LEFOUT;
  close LEFIN;
}
