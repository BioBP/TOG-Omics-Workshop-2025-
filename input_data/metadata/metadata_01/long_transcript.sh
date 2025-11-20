tail -n +2 transcript_protein.tsv | \
cut -f1 | \
sort -u | \
while read GENE_ID; 
do
  grep -w "^$GENE_ID" transcript_protein.tsv | \
    sort -t$'\t' -nr -k7 | \
    head -n1 | \
   		  cut -f4,6 | \
   		 tr '\t' '\n' >> ~/scratch/omics_workshop/input_data/raw_data/raw_data_01/longest.list
done

