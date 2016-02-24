#!/bin/bash

for subject in /home/despoB/connectome-thalamus/MGH/*; do
 innerPath=${subject}/MNINonLinear/;
 target="rfMRI_REST.nii.gz"
 totalPath="${innerPath}${target}"
 subjectNum=${subject##*/}
 maskPath="/home/despoB/connectome-thalamus/Thalamus_ROI_connectivity/ROIs/Morel_intralminar_2mm.nii.gz"
 txtPath="/home/despoB/connectome-thalamus/Thalamus_ROI_connectivity/timeseries/${subjectNum}_ts.txt"
 if [ -e "${totalPath}" ]
 	then
 	3dmaskave -mask ${maskPath} -quiet ${totalPath} > ${txtPath}
 	3dfim+ -input ${totalPath} -ideal_file "timeseries/${subjectNum}_ts.txt" -out Correlation -bucket "headbrik_intralaminar/${subjectNum}/stats" -polort -1
 fi;
done
