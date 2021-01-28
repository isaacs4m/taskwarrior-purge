#!/bin/bash
task all | awk '{if ($2 == "D") {print $3}}' > new_tmp.txt
while read p; do
  yes | task $p purge
done <new_tmp.txt
rm new_tmp.txt

task all | awk '{if ($2 == "C") {print $3}}' > new_tmp.txt
while read p; do
  echo "y" | task $p delete
done <new_tmp.txt

while read p; do
  yes | task $p purge
done <new_tmp.txt
rm new_tmp.txt
