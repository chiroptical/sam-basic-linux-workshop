#!/usr/bin/env bash

fOne=compression-1.txt
fTwo=compression-2.txt
fThr=compression-3.txt
fFou=compression-4.txt
# 18 rows and 50 columns works for fontsize=\footnotesize
width=50

echo "# Compress a file" > $fOne
echo "$ gzip states.txt" >> $fOne
echo "" >> $fOne
echo "# What happened to states.txt?" >> $fOne
echo "" >> $fOne
echo "$ gunzip states.txt" >> $fOne
echo "" >> $fOne

echo "# Archive with tar and compress with gzip" >> $fOne
echo "$ tar zcvf archive.tar.gz *" >> $fOne
echo "" >> $fOne

echo "# Archive with tar and compress with bzip2" >> $fOne
echo "$ tar jcvf archive.tar.bz2 *" >> $fOne
echo "" >> $fOne
