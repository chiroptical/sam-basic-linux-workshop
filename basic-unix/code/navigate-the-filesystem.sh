#!/usr/bin/env bash

fileOne=navigate-the-filesystem-1.txt
fileTwo=navigate-the-filesystem-2.txt
fileThr=navigate-the-filesystem-3.txt

width=50

## Clean the compilation directory, to clean up output
#files=(
#.aux
#.log
#.nav
#.out
#.pdf
#.snm
#.toc
#)
#for i in ${files[@]}; do
#    rm ../*$i
#done
#rm -r ../_minted-Basic_Unix_Linux

echo "$ pwd" > $fileOne
cd ..
pwd | fold -w $width >> code/$fileOne
cd -
echo "" >> $fileOne

echo "$ ls" >> $fileOne
ls ../examples | sed 's/\.\.\/examples//' >> $fileOne
echo "" >> $fileOne

echo "$ mkdir test; ls" >> $fileOne
mkdir ../examples/test
ls -w $width ../examples >> $fileOne
rm -r ../examples/test
echo "" >> $fileOne

echo "$ find . -name states.txt" > $fileTwo
find ../examples -name states.txt | sed 's/\.\.\/examples\///' >> $fileTwo
echo "" >> $fileTwo

echo "$ find . -type f" >> $fileTwo
find ../examples -type f | sed 's/\.\.\/examples\///' | column -c $width >> $fileTwo
echo "" >> $fileTwo

#echo "$ find . -type d" >> $fileTwo
#find .. -type d | sed 's/\.\.\///' >> $fileTwo
#echo "" >> $fileTwo

echo "$ df -h" > $fileThr
df -h >> $fileThr
echo "" >> $fileThr

echo "$ du -s *" >> $fileThr
cd ../examples
du -s * >> ../code/$fileThr
cd -
echo "" >> $fileThr
