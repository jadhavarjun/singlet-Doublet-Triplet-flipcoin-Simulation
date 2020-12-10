#!/bin/bash -x

echo "Welcome to filp coin simulation Wining percentage"

HEADS=1
TAILS=0

simulationResult=$((RANDOM%2))

if [ $simulationResult -eq $HEADS ]
then
	echo "heads is the result"
else
	echo "tails is result"
fi
