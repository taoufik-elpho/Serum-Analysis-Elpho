library(batch)
library(stringr)
library(data.table)
fdr<-function(datahits){
  fdrproteinlevel=c()
  #fdrpeptidelevel=c()
  proteins=unique(datahits$protein)
  #peptides=unique(datahits$peptide)
  total <- length(proteins)
  # create progress bar
  pb <- txtProgressBar(min = 0, max = total, style = 3)
  count=1
  for(protein in proteins){
      datahitsprotein=datahits[datahits$protein==protein,]
      fdrproteinlevel= c( fdrproteinlevel,dim(datahitsprotein[datahitsprotein$decoy==TRUE,])[1]/dim(datahitsprotein)[1]) 
      setTxtProgressBar(pb, count)
      count=count+1
  }
  close(pb)
  #total <- length(proteins)
  # create progress bar
  # pb <- txtProgressBar(min = 0, max = total, style = 3)
  # count=1
  # for(protein in proteins[1]){
  #   datahitsprotein=datahits[datahits$protein==protein,]
  #   datahitspeptide=datahits[datahits$peptide%in%datahitsprotein$peptide,]
  #   fdrpeptidelevel= c( fdrpeptidelevel,dim(datahitspeptide[datahitspeptide$decoy==TRUE,])[1]/dim(datahitspeptide)[1]) 
  #   setTxtProgressBar(pb, count)
  #   count=count+1
  # }
  # close(pb)
  fdrhits=list()
  fdrhits$protein=proteins
  fdrhits$fdrproteinlevel=fdrproteinlevel
  #fdrhits$fdrpeptidelevel=fdrpeptidelevel
  fdrhits=as.data.frame(fdrhits)
  fdrhits
  #fwrite(fdrhits,"FDR_Protein_Peptide_Identification.csv",sep="\t")
}
listArguments = parseCommandArgs(evaluate=FALSE)
sample=listArguments[["sample"]]
engines=c("COMET","MSGF","XTANDEM","MYRIMATCH")
proteinsidentidicationengine=data.frame()
for(engine in engines){
    protfile=paste0("/home/laptop/Desktop/serumanalaysi/pipeline/codes/new/sampledone/identification/",engine,"/",sample,".MGF.zip_Protein_Peptide_Identification.csv")
    protdf=fread(protfile)
    proteinsidentidicationengine=rbind(proteinsidentidicationengine,protdf)
  }
fdr(unique(proteinsidentidicationengine))
getwd()

