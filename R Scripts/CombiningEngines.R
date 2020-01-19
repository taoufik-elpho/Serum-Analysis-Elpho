setwd("../")
library(data.table)
library(stringr)
library(UpSetR)
library(ComplexHeatmap)
listsamples=unique(fread("samples.txt",header = F)$V1)
listmkks=fread("MK_MKK.csv")
engines=c("COMET","MSGF","XTANDEM","MYRIMATCH")
fdrseuil=0.001
enginesidentificationcombined=list()
proteinscount=data.frame()
proteinscombined=list()
proteinsidentidicationengine=data.frame()
for(i in 1:length(listsamples)){
  proteinsidentidicationengine=data.frame()
  for(engine in engines){
    protfile=paste0("Results/Identification/".engine,"/",listsamples[i],".MGF.zip_Protein_Peptide_Identification.csv")
    protdf=fread(protfile)
    proteinsidentidicationengine=rbind(proteinsidentidicationengine,protdf)
  }
  proteinsidentidicationenginefdr=fdr(proteinsidentidicationengine)
  proteinscombined[[listsamples[i]]]=unique(proteinsidentidicationengine$protein)
}
fwrite(proteinscount,paste0("Tables/Proteins_Count_Per_Sample_Engine_FDR_Protein_Level_",fdrseuil,".csv"),sep = "\t")
controlcase=fread("control-case.csv")
controlcase=controlcase[controlcase$Control%in%names(enginesidentification),]
controlcase=controlcase[controlcase$Case%in%names(enginesidentification),]
source("MakeUpsetsControlvsCaseFigures.R")
