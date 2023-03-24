sed -n -e '/^G00 X/p' $1 > viaoutput.gcode
sed -i 's/G00/LOBIN/g' viaoutput.gcode