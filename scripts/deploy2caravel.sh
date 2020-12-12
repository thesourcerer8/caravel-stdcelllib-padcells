#!/bin/bash
echo This script needs to be run from the StdCellLib/Catalog directory
CARAVEL=/media/philipp/Daten/skywater/caravel-stdcelllib-stdcells

rm -f $CARAVEL/cells/lib/*.lib $CARAVEL/cells/lef/orig/*.lef $CARAVEL/cells/lef/*.lef $CARAVEL/cells/gds/*.gds $CARAVEL/cells/mag/*.mag

cp *.lib $CARAVEL/cells/lib/
cp outputlib/*.lef $CARAVEL/cells/lef/orig/
cp outputlib/*.gds $CARAVEL/cells/gds/
cp *.mag $CARAVEL/cells/mag/
rm $CARAVEL/cells/mag/demoboard.mag

cd $CARAVEL/cells/lef
perl fixup.pl

cd $CARAVEL/cells/lib
perl removenl.pl >new.lib
mv new.lib libresilicon.lib

perl $CARAVEL/scripts/generator.pl >$CARAVEL/verilog/rtl/user_proj_example.v
perl $CARAVEL/scripts/cells.pl >$CARAVEL/verilog/rtl/user_proj_cells.v
perl $CARAVEL/scripts/placement.pl >$CARAVEL/openlane/user_proj_example/macro_placement.cfg

cd $CARAVEL/openlane
make user_proj_example

echo "Deployment done.";
