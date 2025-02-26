#!/bin/bash
echo "backing up nemesis block"
mv data/00000/00001.dat data/00000/hashes.dat /tmp

echo "deleting data directory"
for dir in data/*; do
    rm -rf $dir
done

echo "restoring nemesis block..."
mkdir data/00000
mv /tmp/00001.dat /tmp/hashes.dat data/00000/
if [ ! -f "data/index.dat" ]; then
            echo "No index.dat file, creating now...."
            echo -ne "\01\0\0\0\0\0\0\0" > data/index.dat
fi
echo "data has been reset to nemesis block"
