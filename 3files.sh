# Clear output file
printf "" > output.gcode

COUNT=0

for FILE in "$@"
do
  echo $FILE $COUNT
  case $COUNT in
    0)
      printf "\n\nBLOCK\n\n" >> output.gcode
      ;;
    1)
      printf "\n\n1BLOCK\n\n" >> output.gcode
      ;;
    2)
      printf "\n\n2BLOCK\n\n" >> output.gcode
      ;;
    *) ;;
  esac
  sed -n -e '/^G00\|^G01/p' $FILE >> output.gcode
  ((COUNT += 1))
done
echo "DONE."
