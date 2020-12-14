#!/usr/bin/perl -w

foreach my $lef (<orig/*.lef>)
{
  $lef=~s/^orig\///;	
  my $mag="../mag/$lef"; $mag=~s/\.lef$/\.mag/;
  my $cell=$lef; $cell=~s/\.lef//;
  print "$lef\n";
  open LEFIN,"<orig/$lef";
  open LEFOUT,">$lef";
  our $pin="";
  while(<LEFIN>)
  {
    $pin=$1 if(m/PIN (\w+)/);	  
    s/SYMMETRY X Y R90/SITE unithd/;
    s/SITE CORE/SYMMETRY X Y R90/;
    #s/SITE unithd.*//;
    s/metal2/met1/;
    s/VDD/vdd/;
    s/GND/gnd/;
    s/USE SIGNAL/USE POWER/ if($pin eq "VDD");
    s/USE SIGNAL/USE GROUND/ if($pin eq "GND");

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

  open MAGIC,"|magic -dnull -noconsole -T sky130A";
  print MAGIC "lef read $lef\n";
  print MAGIC "load $cell\n";
  print MAGIC "lef write $lef\n";
  print MAGIC "quit\n";
  close MAGIC;
}
