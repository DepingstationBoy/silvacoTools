#!/bin/bash

EXTRACT=quick_extract.in
RESULTS=results.yindefu
SILVACO_RESULTS=results.final
SILVACO_RUNLOG=extract.bv.run.log

if [ -e "$EXTRACT" ]; then
    rm $EXTRACT
fi

if [ -e "$SILVACO_RESULTS" ]; then
	rm $SILVACO_RESULTS
fi

if [ -e "$RESULTS" ]; then
    rm $RESULTS
fi

if [ -e "$SILVACO_RUNLOG" ]; then
    rm $SILVACO_RUNLOG
fi

LOG=$(ls *K.log)
LOG_ARRAY=($LOG)
for each in ${LOG_ARRAY[@]}
do
    echo "extract init inf=\"$each\"" >> $EXTRACT
    echo "extract name=\"${each} BV \" max(v.\"drain\")" >> $EXTRACT
done
deckbuild -run -ascii $EXTRACT -outfile $SILVACO_RUNLOG
awk '{print $1 "\t" substr($3, 2, 4)}' $SILVACO_RESULTS >> $RESULTS
cat $RESULTS

exit 0
