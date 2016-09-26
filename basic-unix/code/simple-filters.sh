#!/usr/bin/env bash

fileOne=simple-filters-1.txt
fileTwo=simple-filters-2.txt
fileThr=simple-filters-3.txt
fileFou=simple-filters-4.txt
# 18 rows and 50 columns works for fontsize=\footnotesize
width=50

echo "$ cat states.txt" > $fileOne
echo "" >> $fileOne

echo "$ # head -n 5 states.txt" >> $fileOne
echo "$ head -5 states.txt" >> $fileOne
head -5 ../examples/states.txt | fold -w $width >> $fileOne
echo "" >> $fileOne

echo "$ tail -1 states.txt" >> $fileOne
tail -1 ../examples/states.txt | fold -w $width >> $fileOne
echo "" >> $fileOne

echo "$ tail -50 states.txt | sort | tail -1" >> $fileOne
tail -50 ../examples/states.txt | sort | tail -1 >> $fileOne
echo "" >> $fileOne

echo "$ cat names.txt" > $fileTwo
echo "" >> $fileTwo

echo "$ sort !!:1" >> $fileTwo
echo "" >> $fileTwo

echo "$ sort --key 2 names.txt" >> $fileTwo
echo "" >> $fileTwo

echo "$ !! --ignore-case --unique" >> $fileTwo
echo "" >> $fileTwo

echo "$ # What if I want to count the entries?" >> $fileTwo
echo "" >> $fileTwo

echo "$ # Sorted, unique, and all uppercase" >> $fileTwo
echo "$ !s | tr [:lower:] [:upper:]" >> $fileTwo
echo "" >> $fileTwo

echo "$ cat names.txt | tr [a-z] [A-Z] | sort -u" >> $fileTwo
echo "" >> $fileTwo

echo "$ tr [a-z] [A-Z] < names.txt | sort -u" >> $fileTwo
echo "" >> $fileTwo

#echo "$ echo \"Hello      World\" | tr -s [:space:]" >> $fileTwo
#echo \"Hello      World\" | tr -s [:space:] >> $fileTwo
#echo "" >> $fileTwo

echo "$ echo \"Leeeeeeeeeeeeeeeeeeeeemon\" | tr -s 'e' 'e'" >> $fileTwo
echo \"Leeeeeeeeeeeeeeeeeeeeemon\" | tr -s 'e' 'e' >> $fileTwo
echo "" >> $fileThr

echo "$ grep \"Alaska\" states.txt" > $fileThr
grep Alaska ../examples/states.txt >> $fileThr
echo "" >> $fileThr

echo "$ awk '{print \$1}' names.txt | tail -6" >> $fileThr
awk '{print $1}' ../examples/names.txt | tail -6 >> $fileThr
echo "" >> $fileThr

echo "$ sed 's/^[Ee]rin/Eryn/' names.txt | tail -6" >> $fileThr
sed 's/^[Ee]rin/Eryn/' ../examples/names.txt | tail -6 >> $fileThr
echo "" >> $fileThr

echo "$ sed 's/[aeiou]/y/g' names.txt | tail -6" > $fileFou
sed 's/[aeiou]/y/g' ../examples/names.txt | tail -6 >> $fileFou
echo "" >> $fileFou

echo "$ sed 's/[aeiou]/y/g' doctored.txt | tail -6" > $fileFou
sed 's/[aeiou]/y/g' ../examples/doctored.txt | tail -6 >> $fileFou
echo "" >> $fileFou
