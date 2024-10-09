#!/bin/bash

array=("string1" "string2" "string3") # create an array variable


#------------------------------------------------ FOR LOOP REFRESHER ------------------------------------------------

# Loop through numbers 1 through 10, add them all up, print the sum
for i in {1..10}; do
    ((sum+=$i))
    echo "The sum of all the numbers thus far: $sum"
done

echo

# Loop through the array, print out each item's length
for item in "${array[@]}"; do
    echo Item length is ${#item}
done

echo


#------------------------------------------------ WHILE LOOPS ------------------------------------------------

# While a is less than 10, print a and add 1 
a=0
while [[ $a -lt 10 ]]
do
   echo a is currently $a
   ((a++))
done

echo

# Read each line in example2.fasta, find the character count of that line, add it to the sum, and print it all out.
while read line
do
    chars=$(echo $line | wc -c)
	sums=$((sums+chars))

	echo The sum of all the characters in the file is $sums
done < example2.fasta

echo

#------------------- Cool While Loop Uses -------------------

# BREAKS: End the while loop when the user enters -1, otherwise keep adding two numbers
while :
do
	read -p "Enter two numbers (-1 to quit): " a b

	if [[ $a -eq -1 ]]
	then
		break
	fi

	ans=$((a+b))
	echo The sum is "$ans"
done

echo

# SLEEP: If the directory is not found, print the date and "still waiting" and wait for 3 seconds
# 		 If the while loop finishes, print that the directory was found (Ctrl-C to exit if it doesn't finish)
directory_expected="test"

while [[ ! -d $directory_expected ]]
do
   echo "`date` - Still waiting" 
   sleep 3
done

echo "Directory exists!"

# READ: Write content into a file. Press Enter, Ctrl-D when you are done typing the file contents
echo -n "Enter the filename to create: "
read filename			# Take the filename that will be created

while read line			# Read the content of the file from the terminal
do
    echo $line >> $filename
done

# INFINITE: Press Ctrl+C to get out of the loop/end the script
#while :
#do
#  echo "An Infinite loop"
#done


#------------------------------------------------ UNTIL LOOPS ------------------------------------------------

# Until a is NOT less than 10, print a and add 1 
a=0
until [[ ! $a -lt 10 ]]
do
   echo a is $a
   ((a++))
done

echo

#------------------- Cool Until Loop Uses -------------------

# INFINITE LOOP: Until condition is true, print the iteration number, increment the iteration number, and wait 1 second
# 				 This loop will never end since the condition is hard coded to false. Press Ctrl-C to end the loop
con=false
itnum=0
#until $con
#do
#    echo "Iteration no: $itnum"
#    ((itnum++))
#    sleep 1
#done

# Read each line in example2.fasta, find the character count of that line, add it to the sum, and print it all out.
# Has the exact same functionality as the while loop shown above
until ! read line
do 
    chars2=$(echo $line | wc -c)
	sum2=$((sum2+chars2))

	echo The sum of all the characters in the file is $sum2
done < example2.fasta

# READ: Write content into a file. Press Enter, Ctrl-D when you are done typing the file contents
echo -n "Enter the filename to create: "
read filename				# Take the filename that will be created

until ! read line			# Read the content of the file from the terminal
do
    echo $line >> $filename
done