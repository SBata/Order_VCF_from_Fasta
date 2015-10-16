# Order_VCF_from_Fasta
this small script allows you to order a vcf file based on the order of the reference fasta file

usage is pretty straightforward:

<i>bash order_vcf_ref.sh IN.vcf fastaRef.fa OUT.vcf</i>

IN.vcf -> input vcf file that you want to order

fastaRef.fa -> your reference in fasta format, i.e. hg19.fa

OUT.vcf -> name for the output file

<b>NOTE: the vcf file and the reference file MUST have the same names for chromosomes, i.e. chromosome 1 shoule be either "chr1" in both or "1" in both</b>

this is a work in progress, I need to add errors check for the input arguments
