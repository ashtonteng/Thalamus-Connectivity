#!/bin/bash

#for SGE jobs

WD='/home/despoB/TRSEPPI/TTD'
SCRIPTS='/home/despoB/kaihwang/bin/TTD/Preprocessing'

cd ${WD}

for Subject in 601 602 603 605; do #$(/bin/ls -d 6*)
	
	#sed "s/s in 601/s in ${Subject}/g" < ${SCRIPTS}/run_fs.sh > /home/despoB/kaihwang/tmp/fs${Subject}.sh 
	#qsub -V -M kaihwang -m e -e ~/tmp -o ~/tmp /home/despoB/kaihwang/tmp/fs${Subject}.sh 

	#sed "s/s in 601/s in ${Subject}/g" < ${SCRIPTS}/proc_retinotopy_func.sh > /home/despoB/kaihwang/tmp/ret${Subject}.sh 
	#qsub -V -M kaihwang -m e -e ~/tmp -o ~/tmp /home/despoB/kaihwang/tmp/ret${Subject}.sh 

	for r in $(seq 1 1 12); do

	# 	#if [ ! -e "${WD}/${Subject}/run${r}/nswdktm_functional_6.nii.gz" ]; then
	 	sed "s/s in 601/s in ${Subject}/g; s/run1/run${r}/g " < ${SCRIPTS}/proc_func.sh > /home/despoB/kaihwang/tmp/proc_func_${Subject}_${r}.sh 
	 	qsub -V -M kaihwang -m e -e ~/tmp -o ~/tmp /home/despoB/kaihwang/tmp/proc_func_${Subject}_${r}.sh    #
	# 	#fi



	done

done