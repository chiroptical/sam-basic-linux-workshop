#!/usr/bin/env bash

fileOne=general-purpose-utilities-1.txt
fileTwo=general-purpose-utilities-2.txt
# 18 rows and 50 columns works for fontsize=\footnotesize
width=50

echo "$ date" > $fileOne
date >> $fileOne
echo "" >> $fileOne

echo "$ who" >> $fileOne
who >> $fileOne
echo "" >> $fileOne

echo "$ uname -a" >> $fileOne
uname -a | fold -w $width >> $fileOne
echo "" >> $fileOne

echo "$ echo \"hello world\"" >> $fileOne
echo "hello world" >> $fileOne
echo "" >> $fileOne

echo "$ echo \"3.14159 * sqrt(2.0)\" | bc" > $fileTwo
echo "3.14159 * sqrt(2.0)" | bc >> $fileTwo
echo "" >> $fileTwo

echo "$ man bc" >> $fileTwo
echo "" >> $fileTwo

echo "$ time echo \"3.14159 * sqrt(2.0)\" | bc" >> $fileTwo
(time echo "3.14159 * sqrt(2.0)" | bc) >> $fileTwo 2>&1
echo "" >> $fileTwo
