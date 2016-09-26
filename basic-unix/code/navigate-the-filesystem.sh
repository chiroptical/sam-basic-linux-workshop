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
cd ../examples
pwd | fold -w $width >> ../code/$fileOne
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

echo "$ # Find files greater than 1GB" >> $fileTwo
echo "$ find . -size +1G" >> $fileTwo
echo "" >> $fileTwo

echo "$ find . -name \"*.txt\" -or -name \"*.py\"" >> $fileTwo
find ../examples -name "*.txt" -o -name "*.py" | sed 's/\.\.\/examples\///' | tr '\n' ' ' | fold -w $width >> $fileTwo
echo "" >> $fileTwo

echo "$ df -h" > $fileThr
df -h >> $fileThr
echo "" >> $fileThr

echo "$ du -sh *" >> $fileThr
cd ../examples
du -sh * >> ../code/$fileThr
cd -
echo "" >> $fileThr

echo "$ free -g" >> $fileThr
echo " not available on Mac (I use \`hostinfo | grep memory\` below)" | fold -w $width | sed 's/^/#/' >> $fileThr
if [ $(uname) == "Darwin" ]; then
    hostinfo | grep "memory" >> $fileThr
elif [ $(uname) == "Linux" ]; then
    free -g >> $fileThr
fi
echo "" >> $fileThr

echo "$ htop # if on cluster, or have it installed" >> $fileThr 
