#!/bin/bash
#
#SBATCH --job-name=PreFS
#SBATCH --ntasks=1
#SBATCH --cpus-per-task=4
#SBATCH --mem-per-cpu=6G
#SBATCH --time=4:00:00
#SBATCH --partition=amd-hdr100
#SBATCH --output=/home/mdefende/Desktop/hcp-test/D01/code/PreFS_output.txt
#
# load necessary modules
module load FreeSurfer/6.0.0-centos6_x86_64

module load FSL/6.0.3
source ${FSLDIR}/etc/fslconf/fsl.sh

module load Anaconda3/2020.11
conda activate preFS

# set necessary environmental variables
export HCPPIPEDIR=$HOME/Scripts/HCPpipelines
export HCPPIPEDIR_Global=${HCPPIPEDIR}/global/scripts
export HCPPIPEDIR_Templates=${HCPPIPEDIR}/global/templates
export SPIN_ECHO_METHOD_OPT="TOPUP"
export CARET7DIR=$HOME/Scripts/workbench/bin_rh_linux64

#FSLDIR is set when loading the FSL module above

# change directory to the HCPPIPEDIR PreFreeSurfer directory
cd ${HCPPIPEDIR}/PreFreeSurfer

data_path=$HOME/Desktop/hcp-test/D01/nifti

# run command with following options
./PreFreeSurferPipeline.sh \
    --path=$data_path/derivatives/hcp-pipelines \
	--subject=sub-S01 \
	--t1=$data_path/sub-S01/anat/sub-S01_T1w.nii.gz \
	--t2=$data_path/sub-S01/anat/sub-S01_T2w.nii.gz \
	--t1template=${HCPPIPEDIR_Templates}/MNI152_T1_0.7mm.nii.gz \
	--t1templatebrain=${HCPPIPEDIR_Templates}/MNI152_T1_0.7mm_brain.nii.gz \
	--t1template2mm=${HCPPIPEDIR_Templates}/MNI152_T1_2mm.nii.gz \
	--t2template=${HCPPIPEDIR_Templates}/MNI152_T2_0.7mm.nii.gz \
	--t2templatebrain=${HCPPIPEDIR_Templates}/MNI152_T2_0.7mm_brain.nii.gz \
	--t2template2mm=${HCPPIPEDIR_Templates}/MNI152_T2_2mm.nii.gz \
	--templatemask=${HCPPIPEDIR_Templates}/MNI152_T1_0.7mm_brain_mask.nii.gz \
	--template2mmmask=${HCPPIPEDIR_Templates}/MNI152_T1_2mm_brain_mask_dil.nii.gz \
	--fnirtconfig=${HCPPIPEDIR}/global/config/T1_2_MNI152_2mm.cnf \
	--SEPhaseNeg=$data_path/sub-S01/fmap/sub-S01_dir-AP_run-1_epi.nii.gz \
	--SEPhasePos=$data_path/sub-S01/fmap/sub-S01_dir-PA_run-2_epi.nii.gz \
	--seechospacing=0.00058 \
	--seunwarpdir={i,j} \
	--t1samplespacing=0.0000071 \
	--t2samplespacing=0.0000021 \
	--unwarpdir=k \
	--avgrdcmethod=${SPIN_ECHO_METHOD_OPT} \
	--topupconfig=${HCPPIPEDIR}/global/config/b02b0.cnf \
	--bfsigma=5
