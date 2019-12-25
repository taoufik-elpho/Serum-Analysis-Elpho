library(batch)
library(stringr)
library(data.table)
parsingSGUIResultsComet<-function(searesult){
  library(xml2)
  library(XML)
  library(dplyr)
  library(stringr)
  library(data.table)
  data <- xmlTreeParse(file=searesult,useInternalNode=TRUE)
  xl<-xmlToList(data)
  datahits=data.frame()
  total <- length(xl$msms_run_summary)
  # create progress bar
  pb <- txtProgressBar(min = 0, max = total, style = 3)
  for(i in 1:length(xl$msms_run_summary)){
    if("search_result"%in%names(xl$msms_run_summary[[i]])){
      
      for(j in 1:length(xl$msms_run_summary[[i]]$search_result)){
         if(".attrs"%in%names(xl$msms_run_summary[[i]]$search_result[[j]])){
         if(length(xl$msms_run_summary[[i]]$search_result[[j]]$.attrs)>=5){
            datahits=rbind(datahits,data.frame(peptide=xl$msms_run_summary[[i]]$search_result[[j]]$.attrs[2],protein=str_split(str_replace(xl$msms_run_summary[[i]]$search_result[[j]]$.attrs[5],pattern = "_REVERSED",""),pattern = "\\|")[[1]][2],decoy=grepl("REVERSED",xl$msms_run_summary[[i]]$search_result[[j]]$.attrs[5])))
        }
        }
      }
    }
    setTxtProgressBar(pb, i)
  }
  close(pb)
  fwrite(datahits,"Protein_Peptide_Identification.csv",sep="\t")
  datahits
}
parsingSGUIResultsmzid<-function(searesult){
  library(mzID)
  mzids=mzID(searesult)
  data=flatten(mzids)
  datahits=data.frame()
  total <- dim(data)[1]
  # create progress bar
  pb <- txtProgressBar(min = 0, max = total, style = 3)
  for(i in 1:dim(data)[1]){
    datahits=rbind(datahits,data.frame(peptide=data[i,23],protein=str_split(str_replace(data[i,21],pattern = "_REVERSED",""),pattern = "\\|")[[1]][2],decoy=grepl("REVERSED",data[i,21])))
    setTxtProgressBar(pb, i)
  }
  close(pb)
  fwrite(datahits,"Protein_Peptide_Identification.csv",sep="\t")
  datahits
}
fdr<-function(datahits){
  fdrproteinlevel=c()
  fdrpeptidelevel=c()
  proteins=unique(datahits$protein)
  peptides=unique(datahits$peptide)
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
  total <- length(proteins)
  # create progress bar
  pb <- txtProgressBar(min = 0, max = total, style = 3)
  count=1
  for(protein in proteins){
    datahitsprotein=datahits[datahits$protein==protein,]
    datahitspeptide=datahits[datahits$peptide%in%datahitsprotein$peptide,]
    fdrpeptidelevel= c( fdrpeptidelevel,dim(datahitspeptide[datahitspeptide$decoy==TRUE,])[1]/dim(datahitspeptide)[1]) 
    setTxtProgressBar(pb, count)
    count=count+1
  }
  close(pb)
  fdrhits=list()
  fdrhits$protein=proteins
  fdrhits$fdrproteinlevel=fdrproteinlevel
  fdrhits$fdrpeptidelevel=fdrpeptidelevel
  fdrhits=as.data.frame(fdrhits)
  fwrite(fdrhits,"FDR_Protein_Peptide_Identification.csv",sep="\t")
}
parsingSGUIResultsxTANDEM<-function(searesult){
  library(xml2)
  library(XML)
  library(dplyr)
  data <- xmlTreeParse(file=searesult,useInternalNode=TRUE)
  xl<-xmlToList(data)
  datahits=data.frame()
  total <- length(xl)
  # create progress bar
  pb <- txtProgressBar(min = 0, max = total, style = 3)
  for(i in 1:length(xl)){
    if("group"%in%names(xl[i])){
      for(j in 1:length(xl[i]$group)){
        
        if("protein"%in%names(xl[i]$group[j])){
          datahits=rbind(datahits,data.frame(peptide=xl[i]$group[j]$protein$peptide$domain$.attrs[15],protein=str_split(str_replace(xl[i]$group[j]$protein$note$text,pattern = "_REVERSED",""),pattern = "\\|")[[1]][2],decoy=grepl("REVERSED",xl[i]$group[j]$protein$note$text)))
        }
      }
    }
    setTxtProgressBar(pb, i)
  }
  close(pb)
  fwrite(datahits,"Protein_Peptide_Identification.csv",sep="\t")
  datahits
}
listArguments = parseCommandArgs(evaluate=FALSE)
zipsearesult=listArguments[["file"]]
engine=listArguments[["engine"]]
unzip(zipsearesult)
searesult<- list.files(pattern = "\\.xml$|\\.mzid$")[1]
if(engine=="comet"){
  datahits=parsingSGUIResultsComet(searesult)
  fdr(datahits)
}
if(engine=="xtandem"){
  datahits=parsingSGUIResultsxTANDEM(searesult)
  fdr(datahits)
}
if(engine%in%c("msgf","myrimatch")){
  datahits=parsingSGUIResultsmzid(searesult)
  fdr(datahits)
}
