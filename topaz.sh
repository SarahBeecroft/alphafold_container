#!/bin/bash --login
#SBATCH --partition=gpuq
#SBATCH --nodes=1
#SBATCH -c 12
#SBATCH --gres=gpu:1
#SBATCH --time=24:00:00
#SBATCH --account=XXXX
#SBATCH --mem=128gb
#SBATCH --job-name=alphafold_test
#SBATCH --export=NONE
#SBATCH --error=%j.%x.err
#SBATCH --output=%j.%x.out

module load singularity

singularity run --nv -B /group/data/alphafold alphafold_latest.sif \
	--data_dir=/group/data/alphafold \
	--output_dir=/scratch/XXXX \
	--fasta_paths=/scratch/XXXX/input.fasta \
	--max_template_date=2022-08-23 \
	--uniref90_database_path=/group/data/alphafold/uniref90/uniref90.fasta \
	--mgnify_database_path=/group/data/alphafold/mgnify/mgy_clusters_2018_12.fa \
	--template_mmcif_dir=/group/data/alphafold/pdb_mmcif/mmcif_files \
	--obsolete_pdbs_path=/group/data/alphafold/pdb_mmcif/obsolete.dat \
	--bfd_database_path=/group/data/alphafold/bfd/bfd_metaclust_clu_complete_id30_c90_final_seq.sorted_opt \
	--uniclust30_database_path=/group/data/alphafold/uniclust30/uniclust30_2018_08/uniclust30_2018_08 \
	--pdb70_database_path=/group/data/alphafold/pdb70/pdb70 \
	--use_gpu_relax=True
  
#Additional file paths if needed for alternative analyses
#	--pdb_seqres_database_path=/group/data/alphafold/pdb_seqres/pdb_seqres.txt \
#	--uniprot_database_path=/group/data/alphafold/uniprot/uniprot.fasta \
