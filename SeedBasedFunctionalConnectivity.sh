#!/bin/bash

###SEED BASED FUNCTIONAL CONNECTIVITY###
ROI="PuM" #input your ROI mask name here. Corresponds to full name: Morel_${ROI}_2mm.nii.gz
mkdir timeseries_${ROI} #creates folder to store timeseries files of subject of masked ROI
mkdir headbrik_${ROI} #creates folder that stores the .HEAD and .BRIK files of the functional connectivity between subject's rest of brain and the masked ROI
for subject in /home/despoB/connectome-thalamus/MGH/*; do #for each subject,
 innerPath=${subject}/MNINonLinear/; 
 target="rfMRI_REST_ncsreg.nii.gz" #each subject's fMRI file common name
 totalPath="${innerPath}${target}"
 subjectNum=${subject##*/}
 maskPath="/home/despoB/connectome-thalamus/Thalamus_ROI_connectivity/ROIs/Morel_${ROI}_2mm.nii.gz"
 txtPath="/home/despoB/connectome-thalamus/Thalamus_ROI_connectivity/timeseries_${ROI}/${subjectNum}_ts.txt"
 if [ -e "${totalPath}" ] #if the target file exists,
 	then
 	3dmaskave -mask ${maskPath} -quiet ${totalPath} > ${txtPath} #apply the mask onto the target file, creating a timeseries file.
 	3dfim+ -input ${totalPath} -ideal_file "timeseries_${ROI}/${subjectNum}_ts.txt" -out Correlation -bucket "headbrik_${ROI}/${subjectNum}/stats" -polort -1
 	#compares each voxel in target fMRI file with the timeseries of the ROI.
 fi;
done
