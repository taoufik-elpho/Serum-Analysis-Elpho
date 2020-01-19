setwd("../")
library(data.table)
library(stringr)
library(UpSetR)
library(ComplexHeatmap)
listsamples=unique(fread("samples.txt",header = F)$V1)
listmkks=fread("MK_MKK.csv")
engines=c("COMET","MSGF","XTANDEM","MYRIMATCH","COMBINED")
enginesidentification=list()
for(i in 1:length(listsamples)){
  enginesidentification[[listmkks[listmkks$`File ID`==str_split(listsamples[i],pattern = "_")[[1]][2],]$`MK/MKK`]]=list()
  for(engine in engines){
    if(engine=="COMBINED"){
      fdrfile=paste0("Results/Identification/CODECOMBINING/",listsamples[i],"_FDR_Protein_Peptide_Identification.csv")
    }else{
      fdrfile=paste0("Results/Identification/",engine,"/",listsamples[i],".MGF.zip_FDR_Protein_Peptide_Identification.csv")
    }
    fdrval=fread(fdrfile)
    fdrval$fdrpeptidelevel<-NULL
    enginesidentification[[listmkks[listmkks$`File ID`==str_split(listsamples[i],pattern = "_")[[1]][2],]$`MK/MKK`]][[engine]]=fdrval
  }
}
fdrs=seq(0,0.5,0.001)
acceptedbyfdrsampleengine=data.frame()
# create progress bar
pb <- txtProgressBar(min = 0, max = dim(listmkks)[1], style = 3)
for(i in 1:dim(listmkks)[1]){
  for(engine in engines){
    for(j in 1:length(fdrs)){
      acceptedbyfdrsampleengine=rbind(acceptedbyfdrsampleengine,data.frame(Sample=listmkks[i,]$`MK/MKK`,Engine=engine,FDR=fdrs[j],Accepted=length(unique(enginesidentification[[listmkks[i,]$`MK/MKK`]][[engine]][enginesidentification[[listmkks[i,]$`MK/MKK`]][[engine]]$fdrproteinlevel<=fdrs[j],]$protein))))
    }
  }
  setTxtProgressBar(pb, i)
}
close(pb)
fwrite(acceptedbyfdrsampleengine,"Tables/AcceptedProteinsByFDRENGINEandCombiningSAMPLE.csv",sep="\t")
acceptedbyfdrsampleengine=fread("Tables/AcceptedProteinsByFDRENGINESAMPLE.csv")
