#!/bin/bash
echo "running prepost"
#/opt/lsprepost/lsprepost4.0_centos6/lspp4 c=processingScriptNewEBSDRefine2 -nographics &> /dev/null
#/opt/lsprepost/lsprepost4.0_centos6/lspp4 c=CSVget -nographics 
/software/LSPP/lspp46 c=$1 -nographics

echo "Parsing data"
for file in ./data*; do 
echo $file
grep -vi "^[a-z]" "$file" > "$file.tmp" && mv "$file.tmp" "$file"
done
