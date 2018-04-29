# Read from the file file.txt and print its transposed content to stdout.
#!/bin/bash

declare -A matrix

filename=file.txt
totalCol=$(awk '{print NF; exit}' $filename)
totalRow=$(cat $filename | wc -l)

i=0
while read -r line; do
  words=($line)
  for ((j=0; j < ${#words[@]}; j++)) do
    matrix["$i,$j"]=${words[j]}
  done
  ((i++))
done < $filename

for ((i=0; i < $totalCol; i++)) do
  for ((j=0; j < $totalRow; j++)) do
    if [ $j -eq $((totalRow - 1)) ]; then
      echo -n "${matrix["$j,$i"]}"
    else
      echo -n "${matrix["$j,$i"]} "
    fi
  done
  echo ""
done
