setwd("../")
library(data.table)
library(stringr)
library(UpSetR)
library(ComplexHeatmap)
listsamples=unique(fread("samples.txt",header = F)$V1)
listmkks=fread("MK_MKK.csv")
engines=c("COMET","MSGF","XTANDEM","MYRIMATCH")
fdrseuil=0.001
enginesidentification=list()
proteinscount=data.frame()
for(i in 1:length(listsamples)){
  enginesidentification[[listmkks[listmkks$`File ID`==str_split(listsamples[i],pattern = "_")[[1]][2],]$`MK/MKK`]]=list()
  espcounts=c()
  for(engine in engines){
    fdrfile=paste0("Results/Identification/",engine,"/",listsamples[i],".MGF.zip_FDR_Protein_Peptide_Identification.csv")
    fdrval=fread(fdrfile)
    fdrval=fdrval[fdrval$fdrproteinlevel<fdrseuil,]
    enginesidentification[[listmkks[listmkks$`File ID`==str_split(listsamples[i],pattern = "_")[[1]][2],]$`MK/MKK`]][[engine]]=unique(fdrval$protein)
    espcounts=c(espcounts,length(unique(fdrval$protein)))
  }
  proteinscount=rbind(proteinscount,data.frame(Sample=str_split(listsamples[i],pattern = "_")[[1]][2],COMET=espcounts[1],MSGF=espcounts[2],XTANDEDM=espcounts[3],MYRIMATCH=espcounts[4]))
}
fwrite(proteinscount,paste0("Tables/Proteins_Count_Per_Sample_Engine_FDR_Protein_Level_",fdrseuil,".csv"),sep = "\t")
controlcase=fread("control-case.csv")
controlcase=controlcase[controlcase$Control%in%names(enginesidentification),]
controlcase=controlcase[controlcase$Case%in%names(enginesidentification),]
source("R Scripts/makeupsetscontrolvscase.R")
