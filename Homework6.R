# BiocManager::install("GenomicAlignments")
# update all
# install.packages("protti")
# install.packages("UniprotR")
library(UniprotR)
library(protti)

# for future homeworks, try to figure out how to import these kinds of data from a file
acc_num <- c("P08839", "Q8XBL3","A7ZPL7","A0A7I6H8A9","Q3YZC6") 

GeoTerms <- GetProteinGOInfo(acc_num)
PlotGoInfo(GeoTerms, directorypath = "PlotGoInfo") # save to a file
PlotGOAll(GeoTerms, directorypath = "PlotGOAll") # save to a file

# save to variables!
GPB <- GetPathology_Biotech(acc_num) 
uniprots <- fetch_uniprot(acc_num)
pdb_1zmr <- fetch_pdb("1zmr")
af <- fetch_alphafold_prediction(acc_num)
