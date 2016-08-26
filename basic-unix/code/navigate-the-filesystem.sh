#!/usr/bin/env bash

fileOne=navigate-the-filesystem-1.txt
fileTwo=navigate-the-filesystem-2.txt
fileThr=navigate-the-filesystem-3.txt

width=50

# Clean the compilation directory, to clean up output
files=(
.aux
.log
.nav
.out
.pdf
.snm
.toc
)
for i in ${files[@]}; do
    rm ../*$i
done
rm -r ../_minted-Basic_Unix_Linux

echo "$ pwd" > $fileOne
cd ..
pwd | fold -w $width >> code/$fileOne
cd -
echo "" >> $fileOne

echo "$ ls" >> $fileOne
ls .. >> $fileOne
echo "" >> $fileOne

echo "$ mkdir test; ls" >> $fileOne
mkdir ../test
ls -w $width .. >> $fileOne
rm -r ../test
echo "" >> $fileOne

echo "$ find . -name states.txt" > $fileTwo
find .. -name states.txt >> $fileTwo
echo "" >> $fileTwo

echo "$ find . -type f" >> $fileTwo
find .. -type f | sed 's/\.\.\///' | column -c $width >> $fileTwo
echo "" >> $fileTwo

echo "$ find . -type d" >> $fileTwo
find .. -type d | sed 's/\.\.\///' >> $fileTwo
echo "" >> $fileTwo

echo "$ df -h" > $fileThr
df -h >> $fileThr
echo "" >> $fileThr

echo "du -sh *" >> $fileThr
cd ..
du -sh * >> code/$fileThr
cd -
echo "" >> $fileThr
