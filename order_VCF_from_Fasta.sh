#!/bin/sh

### this tool will re-order a vcf file based on the order of the reference fasta file, it will leave the random and chUn(s) out 
# usage
# bash order_vcf_ref.sh IN.vcf fastaRef.fa OUT.vcf
# $1 -> IN.vcf
# $2 -> fastaRef.fa
# $3 -> OUT.vcf
###
if [ $# == 0 ]
  then
	echo ""
	echo "No arguments supplied"
	echo "usage"
	echo "bash order_vcf_ref.sh IN.vcf fastaRef.fa OUT.vcf"
	echo ""
	exit 1
fi

echo "This will:
1- read reference file
2- take order of chromosomes
3- reorder the vcf file
4- output the new vcf file"
echo ""
sleep 1

echo "Taking header from vcf file (leaving out chrUn and random chromosomes)"
sed "/#CHROM/q" $1 | grep -v 'chrUn' | grep -v 'random' | grep -v 'chr6_'| grep -v 'chr4_ctg9' | grep -v 'chr17_ctg5' > header.txt
echo ""

echo "Taking index from reference genome file"
CHR=($(cat $2 | grep -i 'chr' |  tr -d '>'))
cat header.txt > $3
echo ""
echo "Now reordering the .vcf file, it might take some time, be patient"
echo ""

for i in ${CHR[@]}
	do
	cat $1 | awk -v var=$(sed "/#CHROM/q" $1 | wc -l) '{if(NR>var) print}' | grep $i >> $3
	echo "done for $i"
done

echo ""
echo "Done reordering the vcf file"
echo "Removing intermediate files adn variables"
rm header.txt
unset CHR

echo ""
echo "Finished cleaning up,the new output is in the $3 file"
echo "Goodbye"
