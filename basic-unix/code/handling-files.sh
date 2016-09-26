#!/usr/bin/env bash

fileOne=handling-files-1.txt
fileTwo=handling-files-2.txt
fileThr=handling-files-3.txt
fileFou=handling-files-4.txt
# 18 rows and 50 columns works for fontsize=\footnotesize
width=50

echo "$ cat states.txt" > $fileOne
echo "" >> $fileOne

echo "$ less states.txt" >> $fileOne
echo "" >> $fileOne

echo "$ # arrow keys move around" >> $fileOne
echo "" >> $fileOne
echo "$ # '/' searches, try searching for Alaska" >> $fileOne
echo "" >> $fileOne
echo "$ # 'G' takes you to bottom" >> $fileOne
echo "" >> $fileOne
echo "$ # 'g' takes you to top" >> $fileOne
echo "" >> $fileOne
echo "$ # 'q' quits" >> $fileOne
echo "" >> $fileOne

echo "$ cat states.txt | wc" >> $fileOne
cat ../examples/states.txt | wc >> $fileOne
echo "" >> $fileOne

echo "$ wc -l states.txt" >> $fileOne
wc -l ../examples/states.txt | sed 's/\.\.\/examples\///' >> $fileOne
echo "" >> $fileOne

#echo "$ stat states.txt" >> $fileOne
#stat ../examples/states.txt | sed 's/\.\.\/examples\///' >> $fileOne
#echo "" >> $fileOne

echo "$ ls -l hello.py" > $fileTwo
ls -l ../examples/hello.py | sed 's/\.\.\/examples\///' | fold -w $width >> $fileTwo
echo "" >> $fileTwo

cp ../examples/hello.py .
echo "$ chmod u+x,g+wx,o+rwx hello.py" > $fileThr
chmod u+x,g+wx,o+rwx hello.py
echo "$ ls -l hello.py" >> $fileThr
ls -l hello.py | fold -w $width >> $fileThr
chmod u-x,g-wx,o-rwx hello.py
echo ""
rm hello.py

echo "$ # Concatenate two files" > $fileFou
echo "$ cat states.txt names.txt" >> $fileFou
echo "" >> $fileFou
echo "$ # Cut a space delimited file into columns, keep #1" >> $fileFou
echo "$ cut -d\\  -f1 states.txt" >> $fileFou 
echo "$ cut -d' ' -f1 states.txt" >> $fileFou 
echo "" >> $fileFou
echo "$ # Similar to cat, but side-by-side" >> $fileFou
echo "$ paste states.txt states.txt" >> $fileFou
echo "" >> $fileFou
echo "$ # Numbering lines" >> $fileFou
echo "$ cat -n states.txt" >> $fileFou
echo "" >> $fileFou
echo "$ nl states.txt" >> $fileFou
echo "" >> $fileFou
