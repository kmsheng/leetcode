# Read from the file file.txt and print its transposed content to stdout.
#!/bin/bash

awk '
{
  for (i = 1; i <= NF; i++) {
    a[NR, i] = $i
  }
}
END {
  for (i = 1; i <= NF; i++) {
    for (j = 1; j <= NR; j++) {
      printf a[j, i] (j == NR ? RS : FS)
    }
  }
}
' file.txt
