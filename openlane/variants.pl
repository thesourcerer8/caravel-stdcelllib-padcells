#!/usr/bin/perl -w

foreach my $PL_BASIC_PLACEMENT (0,1)
{
  foreach my $CELL_PAD (0,1)
  {  
    foreach my $DIODE_INSERTION_STRATEGY (0,1)
    {
      foreach my $PL_RANDOM_GLB_PLACEMENT (0,1)
      {
        foreach my $PL_SKIP_INITIAL_PLACEMENT (0,1)
        {
	  foreach my $PDN (0,1)
          {

my $variant="$PL_BASIC_PLACEMENT-$CELL_PAD-$DIODE_INSERTION_STRATEGY-$PL_RANDOM_GLB_PLACEMENT-$PL_SKIP_INITIAL_PLACEMENT-$PDN";

print "$variant\n";
open OUT,">user_proj_example/variant.tcl";		  
print OUT <<EOF
set ::env(PL_BASIC_PLACEMENT) $PL_BASIC_PLACEMENT
set ::env(CELL_PAD) $CELL_PAD
set ::env(DIODE_INSERTION_STRATEGY) $DIODE_INSERTION_STRATEGY
set ::env(PL_RANDOM_GLB_PLACEMENT) $PL_RANDOM_GLB_PLACEMENT
set ::env(PL_SKIP_INITIAL_PLACEMENT) $PL_SKIP_INITIAL_PLACEMENT
EOF
;
if($PDN)
{
print OUT <<EOF		 
set ::env(FP_PDN_VOFFSET) 4
set ::env(FP_PDN_VPITCH) 15
set ::env(FP_PDN_HOFFSET) 4
set ::env(FP_PDN_HPITCH) 15

EOF
;
}
close OUT;

mkdir "variants";
system "make user_proj_example 2>&1 >variants/$variant.log";

#exit;

          }
        }
      }
    }
  }
}
