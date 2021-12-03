# progbar 
# progbar is a simple progress indicator in a shell environment, but it can be used and changed in many ways.
# There are no significant dependencies
# enough to use

#!/bin/sh

set ST=/home/ 

set MAX=`find "$ST" -type f | wc -l | awk '{print $1}'`

set ds=`date +%s`

. ./progbar.sh

find "$ST" -type f | while read f

do

 hash=`md5sum "$f" | awk '{print $1}'`
 
 r=$((r+1))
 
 progbar $r $MAX $ds `date +%s`
 
done
