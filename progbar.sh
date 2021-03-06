#!/bin/sh
# uwe.schimon@mailpost.de 20211122
# display a progressbar depend on MAX (count of records) max (width of bar)
progbar() {
rec="$1"
MAX="$2"
start="$3"
now="$4"
maxbar=100

 dur=$((now-start))
 curs=$((rec*maxbar/MAX))
 printf " %02d:%02d:%02d %"${#MAX}"d |>" $((dur/3600)) $((dur%3600/60)) $((dur % 60)) $rec
 p2=${#curs}; p3=$((maxbar-curs-p2+2))
 if [ $curs -gt "0" ]; then printf "|%.s" `seq $curs`; fi
 printf " %3d%s " $curs '%'
 if [ "$p3" -gt "0" ] ; then printf "|%.s" `seq $p3`;fi
 dr=$((MAX*dur/rec-dur)) # remaining
 printf "<| %"${#MAX}"d %02d:%02d:%02d \r" $((MAX-r)) $((dr/3600)) $((dr%3600/60)) $((dr % 60))
}
