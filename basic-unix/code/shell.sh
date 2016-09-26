#!/usr/bin/env bash

fileOne=shell-1.txt
fileTwo=shell-2.txt
fileThr=shell-3.txt
fileFou=shell-4.txt
# 18 rows and 50 columns works for fontsize=\footnotesize
width=50

echo "$ for i in \$(seq 1 20); do touch \$i.txt; done" > $fileOne
#for i in $(seq 1 20); do touch $i.txt; done
echo "" >> $fileOne

echo "$ # Globbing" >> $fileOne
echo "$ ls *.txt" >> $fileOne
echo "$ ls ?.txt" >> $fileOne
echo "$ ls ??.txt" >> $fileOne
echo "" >> $fileOne

echo "$ # Globbing Sequences" >> $fileOne
echo "ls {1..10}.txt" >> $fileOne 
echo "ls {1,3,10}.txt" >> $fileOne 
echo "" >> $fileOne

echo "$ # Escaping Characters" >> $fileOne
echo "$ echo '\" \$  \"'" >> $fileOne 
echo "\" \$ \"" >> $fileOne
echo "$ echo \"\\\" \$  \\\"\"" >> $fileOne 
echo "\" \$ \"" >> $fileOne

#for i in $(seq 1 20); do rm $i.txt; done

echo "$ # Redirect output to file" > $fileTwo
echo "$ sed 's|[aeiou]|y|g' doctored.txt > skynyrded.txt" >> $fileTwo
echo "" >> $fileTwo

echo "$ # Append output to file" >> $fileTwo
echo "$ sed 's|[aeiou]|y|g' doctored.txt >> skynyrded.txt" >> $fileTwo
echo "" >> $fileTwo

echo "$ # Redirect error to file" >> $fileTwo
echo "$ sed 's|[aeiou]|y|g' doctored.txt 2> error.txt" >> $fileTwo
echo "" >> $fileTwo

echo "$ # Redirect error to standard output" >> $fileTwo
echo "$ sed 's|[aeiou]|y|g' doctored.txt > stdout.txt 2>&1" >> $fileTwo
echo "" >> $fileTwo

echo "$ # The 'tee' command" >> $fileTwo
echo "$ sed 's|[aeiou]|y|g' doctored.txt | tee stdout.txt" >> $fileTwo
echo "" >> $fileTwo
