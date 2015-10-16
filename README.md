# Order_VCF_from_Fasta
this small script allows you to order a vcf file based on the order of the reference fasta file

usage is pretty straightforward:
bash order_vcf_ref.sh IN.vcf fastaRef.fa OUT.vcf
IN.vcf -> input vcf file that you want to order
fastaRef.fa -> your reference in fasta format, i.e. hg19.fa
OUT.vcf -> name for the output file

this is a work in progress, I need to add errors check for the input arguments
