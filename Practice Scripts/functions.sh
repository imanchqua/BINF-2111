#!/bin/bash

#------------------------------------------------ BASIC FUNCTIONS ------------------------------------------------

# Method #1: Creating a function
#            Note the parenthesis after the function's name
method1() {
    echo This is a function
}

# Method #2: Creating a function
#            Note the lack of parenthesis and the word function
function method2 {
    echo This is also a function
}

# Calling both functions
method1
method2

# Overriding commands: Make a function that goes by the same name as a preset command, 
#                      but does an enhanced version of that command. 
#                      The word command before ls is essential to this working!
ls() {
    command ls -alh
}

# Calling the function
ls

echo


#------------------------------------------------ ARGUMENTS ------------------------------------------------

# Use $1 and $2 to set arguments in the function that prints 2 numbers, adds them together, and prints the sum
summation() {
    echo Adding $1 to $2
    sum=$(($1 + $2))
    echo $sum
}

summation 2 6   # will add 2+6
summation 3 0   # will add 3+0
summation $1 $2 # will take in two numbers given as parameters when the script is ran 
                # and insert them into the function's arguments

echo 


#------------------------------------------------ RETURN VALUES ------------------------------------------------

# If the input number is even, return 0. If the input number is odd, return 1
# Typically a return status of 0 indicates that everything went successfully. A non zero value indicates an error occurred.
returns() {
    if [[ $1%2 -eq 0 ]]; then
        echo $1 is even
        return 0
    else
        echo $1 is odd
        return 1
    fi
}

# Input is even, so return value should be 0
returns 2
echo The previous function has a return value of $?

echo

# Input is odd, so return value should be 1
returns 9
echo The previous function has a return value of $?

echo


#------------------------------------------------ VARIABLE SCOPE ------------------------------------------------

# Local variables can be established with the keyword local before the variable name
# Run this function to see how variables can change inside and outside of functions
scope() {
    local var1='local variable'

    echo Within the function:
    echo Variable 1 is $var1
    echo Variable 2 is $var2

    var1='changed variable'
    var2='another changed variable'
}

var1='global variable'
var2='another global variable'

echo Before the function is called: 
echo Variable 1 is $var1
echo Variable 2 is $var2
echo

scope
echo

echo After the function is called:
echo Variable 1 is $var1
echo Variable 2 is $var2


#------------------------------------------------ SCRIPT PARAMETERS VS FUNCTION ARGUMENTS ------------------------------------------------

# These are parameters that are set when the script is ran
# They would be set with this command in the terminal:
# functions.sh 2 5
# param1 would be 2 and param2 would be 5
param1=$1
param2=$2

difference() {
    # These are arguments that are set when the function is called
    arg1=$1
    arg2=$2

    # These commands do the same thing
    echo Subtracting $1 from $2
    echo Subtracting $arg1 from $arg2

    minus=$(($arg1 - $arg2))
    echo $minus
}

# Calling the function
difference 9 3      # This would set arg1 to 9 and arg2 to 3

# These commands do the same thing
# Set arg1 to param1 or $1
# Set arg2 to param2 or $2
difference $param1 $param2 
difference $1 $2