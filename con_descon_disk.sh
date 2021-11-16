#!/bin/bash
para=1
construct="c"
deconstruct="d"
if [ $# -lt $para ]
then
    echo "You need input at least ${para} parameter!"
    exit 0
fi
if [ ${construct} = $1 ]
then
    #path="/home/parallels/Desktop/workset_before/skylight-src-marl/"
    #path="/home/parallels/Desktop/workset_before/skylight-src-v0/"
    #path="/home/parallels/Desktop/workset_before/skylight-src-RL1-V2/"
    path="/home/parallels/Desktop/workset_before/skylight-src-RL2_/"
    insert_module=`insmod ${path}dm-sadc.ko`
    echo $insert_module
    constrcut_disk=`sudo dmsetup create sadc --table "0 20684800 sadc /dev/sd$2 1048576 10 1 10737418240"`
    #constrcut_disk=`sudo dmsetup create sadc --table "0 103424000 sadc /dev/sd$2 1048576 10 1 53687091200"`
    echo $construct_disk
    echo "Create SMR disk successfully!"
else
    deconstruct_disk=`sudo dmsetup remove sadc`
    echo $deconstruct_disk
    remove_module=`sudo rmmod dm-sadc`
    echo $remove_module
    echo "Remove disk successfully!"
fi
