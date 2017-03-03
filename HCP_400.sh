###HCP 400###
###finds correlations of all cross-correlations between all ROIs in each subject###
lesion_plus_400_path="/home/despoB/connectome-thalamus/Lesion_Masks/lesion_plus_400"
lesion_plus_400_corr_path="/home/despoB/connectome-thalamus/Lesion_Masks/lesion_plus_400_corr"
HCP_path="/home/despoB/connectome-data"
cd ${HCP_path}

echo "Processing ${subject_num}"

if [[ -e "${HCP_path}/${subject_num}" ]]
then
    echo "Already processed ${subject_num}"
    continue
fi
if [[ -d "${HCP_path}/${subject_num}" ]] #if we are looking at a subject directory
then
	mkdir ${lesion_plus_400_corr_path}/HCP/${lesion_num}/${subject_num};
	#Folder 1 rfMRI_REST1_LR
    cd ${HCP_path}/${subject_num}/rfMRI_REST1_LR;
    if [[ -e "rfMRI_REST1_LR_hp2000_clean_wbsreg.nii.gz" ]] #if we have the appropriate file in the directory
    	then
    	mkdir ${lesion_plus_400_corr_path}/HCP/${lesion_num}/${subject_num}/rfMRI_REST1_LR;
    	3dNetCorr -inset rfMRI_REST1_LR_hp2000_clean_wbsreg.nii.gz -in_rois ${lesion_plus_400_path}/${lesion_num}_lesion_plus_400.nii.gz -prefix ${lesion_plus_400_corr_path}/HCP/${lesion_num}/${subject_num}/rfMRI_REST1_LR/lesion_plus_400_corr;
	fi
	cd ..
	#Folder 2 rfMRI_REST2_LR
	cd ${HCP_path}/${subject_num}/rfMRI_REST2_LR;
    if [[ -e "rfMRI_REST2_LR_hp2000_clean_wbsreg.nii.gz" ]] #if we have the appropriate file in the directory
    	then
    	mkdir ${lesion_plus_400_corr_path}/HCP/${lesion_num}/${subject_num}/rfMRI_REST2_LR;
    	3dNetCorr -inset rfMRI_REST2_LR_hp2000_clean_wbsreg.nii.gz -in_rois ${lesion_plus_400_path}/${lesion_num}_lesion_plus_400.nii.gz -prefix ${lesion_plus_400_corr_path}/HCP/${lesion_num}/${subject_num}/rfMRI_REST2_LR/lesion_plus_400_corr;
	fi
	cd ..
	#Folder 3 rfMRI_REST1_RL
	cd ${HCP_path}/${subject_num}/rfMRI_REST1_RL;
    if [[ -e "rfMRI_REST1_RL_hp2000_clean_wbsreg.nii.gz" ]] #if we have the appropriate file in the directory
    	then
    	mkdir ${lesion_plus_400_corr_path}/HCP/${lesion_num}/${subject_num}/rfMRI_REST1_RL;
    	3dNetCorr -inset rfMRI_REST1_RL_hp2000_clean_wbsreg.nii.gz -in_rois ${lesion_plus_400_path}/${lesion_num}_lesion_plus_400.nii.gz -prefix ${lesion_plus_400_corr_path}/HCP/${lesion_num}/${subject_num}/rfMRI_REST1_RL/lesion_plus_400_corr;
	fi
	#Folder 4 rfMRI_REST2_RL
	cd ${HCP_path}/${subject_num}/rfMRI_REST2_RL;
    if [[ -e "rfMRI_REST2_RL_hp2000_clean_wbsreg.nii.gz" ]] #if we have the appropriate file in the directory
    	then
    	mkdir ${lesion_plus_400_corr_path}/HCP/${lesion_num}/${subject_num}/rfMRI_REST2_RL;
    	3dNetCorr -inset rfMRI_REST2_RL_hp2000_clean_wbsreg.nii.gz -in_rois ${lesion_plus_400_path}/${lesion_num}_lesion_plus_400.nii.gz -prefix ${lesion_plus_400_corr_path}/HCP/${lesion_num}/${subject_num}/rfMRI_REST2_RL/lesion_plus_400_corr;
	fi
	cd ..
fi