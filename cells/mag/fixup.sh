cp -f orig/*.mag .
sed -i "s/<< bound >>/<< properties >>/" *.mag
sed -i "s/rect 0 0 /string FIXED_BBOX 0 0 /" *.mag

