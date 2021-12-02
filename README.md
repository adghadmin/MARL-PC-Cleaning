# MARL-PC-Cleaning
Open source for the RL-assisted PC cleaning scheme. We propose to mitigate the tail latency of PC cleaning of the DM-SMR drive by using reinforcement learning technology. The multi-agent reinforcement learning-assisted PC cleaning scheduler has been added.


### Run:
1. Compile the whole project and generate the driver module.
2. Insert the driver module.
3. Create a simulated SMR disk.
4. Perform the block I/O workload and set up the *blktrace* tool.
5. Analyze the collected data using *blkparse & btt* tool and get the latency information.


### Notes: 
1. The linux kernel version is *4.10.0-42-generic (ubuntu 16.04)*.
2. We build our scheme based on the initial version published on [*FAST'15 - Skylight*](http://sssl.ccs.neu.edu/skylight)[1]. This is a very creative and enlightening work.
3. We use [*hfplayer*](https://github.com/umn-cris/hfplayer) as our block I/O replayer. This amazing work has been published on *FAST'17*[2] and you can find more details on their paper and Github website.
4. In order to get more accuate results, you have to shut down the write cache and the automatic power-saving mechanism of your disk with the help of *hdparm* tool.
5. The script file **con_descon_disk.sh** can be used to construct and destruct the virtual disk in the system, you can also change the cache cleaning scheduling scheme in it. We provide four schemes, namely, **dm-sadc-v0.c**, **dm-sadc-rl1.c**, **dm-sadc-rl2.c** and **dm-sadc-marl.c**. Before running the **Makefile**, you'd better change the scheme file all to the name of "**dm-sadc.c**". The script file **iotest.sh** is used to replay the workload, and you can switch to different workloads by changing it.
6. **q2c.lat_253,0_q2c.dat** is one sample data we provide to help you better analyze the experimental results, the two columns of data represent the time of I/O requests and I/O latency (s), respectively.
7. The workload files are too memory-consuming to be all uploaded, so we have only provided the workload file of **wo1**, as for the other workload files, you can easily find on the website or [contact me](yuhanyang_private@outlook.com) to obtain.
8. In our paper, the three randomly generated sequences of varied workloads are shown as below: Sequence 1: homes2, wr1, ikki1, wo2, homes3, homes2, homes1, wo1, wo2, wu2. Sequence 2: wr2, ikki2, wr1, homes1, wo1, wu2, ikki2, wo1, ikki1, homes2, wo1, wu2, wo1, wu1, wr2, wo1, homes3, ikki2, homes2, homes3. Sequence 3: ikki2, wo2, wo1, wo2, wu1, ikki1, wu1, wu2, homes2, ikki1, homes1, homes2, wu2, wu1, ikki2, homes3, wu1, homes1, homes3, wo2, wu2, homes3, wr1, wu2, wr2, wo1, homes1, wr1, wu1, wo1.


### Support:
Please post your question in the github Issues page: https://github.com/adghadmin/MARL-PC-Cleaning/issues.


### Citations:
[1] Aghayev A, Shafaei M, Desnoyers P. Skylight—a window on shingled disk operation[J]. ACM Transactions on Storage (TOS), 2015, 11(4): 1-2 <br/>
[2] Haghdoost A, He W, Fredin J, et al. On the accuracy and scalability of intensive I/O workload replay[C]//15th {USENIX} Conference on File and Storage Technologies ({FAST} 17). 2017: 315-328.
