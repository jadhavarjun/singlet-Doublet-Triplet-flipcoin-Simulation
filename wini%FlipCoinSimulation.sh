#!/bin/bash 

echo "Welcome to filp coin simulation Wining percentage"
read -p "number of times simulation should run:" number

declare -A resultsDicn
declare -A perDicn

heads=H
tails=T
#uc3 addind doublet to filpcoin simulation
singlet=1
doublet=2
echo "0:tails and 1:heads"

for (( n=1; n<=$doublet; n++ )) 
do
	counter=0
	while [ $counter -lt $number ]
	do
		var=""
		for (( i=0; i<$n; i++))
   	do
   		simulationResult=$((RANDOM%2))

   		if [ $simulationResult -eq 1 ]
   		then
      		result=$heads
   		else
      		result=$tails
   		fi
   		var=$result$var
   	done
	resultsDicn[$counter]=$var
	((counter++))
	done

	echo "result from flip coin simulation :${resultsDicn[@]}"
	declare -A uniqDicn

	for value in ${resultsDicn[@]}
	do 
		uniqDicn[$value]=$n
	done
		echo "uniq results from simulation :${!uniqDicn[@]}:${uniqDicn[@]}"

	for resultInUniq in ${!uniqDicn[@]}
	do 

		if [ $n -eq ${uniqDicn[$resultInUniq]} ]
		then
 			count=0
   		for key in ${!resultsDicn[@]}
   		do
      		if [ ${resultsDicn[$key]} == $resultInUniq ]
      		then
         	((count++))
      		fi
   		done
   	percentage=$(($count*100/$number))
   	echo "$resultInUniq is $percentage%"
		perDicn[$resultInUniq]="$percentage"
		fi
	done
done
echo "percentage  dictionary:${perDicn[@]}"
echo "uniq comibinations occured in dictionary:${!perDicn[@]}"

