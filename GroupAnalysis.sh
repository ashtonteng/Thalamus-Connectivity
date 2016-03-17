#!/bin/bash

###GROUP ANALYSIS###
stringCommand="3dttest -base1 0 -prefix t-test -set2 " #performs t-test on the follow set of data:
for subject in /home/despoB/connectome-thalamus/Thalamus_ROI_connectivity/headbrik_intralaminar/*; do
	stringCommand="${stringCommand}${subject}/stats+orig " #add each subject's files into the command to form set
done
$stringCommand #runs the combined command
