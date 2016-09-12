#!/usr/bin/env bash

fileOne=handling-files-1.txt
fileTwo=handling-files-2.txt
fileThr=handling-files-3.txt
fileFou=handling-files-4.txt
# 18 rows and 50 columns works for fontsize=\footnotesize
width=50

echo "$ less states.txt" > $fileOne
echo "" >> $fileOne

echo "$ cat states.txt" >> $fileOne
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

echo "$ ls -lh hello.py" > $fileTwo
ls -lh ../examples/hello.py | sed 's/\.\.\/examples\///' | fold -w $width >> $fileTwo
echo "" >> $fileTwo

cp ../examples/hello.py .
echo "$ chmod u+x,g+wx,o+rwx hello.py" > $fileThr
chmod u+x,g+wx,o+rwx hello.py
echo "$ ls -l hello.py" >> $fileThr
ls -l hello.py | fold -w $width >> $fileThr
chmod u-x,g-wx,o-rwx hello.py
echo ""
rm hello.py

echo "$ cat states.txt names.txt" > $fileFou
echo "$ cut -d\\  -f1 states.txt" >> $fileFou 
echo "$ paste states.txt states.txt" >> $fileFou
echo "$ nl states.txt" >> $fileFou
