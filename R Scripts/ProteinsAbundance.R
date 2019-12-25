setwd("/home/laptop/Desktop/serumanalaysi/pipeline/codes/new/sampledone/identification/CODECOMBINING/results/")
library(data.table)
library(stringr)
library(UpSetR)
library(ComplexHeatmap)
listsamples=unique(fread("../../../identification/samples.txt",header = F)$V1)
listmkks=fread("../../../identification/MK_MKK.csv")
proteinscombinedbysamples=list()
for(i in 1:length(listsamples)){
  mkk=listmkks[listmkks$`File ID`==str_split(listsamples[i],pattern = "_")[[1]][2],]$`MK/MKK`
  combined=fread(paste0(listsamples[i],"_FDR_Protein_Peptide_Identification_v2.csv"))
  combinedaccepted=paste(unique(combined[combined$fdrproteinlevel<0.01,]$protein),collapse = ",")
  proteinscombinedbysamples[[mkk]]<-combinedaccepted
}
proteinscontrol=c()
proteinscase=c()
for(mkk in names(proteinscombinedbysamples)){
  if(grepl("MKK",mkk)){
    proteinscase=c(proteinscase,str_split(proteinscombinedbysamples[[mkk]],pattern = ",")[[1]])
  }else{
    proteinscontrol=c(proteinscontrol,str_split(proteinscombinedbysamples[[mkk]],pattern = ",")[[1]])
  }
}
proteinscontrol=unique(proteinscontrol)
proteinscase=unique(proteinscase)
proteincasecontrol=c(proteinscontrol,proteinscase)
proteincasecontrol=unique(proteincasecontrol)
freqdf=data.frame()
pb <- txtProgressBar(min = 0, max = length(proteincasecontrol), style = 3)
for(i in 1:length(proteincasecontrol)){
  foundmk=list()
  for(mkk in names(proteinscombinedbysamples)){
    foundmk[[mkk]]<-0
    tempproteins=str_split(proteinscombinedbysamples[[mkk]],pattern = ",")[[1]]
    if(proteincasecontrol[i]%in%tempproteins){
      foundmk[[mkk]]<-1
    }
  }
  foundmk$Protein=proteincasecontrol[i]
  if(i>length(proteinscontrol)){
    foundmk$SampleType="Case"
  }else{
    foundmk$SampleType="Control"
  }
  foundmk=as.data.frame(foundmk)
  freqdf=rbind(freqdf,foundmk)
  setTxtProgressBar(pb, i)
}
close(pb)
library(tidyverse)
library(dplyr)
fwrite(freqdf,"freqdf.csv",sep = "\t")
freqdf=fread("freqdf.csv")
freqdf$FreqControl=rowSums(freqdf%>%select(names(proteinscombinedbysamples)[grepl("MKK",names(proteinscombinedbysamples))]))
freqdf$FreqCase=rowSums(freqdf%>%select(names(proteinscombinedbysamples)[!grepl("MKK",names(proteinscombinedbysamples))]))
onlyincaseoronlyincontrol=freqdf[freqdf$FreqCase==0 | freqdf$FreqControl==0,]
relativelyabondante=freqdf[abs(freqdf$FreqCase-freqdf$FreqControl)>4,]
fwrite(relativelyabondante,"Protein_Relatively_Abondant_At_Leat_In_5_Samples_Group.csv")
relativelyabondante=relativelyabondante[relativelyabondante$FreqCase==0 | relativelyabondante$FreqControl==0,]
fwrite(relativelyabondante,"Protein_Abondant_At_Leat_In_5_In_a_Sample_Group.csv")
relativelyabondante=freqdf[abs(freqdf$FreqCase-freqdf$FreqControl)>5,]
fwrite(relativelyabondante,"Protein_Relatively_Abondant_At_Leat_In_6_Samples_Group.csv")
relativelyabondante=relativelyabondante[relativelyabondante$FreqCase==0 | relativelyabondante$FreqControl==0,]
fwrite(relativelyabondante,"Protein_Abondant_At_Leat_In_6_In_a_Sample_Group.csv")

