#!/usr/bin/env bash

fileOne=ssh-config-1.txt
fileTwo=ssh-config-2.txt
# 18 rows and 50 columns works for fontsize=\footnotesize
width=50

echo "# Standard ssh and scp" > $fileOne
echo "$ ssh bmooreii@frank.sam.pitt.edu" >> $fileOne
echo "$ scp <somelocalfile> bmooreii@pitt.edu:~" >> $fileOne
echo "$ scp bmooreii@pitt.edu:<someremotefile> ." >> $fileOne
echo "" >> $fileOne

echo "# Put this into ~/.ssh/config" >> $fileOne
echo "Host frank mpi htc" >> $fileOne
echo "  User bmooreii" >> $fileOne
echo "  HostName %h.sam.pitt.edu" >> $fileOne
echo "  ForwardX11 yes" >> $fileOne
echo "" >> $fileOne

echo "# Passwordless SSH" >> $fileOne
echo "$ ssh-keygen" >> $fileOne
echo "$ cat ~/.ssh/id_rsa.pub | ssh frank 'cat >> ~/.ssh/authorized_keys'" | fold -w $width >> $fileOne
echo "" >> $fileOne

echo "# Compressed SSH data transfer" >> $fileOne
echo "$ scp -C frank:<someremotefile> ." >> $fileOne
echo "$ rsync -e ssh -avz frank:<someremotefile> ." >> $fileOne
echo "" >> $fileOne
