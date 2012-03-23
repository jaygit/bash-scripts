#!/bin/sh
################################################################################
# Record the Start Time
################################################################################
log_event()
{
echo $EVENT "|" $EVEN_TYPE "|"`date '+%d/%m/%y |%H:%M:%S'"|"`>> ${OUTPUT}
date +%H%M%S
}
################################################################################
# Record the Completion Time
################################################################################

################################################################################
# Record the Execution Time
################################################################################
execution_time()
{
h1=`echo $1 | cut -c1-2`	# Get Start Hour
m1=`echo $1 | cut -c3-4`	# Get Start Minute
s1=`echo $1 | cut -c5-6`	# Get Start Second
h2=`echo $2 | cut -c1-2`	# Get Stop Hour
m2=`echo $2 | cut -c3-4`	# Get Stop Minute
s2=`echo $2 | cut -c5-6`	# Get Stop Second
s3=`expr $s2 - $s1`	 # Calculate Second Difference
if [ $s3 -lt 0 ]	 # Test for Negative Seconds
then
s3=`expr $s3 + 60`	# If yes - add one minute...
m1=`expr $m1 + 1`	 # ... and to subtractor
fi
m3=`expr $m2 - $m1`	 # Calculate Minute Difference
if [ $m3 -lt 0 ]	 # Test for Negative Minutes
then
m3=`expr $m3 + 60`	# If yes - add one hour...
h1=`expr $h1 + 1`	 # ... and to subtractor
fi
h3=`expr $h2 - $h1`	 # Calculate Hour Difference
if [ $h3 -lt 0 ]	 # Test for Negative Hours
then
h3=`expr $h3 + 24`	# If yes - add one day
fi
for number in $h3 $m3 $s3	# Loop through numbers...
do
if [ $number -lt 10 ]	# If number is single digit...
then
echo "0$number\c" # ... add leading zero
else
echo "$number\c" # ... else - don't
fi
done
echo ""	 # Terminate the string
}
