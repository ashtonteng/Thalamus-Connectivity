#!/bin/bash

HCP_path="/home/despoB/connectome-data"
for hcp_lesion_num in 128 162 163 168 176; do
	for hcp_subject_path in ${HCP_path}/*; do
		hcp_subject_num=${hcp_subject_path##*/}
		sed -e "s/\${lesion_num}/"${hcp_lesion_num}"/g" -e "s/\${subject_num}/"${hcp_subject_num}"/g" HCP_yeo.sh > /home/despoB/yqteng/tmp_yeo/lesion_${hcp_lesion_num}_HCP_${hcp_subject_num}.sh
		qsub -l mem_free=5G /home/despoB/yqteng/tmp_yeo/lesion_${hcp_lesion_num}_HCP_${hcp_subject_num}.sh
	done
done