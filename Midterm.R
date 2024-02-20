# Load in  all the libraries that are needed. 
library(msa)
library(seqinr)
library(Biostrings)
library(UniprotR)
library(protti)
library(tidyr)
library(dplyr)
library(phangorn)
#Load in the fasta files using setwd
setwd("/Users/whert/Documents/GitHub/Bioinformatics")
#Use readDNAStringSet to load and to look at your fasta files.
readDNAStringSet("sequences.fasta")
#Make your fasta file equal to something else so that you don't have to write the same thing over and over again.
genome = readDNAStringSet("sequences.fasta")
#Use the print function to look at all of your sequences lined up together.
#After using the print function look for which sequences is the most different.
print(genome, show="complete")
#Also remember to perform a Multiple Sequence Alignment so that you can truly look for differences at the smallest level.
Gen20 <-msa(genome)
#The specific gene that we are looking for is Homo sapiens mutant hemoglobin beta chain (HBB) gene.
#The accession # is AY356351.1.


#Next find out which person's genome is the most different.
#To do this convert your msa which is in a fasta format to seqinr format.
Gen20Aln <- msaConvert(Gen20, type="seqinr::alignment")
#Then perform a distance alignment which will show you how closely each sequence is to each other.
#Rename you ditance alingment to something simple like d.
d <- dist.alignment(Gen20Aln, "identity")
d
#After running our distance alignment we can conclude that person 6 has the mutated gene.
#The reason being that they're genome is the most different from all other 19 people tested.
#The type of mutation that has occurred is a deletion mutation which cause a frame shift mutation.
#A frame shift mutation causes the entire reading frame to change and all the other ammino acids that are being coded for.


#When trying to convert Seq6 from person 6 to an AA structure there are problems.
#The reason that there are problems is because there are not a proper number of amino acids to show the sequence.
print(Seq6,show="complete")
Seq6AA <- Biostrings::translate(Seq6)
#Next write your sequence alignment to a fasta file using the phangorn package.
#When converting msa make sure to rename your alignment something different to have easy access. 
Gen20AlnPhy <- msaConvert(Gen20, type="phangorn::phyDat")
write.phyDat(Gen20AlnPhy, "HomoSapien_Aln.fasta", format = "fasta")

#After writing into a fasta file. Go to Uniprot and submit your recently written fasta file.
#The protein that was found on Uniprot was Hemoglobin subunit beta.
#The accession # is A0A2R8Y7R2.
#I was unable to find a way to get "get.disease" to function.
#So I looked up what disease were associated with the HBB gene I found that it is often associated with sickle cell anemia.
#This person could have sickle cell because they do posses the gene for mutant hemoglobin beta chain

#Next find a if a 3D model exists for your protein.
#To do this use fetch_alphafold_prediction, where it will find an accession number for the Alpha fold website.
#Put in your protein accession # from earlier:A0A2R8Y7R2
fetch_alphafold_prediction("A0A2R8Y7R2")
#Take the alphafold accession # and put into the search bar and you should find a picture of your protein.
            

