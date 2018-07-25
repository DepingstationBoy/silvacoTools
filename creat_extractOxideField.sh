#!/bin/bash

###################################################################
#    File name     : creat_extractOxideField.sh
#    Author        : doggy
#    Date          : 2018年07月25日 星期三 15时30分35秒
#    Description   : 
###################################################################

if [[ -e extract_field.in ]];then
    rm extract_field.in
fi

for file in cimos_??_500K_HighV.str
do
    version=$(echo $(echo $file | cut -d . -f1) | cut -d _ -f2)
    echo "extract init inf=\"cimos_${version}_500K_HighV.str\"" >> extract_field.in
    echo "extract name=\"Field\" curve(depth, impurity=\"Electric Field\" material=\"SiO2\" y.val=-0.02) outfile=\"cimos_${version}_500K_oxide_field.dat\"" >> extract_field.in
done
echo "quit" >> extract_field.in
