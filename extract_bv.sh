#!/bin/bash

extractf=extract.in
resultsf=results.final

if [[ -e $extractf ]]; then
    rm $extractf
fi
if [[ -e $resultsf ]]; then
    rm $resultsf
fi

for logf in $(ls *.log)
do
    num=$(echo $(echo $logf | cut -d . -f1) | cut -d _ -f2)
    echo "extract init inf=\"$logf\"" >> $extractf
    echo "extract name=\"$num\" x.val from curve(abs(v.\"cathode\"),abs(i.\"anode\")) where y.val=1e-10" >> $extractf
done
deckbuild -run -ascii $extractf 
echo "d,bv" > bv.csv
cat $resultsf | tr -s "\n" | awk -F = '{print $1","$2}' >> bv.csv
