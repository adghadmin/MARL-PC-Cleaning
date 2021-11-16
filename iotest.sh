#!/bin/bash
# fio hfplayer test
para=1
if [ $# -lt 1 ]
then
    echo "You need input at least $para parameter!"
    exit 0
fi
if [ $1 = "fio" ]
then
    sudo fio -filename=/dev/mapper/sadc -direct=1 -iodepth 31 -thread -rw=randwrite -ioengine=psync -bs=128k -size=9G -numjobs=50 -runtime=1000 -group_reporting -name=mytest
fi
cd /home/parallels/Desktop/workset_before/hfplayer_v1/bin
#name="homes1"
#name="homes2"
#name="homes3"
#name="ikki1"
#name="ikki2"
#name="webmail+online1"
#name="webmail+online2"
#name="webresearch1"
#name="webresearch2"
#name="webusers1"
name="webusers2"
if [ $1 = "hfplayer" ]
then
    sudo ./hfplayer -nt 1 -cfg sampleConf-sda8.csv out_$name.revised.csv
fi
if [ $1 = "hfplayerafap" ]
then
    sudo ./hfplayer -mode afap -nt 1 -cfg sampleConf-sda8.csv data_full/out_$name.revised.csv
fi
