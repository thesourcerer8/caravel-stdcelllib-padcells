cp -f orig/*.lef .
sed -i "s/SYMMETRY X Y R90/SITE unithd/" *.lef
sed -i "s/SITE CORE/SYMMETRY X Y R90/" *.lef
sed -i "s/metal2/met2/" *.lef
sed -i "s/VDD/vdd/" *.lef
sed -i "s/GND/gnd/" *.lef

