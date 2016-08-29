#!/usr/bin/env bash

fileOne=handling-files-1.txt
fileTwo=handling-files-2.txt
# 18 rows and 50 columns works for fontsize=\footnotesize
width=50

echo "$ less states.txt" > $fileOne
echo "" >> $fileOne

echo "$ cat states.txt" >> $fileOne
echo "" >> $fileOne

echo "$ cat states.txt | wc" >> $fileOne
cat ../examples/states.txt | wc >> $fileOne
echo "" >> $fileOne
