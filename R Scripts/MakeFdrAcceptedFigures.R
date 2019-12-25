acceptedbyfdrsampleengine$Tline=rep("",dim(acceptedbyfdrsampleengine)[1])
acceptedbyfdrsampleengine[acceptedbyfdrsampleengine$Engine=="COMET",]$Tline<-"dotdashed"
acceptedbyfdrsampleengine[acceptedbyfdrsampleengine$Engine=="MSGF",]$Tline<-"dotted"
acceptedbyfdrsampleengine[acceptedbyfdrsampleengine$Engine=="XTANDEM",]$Tline<-"solid"
acceptedbyfdrsampleengine[acceptedbyfdrsampleengine$Engine=="MYRIMATCH",]$Tline<-"dashed"
acceptedbyfdrsampleengine[acceptedbyfdrsampleengine$Engine=="COMBINED",]$Tline<-"longdashed"
library(ggplot2)
i=1
  acceptedbyfdrsampleenginesinlge=acceptedbyfdrsampleengine[acceptedbyfdrsampleengine$Sample==listmkks[i,]$`MK/MKK`,]
  acceptedbyfdrsampleenginesinlge$Sample<-NULL
  png(paste0("FDRACCEPTED/Accpeted proteins by FDR and engine and combining sample = ",listmkks[i,]$`MK/MKK`,".png"),height = 512,width = 512)
  ggplot(acceptedbyfdrsampleenginesinlge[acceptedbyfdrsampleenginesinlge$FDR<0.5,]) +
    geom_line(aes(x = FDR, y = Accepted, linetype=Tline))+xlab("False discovery rate")+ylab("# Accepted proteins")+
    labs(title = "Accepted proteins by FDR", subtitle = listmkks[i,]$`MK/MKK` )+
    scale_linetype_discrete(name="Engine",labels=c("MYRIMATCH","COMET","MSGF","COMBINED","XTANDEM"))
  dev.off()
i=i+1
acceptedbyfdrsampleenginesinlge=acceptedbyfdrsampleengine[acceptedbyfdrsampleengine$Sample==listmkks[i,]$`MK/MKK`,]
acceptedbyfdrsampleenginesinlge$Sample<-NULL
png(paste0("FDRACCEPTED/Accpeted proteins by FDR and engine and combining sample = ",listmkks[i,]$`MK/MKK`,".png"),height = 512,width = 512)
ggplot(acceptedbyfdrsampleenginesinlge[acceptedbyfdrsampleenginesinlge$FDR<0.5,]) +
  geom_line(aes(x = FDR, y = Accepted, linetype=Tline))+xlab("False discovery rate")+ylab("# Accepted proteins")+
  labs(title = "Accepted proteins by FDR", subtitle = listmkks[i,]$`MK/MKK` )+
  scale_linetype_discrete(name="Engine",labels=c("MYRIMATCH","COMET","MSGF","COMBINED","XTANDEM"))
dev.off()
i=i+1
acceptedbyfdrsampleenginesinlge=acceptedbyfdrsampleengine[acceptedbyfdrsampleengine$Sample==listmkks[i,]$`MK/MKK`,]
acceptedbyfdrsampleenginesinlge$Sample<-NULL
png(paste0("FDRACCEPTED/Accpeted proteins by FDR and engine and combining sample = ",listmkks[i,]$`MK/MKK`,".png"),height = 512,width = 512)
ggplot(acceptedbyfdrsampleenginesinlge[acceptedbyfdrsampleenginesinlge$FDR<0.5,]) +
  geom_line(aes(x = FDR, y = Accepted, linetype=Tline))+xlab("False discovery rate")+ylab("# Accepted proteins")+
  labs(title = "Accepted proteins by FDR", subtitle = listmkks[i,]$`MK/MKK` )+
  scale_linetype_discrete(name="Engine",labels=c("MYRIMATCH","COMET","MSGF","COMBINED","XTANDEM"))
dev.off()
i=i+1
acceptedbyfdrsampleenginesinlge=acceptedbyfdrsampleengine[acceptedbyfdrsampleengine$Sample==listmkks[i,]$`MK/MKK`,]
acceptedbyfdrsampleenginesinlge$Sample<-NULL
png(paste0("FDRACCEPTED/Accpeted proteins by FDR and engine and combining sample = ",listmkks[i,]$`MK/MKK`,".png"),height = 512,width = 512)
ggplot(acceptedbyfdrsampleenginesinlge[acceptedbyfdrsampleenginesinlge$FDR<0.5,]) +
  geom_line(aes(x = FDR, y = Accepted, linetype=Tline))+xlab("False discovery rate")+ylab("# Accepted proteins")+
  labs(title = "Accepted proteins by FDR", subtitle = listmkks[i,]$`MK/MKK` )+
  scale_linetype_discrete(name="Engine",labels=c("MYRIMATCH","COMET","MSGF","COMBINED","XTANDEM"))
dev.off()
i=i+1
acceptedbyfdrsampleenginesinlge=acceptedbyfdrsampleengine[acceptedbyfdrsampleengine$Sample==listmkks[i,]$`MK/MKK`,]
acceptedbyfdrsampleenginesinlge$Sample<-NULL
png(paste0("FDRACCEPTED/Accpeted proteins by FDR and engine and combining sample = ",listmkks[i,]$`MK/MKK`,".png"),height = 512,width = 512)
ggplot(acceptedbyfdrsampleenginesinlge[acceptedbyfdrsampleenginesinlge$FDR<0.5,]) +
  geom_line(aes(x = FDR, y = Accepted, linetype=Tline))+xlab("False discovery rate")+ylab("# Accepted proteins")+
  labs(title = "Accepted proteins by FDR", subtitle = listmkks[i,]$`MK/MKK` )+
  scale_linetype_discrete(name="Engine",labels=c("MYRIMATCH","COMET","MSGF","COMBINED","XTANDEM"))
dev.off()
i=i+1
acceptedbyfdrsampleenginesinlge=acceptedbyfdrsampleengine[acceptedbyfdrsampleengine$Sample==listmkks[i,]$`MK/MKK`,]
acceptedbyfdrsampleenginesinlge$Sample<-NULL
png(paste0("FDRACCEPTED/Accpeted proteins by FDR and engine and combining sample = ",listmkks[i,]$`MK/MKK`,".png"),height = 512,width = 512)
ggplot(acceptedbyfdrsampleenginesinlge[acceptedbyfdrsampleenginesinlge$FDR<0.5,]) +
  geom_line(aes(x = FDR, y = Accepted, linetype=Tline))+xlab("False discovery rate")+ylab("# Accepted proteins")+
  labs(title = "Accepted proteins by FDR", subtitle = listmkks[i,]$`MK/MKK` )+
  scale_linetype_discrete(name="Engine",labels=c("MYRIMATCH","COMET","MSGF","COMBINED","XTANDEM"))
dev.off()
i=i+1
acceptedbyfdrsampleenginesinlge=acceptedbyfdrsampleengine[acceptedbyfdrsampleengine$Sample==listmkks[i,]$`MK/MKK`,]
acceptedbyfdrsampleenginesinlge$Sample<-NULL
png(paste0("FDRACCEPTED/Accpeted proteins by FDR and engine and combining sample = ",listmkks[i,]$`MK/MKK`,".png"),height = 512,width = 512)
ggplot(acceptedbyfdrsampleenginesinlge[acceptedbyfdrsampleenginesinlge$FDR<0.5,]) +
  geom_line(aes(x = FDR, y = Accepted, linetype=Tline))+xlab("False discovery rate")+ylab("# Accepted proteins")+
  labs(title = "Accepted proteins by FDR", subtitle = listmkks[i,]$`MK/MKK` )+
  scale_linetype_discrete(name="Engine",labels=c("MYRIMATCH","COMET","MSGF","COMBINED","XTANDEM"))
dev.off()
i=i+1
acceptedbyfdrsampleenginesinlge=acceptedbyfdrsampleengine[acceptedbyfdrsampleengine$Sample==listmkks[i,]$`MK/MKK`,]
acceptedbyfdrsampleenginesinlge$Sample<-NULL
png(paste0("FDRACCEPTED/Accpeted proteins by FDR and engine and combining sample = ",listmkks[i,]$`MK/MKK`,".png"),height = 512,width = 512)
ggplot(acceptedbyfdrsampleenginesinlge[acceptedbyfdrsampleenginesinlge$FDR<0.5,]) +
  geom_line(aes(x = FDR, y = Accepted, linetype=Tline))+xlab("False discovery rate")+ylab("# Accepted proteins")+
  labs(title = "Accepted proteins by FDR", subtitle = listmkks[i,]$`MK/MKK` )+
  scale_linetype_discrete(name="Engine",labels=c("MYRIMATCH","COMET","MSGF","COMBINED","XTANDEM"))
dev.off()
i=i+1
acceptedbyfdrsampleenginesinlge=acceptedbyfdrsampleengine[acceptedbyfdrsampleengine$Sample==listmkks[i,]$`MK/MKK`,]
acceptedbyfdrsampleenginesinlge$Sample<-NULL
png(paste0("FDRACCEPTED/Accpeted proteins by FDR and engine and combining sample = ",listmkks[i,]$`MK/MKK`,".png"),height = 512,width = 512)
ggplot(acceptedbyfdrsampleenginesinlge[acceptedbyfdrsampleenginesinlge$FDR<0.5,]) +
  geom_line(aes(x = FDR, y = Accepted, linetype=Tline))+xlab("False discovery rate")+ylab("# Accepted proteins")+
  labs(title = "Accepted proteins by FDR", subtitle = listmkks[i,]$`MK/MKK` )+
  scale_linetype_discrete(name="Engine",labels=c("MYRIMATCH","COMET","MSGF","COMBINED","XTANDEM"))
dev.off()
i=i+1
acceptedbyfdrsampleenginesinlge=acceptedbyfdrsampleengine[acceptedbyfdrsampleengine$Sample==listmkks[i,]$`MK/MKK`,]
acceptedbyfdrsampleenginesinlge$Sample<-NULL
png(paste0("FDRACCEPTED/Accpeted proteins by FDR and engine and combining sample = ",listmkks[i,]$`MK/MKK`,".png"),height = 512,width = 512)
ggplot(acceptedbyfdrsampleenginesinlge[acceptedbyfdrsampleenginesinlge$FDR<0.5,]) +
  geom_line(aes(x = FDR, y = Accepted, linetype=Tline))+xlab("False discovery rate")+ylab("# Accepted proteins")+
  labs(title = "Accepted proteins by FDR", subtitle = listmkks[i,]$`MK/MKK` )+
  scale_linetype_discrete(name="Engine",labels=c("MYRIMATCH","COMET","MSGF","COMBINED","XTANDEM"))
dev.off()
i=i+1
acceptedbyfdrsampleenginesinlge=acceptedbyfdrsampleengine[acceptedbyfdrsampleengine$Sample==listmkks[i,]$`MK/MKK`,]
acceptedbyfdrsampleenginesinlge$Sample<-NULL
png(paste0("FDRACCEPTED/Accpeted proteins by FDR and engine and combining sample = ",listmkks[i,]$`MK/MKK`,".png"),height = 512,width = 512)
ggplot(acceptedbyfdrsampleenginesinlge[acceptedbyfdrsampleenginesinlge$FDR<0.5,]) +
  geom_line(aes(x = FDR, y = Accepted, linetype=Tline))+xlab("False discovery rate")+ylab("# Accepted proteins")+
  labs(title = "Accepted proteins by FDR", subtitle = listmkks[i,]$`MK/MKK` )+
  scale_linetype_discrete(name="Engine",labels=c("MYRIMATCH","COMET","MSGF","COMBINED","XTANDEM"))
dev.off()
i=i+1
acceptedbyfdrsampleenginesinlge=acceptedbyfdrsampleengine[acceptedbyfdrsampleengine$Sample==listmkks[i,]$`MK/MKK`,]
acceptedbyfdrsampleenginesinlge$Sample<-NULL
png(paste0("FDRACCEPTED/Accpeted proteins by FDR and engine and combining sample = ",listmkks[i,]$`MK/MKK`,".png"),height = 512,width = 512)
ggplot(acceptedbyfdrsampleenginesinlge[acceptedbyfdrsampleenginesinlge$FDR<0.5,]) +
  geom_line(aes(x = FDR, y = Accepted, linetype=Tline))+xlab("False discovery rate")+ylab("# Accepted proteins")+
  labs(title = "Accepted proteins by FDR", subtitle = listmkks[i,]$`MK/MKK` )+
  scale_linetype_discrete(name="Engine",labels=c("MYRIMATCH","COMET","MSGF","COMBINED","XTANDEM"))
dev.off()
i=i+1
acceptedbyfdrsampleenginesinlge=acceptedbyfdrsampleengine[acceptedbyfdrsampleengine$Sample==listmkks[i,]$`MK/MKK`,]
acceptedbyfdrsampleenginesinlge$Sample<-NULL
png(paste0("FDRACCEPTED/Accpeted proteins by FDR and engine and combining sample = ",listmkks[i,]$`MK/MKK`,".png"),height = 512,width = 512)
ggplot(acceptedbyfdrsampleenginesinlge[acceptedbyfdrsampleenginesinlge$FDR<0.5,]) +
  geom_line(aes(x = FDR, y = Accepted, linetype=Tline))+xlab("False discovery rate")+ylab("# Accepted proteins")+
  labs(title = "Accepted proteins by FDR", subtitle = listmkks[i,]$`MK/MKK` )+
  scale_linetype_discrete(name="Engine",labels=c("MYRIMATCH","COMET","MSGF","COMBINED","XTANDEM"))
dev.off()
i=i+1
acceptedbyfdrsampleenginesinlge=acceptedbyfdrsampleengine[acceptedbyfdrsampleengine$Sample==listmkks[i,]$`MK/MKK`,]
acceptedbyfdrsampleenginesinlge$Sample<-NULL
png(paste0("FDRACCEPTED/Accpeted proteins by FDR and engine and combining sample = ",listmkks[i,]$`MK/MKK`,".png"),height = 512,width = 512)
ggplot(acceptedbyfdrsampleenginesinlge[acceptedbyfdrsampleenginesinlge$FDR<0.5,]) +
  geom_line(aes(x = FDR, y = Accepted, linetype=Tline))+xlab("False discovery rate")+ylab("# Accepted proteins")+
  labs(title = "Accepted proteins by FDR", subtitle = listmkks[i,]$`MK/MKK` )+
  scale_linetype_discrete(name="Engine",labels=c("MYRIMATCH","COMET","MSGF","COMBINED","XTANDEM"))
dev.off()
i=i+1
acceptedbyfdrsampleenginesinlge=acceptedbyfdrsampleengine[acceptedbyfdrsampleengine$Sample==listmkks[i,]$`MK/MKK`,]
acceptedbyfdrsampleenginesinlge$Sample<-NULL
png(paste0("FDRACCEPTED/Accpeted proteins by FDR and engine and combining sample = ",listmkks[i,]$`MK/MKK`,".png"),height = 512,width = 512)
ggplot(acceptedbyfdrsampleenginesinlge[acceptedbyfdrsampleenginesinlge$FDR<0.5,]) +
  geom_line(aes(x = FDR, y = Accepted, linetype=Tline))+xlab("False discovery rate")+ylab("# Accepted proteins")+
  labs(title = "Accepted proteins by FDR", subtitle = listmkks[i,]$`MK/MKK` )+
  scale_linetype_discrete(name="Engine",labels=c("MYRIMATCH","COMET","MSGF","COMBINED","XTANDEM"))
dev.off()
i=i+1
acceptedbyfdrsampleenginesinlge=acceptedbyfdrsampleengine[acceptedbyfdrsampleengine$Sample==listmkks[i,]$`MK/MKK`,]
acceptedbyfdrsampleenginesinlge$Sample<-NULL
png(paste0("FDRACCEPTED/Accpeted proteins by FDR and engine and combining sample = ",listmkks[i,]$`MK/MKK`,".png"),height = 512,width = 512)
ggplot(acceptedbyfdrsampleenginesinlge[acceptedbyfdrsampleenginesinlge$FDR<0.5,]) +
  geom_line(aes(x = FDR, y = Accepted, linetype=Tline))+xlab("False discovery rate")+ylab("# Accepted proteins")+
  labs(title = "Accepted proteins by FDR", subtitle = listmkks[i,]$`MK/MKK` )+
  scale_linetype_discrete(name="Engine",labels=c("MYRIMATCH","COMET","MSGF","COMBINED","XTANDEM"))
dev.off()
i=i+1
acceptedbyfdrsampleenginesinlge=acceptedbyfdrsampleengine[acceptedbyfdrsampleengine$Sample==listmkks[i,]$`MK/MKK`,]
acceptedbyfdrsampleenginesinlge$Sample<-NULL
png(paste0("FDRACCEPTED/Accpeted proteins by FDR and engine and combining sample = ",listmkks[i,]$`MK/MKK`,".png"),height = 512,width = 512)
ggplot(acceptedbyfdrsampleenginesinlge[acceptedbyfdrsampleenginesinlge$FDR<0.5,]) +
  geom_line(aes(x = FDR, y = Accepted, linetype=Tline))+xlab("False discovery rate")+ylab("# Accepted proteins")+
  labs(title = "Accepted proteins by FDR", subtitle = listmkks[i,]$`MK/MKK` )+
  scale_linetype_discrete(name="Engine",labels=c("MYRIMATCH","COMET","MSGF","COMBINED","XTANDEM"))
dev.off()
i=i+1
acceptedbyfdrsampleenginesinlge=acceptedbyfdrsampleengine[acceptedbyfdrsampleengine$Sample==listmkks[i,]$`MK/MKK`,]
acceptedbyfdrsampleenginesinlge$Sample<-NULL
png(paste0("FDRACCEPTED/Accpeted proteins by FDR and engine and combining sample = ",listmkks[i,]$`MK/MKK`,".png"),height = 512,width = 512)
ggplot(acceptedbyfdrsampleenginesinlge[acceptedbyfdrsampleenginesinlge$FDR<0.5,]) +
  geom_line(aes(x = FDR, y = Accepted, linetype=Tline))+xlab("False discovery rate")+ylab("# Accepted proteins")+
  labs(title = "Accepted proteins by FDR", subtitle = listmkks[i,]$`MK/MKK` )+
  scale_linetype_discrete(name="Engine",labels=c("MYRIMATCH","COMET","MSGF","COMBINED","XTANDEM"))
dev.off()
i=i+1
acceptedbyfdrsampleenginesinlge=acceptedbyfdrsampleengine[acceptedbyfdrsampleengine$Sample==listmkks[i,]$`MK/MKK`,]
acceptedbyfdrsampleenginesinlge$Sample<-NULL
png(paste0("FDRACCEPTED/Accpeted proteins by FDR and engine and combining sample = ",listmkks[i,]$`MK/MKK`,".png"),height = 512,width = 512)
ggplot(acceptedbyfdrsampleenginesinlge[acceptedbyfdrsampleenginesinlge$FDR<0.5,]) +
  geom_line(aes(x = FDR, y = Accepted, linetype=Tline))+xlab("False discovery rate")+ylab("# Accepted proteins")+
  labs(title = "Accepted proteins by FDR", subtitle = listmkks[i,]$`MK/MKK` )+
  scale_linetype_discrete(name="Engine",labels=c("MYRIMATCH","COMET","MSGF","COMBINED","XTANDEM"))
dev.off()
i=i+1
acceptedbyfdrsampleenginesinlge=acceptedbyfdrsampleengine[acceptedbyfdrsampleengine$Sample==listmkks[i,]$`MK/MKK`,]
acceptedbyfdrsampleenginesinlge$Sample<-NULL
png(paste0("FDRACCEPTED/Accpeted proteins by FDR and engine and combining sample = ",listmkks[i,]$`MK/MKK`,".png"),height = 512,width = 512)
ggplot(acceptedbyfdrsampleenginesinlge[acceptedbyfdrsampleenginesinlge$FDR<0.5,]) +
  geom_line(aes(x = FDR, y = Accepted, linetype=Tline))+xlab("False discovery rate")+ylab("# Accepted proteins")+
  labs(title = "Accepted proteins by FDR", subtitle = listmkks[i,]$`MK/MKK` )+
  scale_linetype_discrete(name="Engine",labels=c("MYRIMATCH","COMET","MSGF","COMBINED","XTANDEM"))
dev.off()
i=i+1
acceptedbyfdrsampleenginesinlge=acceptedbyfdrsampleengine[acceptedbyfdrsampleengine$Sample==listmkks[i,]$`MK/MKK`,]
acceptedbyfdrsampleenginesinlge$Sample<-NULL
png(paste0("FDRACCEPTED/Accpeted proteins by FDR and engine and combining sample = ",listmkks[i,]$`MK/MKK`,".png"),height = 512,width = 512)
ggplot(acceptedbyfdrsampleenginesinlge[acceptedbyfdrsampleenginesinlge$FDR<0.5,]) +
  geom_line(aes(x = FDR, y = Accepted, linetype=Tline))+xlab("False discovery rate")+ylab("# Accepted proteins")+
  labs(title = "Accepted proteins by FDR", subtitle = listmkks[i,]$`MK/MKK` )+
  scale_linetype_discrete(name="Engine",labels=c("MYRIMATCH","COMET","MSGF","COMBINED","XTANDEM"))
dev.off()
i=i+1
acceptedbyfdrsampleenginesinlge=acceptedbyfdrsampleengine[acceptedbyfdrsampleengine$Sample==listmkks[i,]$`MK/MKK`,]
acceptedbyfdrsampleenginesinlge$Sample<-NULL
png(paste0("FDRACCEPTED/Accpeted proteins by FDR and engine and combining sample = ",listmkks[i,]$`MK/MKK`,".png"),height = 512,width = 512)
ggplot(acceptedbyfdrsampleenginesinlge[acceptedbyfdrsampleenginesinlge$FDR<0.5,]) +
  geom_line(aes(x = FDR, y = Accepted, linetype=Tline))+xlab("False discovery rate")+ylab("# Accepted proteins")+
  labs(title = "Accepted proteins by FDR", subtitle = listmkks[i,]$`MK/MKK` )+
  scale_linetype_discrete(name="Engine",labels=c("MYRIMATCH","COMET","MSGF","COMBINED","XTANDEM"))
dev.off()
i=i+1
acceptedbyfdrsampleenginesinlge=acceptedbyfdrsampleengine[acceptedbyfdrsampleengine$Sample==listmkks[i,]$`MK/MKK`,]
acceptedbyfdrsampleenginesinlge$Sample<-NULL
png(paste0("FDRACCEPTED/Accpeted proteins by FDR and engine and combining sample = ",listmkks[i,]$`MK/MKK`,".png"),height = 512,width = 512)
ggplot(acceptedbyfdrsampleenginesinlge[acceptedbyfdrsampleenginesinlge$FDR<0.5,]) +
  geom_line(aes(x = FDR, y = Accepted, linetype=Tline))+xlab("False discovery rate")+ylab("# Accepted proteins")+
  labs(title = "Accepted proteins by FDR", subtitle = listmkks[i,]$`MK/MKK` )+
  scale_linetype_discrete(name="Engine",labels=c("MYRIMATCH","COMET","MSGF","COMBINED","XTANDEM"))
dev.off()
i=i+1
acceptedbyfdrsampleenginesinlge=acceptedbyfdrsampleengine[acceptedbyfdrsampleengine$Sample==listmkks[i,]$`MK/MKK`,]
acceptedbyfdrsampleenginesinlge$Sample<-NULL
png(paste0("FDRACCEPTED/Accpeted proteins by FDR and engine and combining sample = ",listmkks[i,]$`MK/MKK`,".png"),height = 512,width = 512)
ggplot(acceptedbyfdrsampleenginesinlge[acceptedbyfdrsampleenginesinlge$FDR<0.5,]) +
  geom_line(aes(x = FDR, y = Accepted, linetype=Tline))+xlab("False discovery rate")+ylab("# Accepted proteins")+
  labs(title = "Accepted proteins by FDR", subtitle = listmkks[i,]$`MK/MKK` )+
  scale_linetype_discrete(name="Engine",labels=c("MYRIMATCH","COMET","MSGF","COMBINED","XTANDEM"))
dev.off()
i=i+1
acceptedbyfdrsampleenginesinlge=acceptedbyfdrsampleengine[acceptedbyfdrsampleengine$Sample==listmkks[i,]$`MK/MKK`,]
acceptedbyfdrsampleenginesinlge$Sample<-NULL
png(paste0("FDRACCEPTED/Accpeted proteins by FDR and engine and combining sample = ",listmkks[i,]$`MK/MKK`,".png"),height = 512,width = 512)
ggplot(acceptedbyfdrsampleenginesinlge[acceptedbyfdrsampleenginesinlge$FDR<0.5,]) +
  geom_line(aes(x = FDR, y = Accepted, linetype=Tline))+xlab("False discovery rate")+ylab("# Accepted proteins")+
  labs(title = "Accepted proteins by FDR", subtitle = listmkks[i,]$`MK/MKK` )+
  scale_linetype_discrete(name="Engine",labels=c("MYRIMATCH","COMET","MSGF","COMBINED","XTANDEM"))
dev.off()
i=i+1
acceptedbyfdrsampleenginesinlge=acceptedbyfdrsampleengine[acceptedbyfdrsampleengine$Sample==listmkks[i,]$`MK/MKK`,]
acceptedbyfdrsampleenginesinlge$Sample<-NULL
png(paste0("FDRACCEPTED/Accpeted proteins by FDR and engine and combining sample = ",listmkks[i,]$`MK/MKK`,".png"),height = 512,width = 512)
ggplot(acceptedbyfdrsampleenginesinlge[acceptedbyfdrsampleenginesinlge$FDR<0.5,]) +
  geom_line(aes(x = FDR, y = Accepted, linetype=Tline))+xlab("False discovery rate")+ylab("# Accepted proteins")+
  labs(title = "Accepted proteins by FDR", subtitle = listmkks[i,]$`MK/MKK` )+
  scale_linetype_discrete(name="Engine",labels=c("MYRIMATCH","COMET","MSGF","COMBINED","XTANDEM"))
dev.off()
i=i+1
acceptedbyfdrsampleenginesinlge=acceptedbyfdrsampleengine[acceptedbyfdrsampleengine$Sample==listmkks[i,]$`MK/MKK`,]
acceptedbyfdrsampleenginesinlge$Sample<-NULL
png(paste0("FDRACCEPTED/Accpeted proteins by FDR and engine and combining sample = ",listmkks[i,]$`MK/MKK`,".png"),height = 512,width = 512)
ggplot(acceptedbyfdrsampleenginesinlge[acceptedbyfdrsampleenginesinlge$FDR<0.5,]) +
  geom_line(aes(x = FDR, y = Accepted, linetype=Tline))+xlab("False discovery rate")+ylab("# Accepted proteins")+
  labs(title = "Accepted proteins by FDR", subtitle = listmkks[i,]$`MK/MKK` )+
  scale_linetype_discrete(name="Engine",labels=c("MYRIMATCH","COMET","MSGF","COMBINED","XTANDEM"))
dev.off()
i=i+1
acceptedbyfdrsampleenginesinlge=acceptedbyfdrsampleengine[acceptedbyfdrsampleengine$Sample==listmkks[i,]$`MK/MKK`,]
acceptedbyfdrsampleenginesinlge$Sample<-NULL
png(paste0("FDRACCEPTED/Accpeted proteins by FDR and engine and combining sample = ",listmkks[i,]$`MK/MKK`,".png"),height = 512,width = 512)
ggplot(acceptedbyfdrsampleenginesinlge[acceptedbyfdrsampleenginesinlge$FDR<0.5,]) +
  geom_line(aes(x = FDR, y = Accepted, linetype=Tline))+xlab("False discovery rate")+ylab("# Accepted proteins")+
  labs(title = "Accepted proteins by FDR", subtitle = listmkks[i,]$`MK/MKK` )+
  scale_linetype_discrete(name="Engine",labels=c("MYRIMATCH","COMET","MSGF","COMBINED","XTANDEM"))
dev.off()
i=i+1
acceptedbyfdrsampleenginesinlge=acceptedbyfdrsampleengine[acceptedbyfdrsampleengine$Sample==listmkks[i,]$`MK/MKK`,]
acceptedbyfdrsampleenginesinlge$Sample<-NULL
png(paste0("FDRACCEPTED/Accpeted proteins by FDR and engine and combining sample = ",listmkks[i,]$`MK/MKK`,".png"),height = 512,width = 512)
ggplot(acceptedbyfdrsampleenginesinlge[acceptedbyfdrsampleenginesinlge$FDR<0.5,]) +
  geom_line(aes(x = FDR, y = Accepted, linetype=Tline))+xlab("False discovery rate")+ylab("# Accepted proteins")+
  labs(title = "Accepted proteins by FDR", subtitle = listmkks[i,]$`MK/MKK` )+
  scale_linetype_discrete(name="Engine",labels=c("MYRIMATCH","COMET","MSGF","COMBINED","XTANDEM"))
dev.off()
i=i+1
acceptedbyfdrsampleenginesinlge=acceptedbyfdrsampleengine[acceptedbyfdrsampleengine$Sample==listmkks[i,]$`MK/MKK`,]
acceptedbyfdrsampleenginesinlge$Sample<-NULL
png(paste0("FDRACCEPTED/Accpeted proteins by FDR and engine and combining sample = ",listmkks[i,]$`MK/MKK`,".png"),height = 512,width = 512)
ggplot(acceptedbyfdrsampleenginesinlge[acceptedbyfdrsampleenginesinlge$FDR<0.5,]) +
  geom_line(aes(x = FDR, y = Accepted, linetype=Tline))+xlab("False discovery rate")+ylab("# Accepted proteins")+
  labs(title = "Accepted proteins by FDR", subtitle = listmkks[i,]$`MK/MKK` )+
  scale_linetype_discrete(name="Engine",labels=c("MYRIMATCH","COMET","MSGF","COMBINED","XTANDEM"))
dev.off()
i=i+1
acceptedbyfdrsampleenginesinlge=acceptedbyfdrsampleengine[acceptedbyfdrsampleengine$Sample==listmkks[i,]$`MK/MKK`,]
acceptedbyfdrsampleenginesinlge$Sample<-NULL
png(paste0("FDRACCEPTED/Accpeted proteins by FDR and engine and combining sample = ",listmkks[i,]$`MK/MKK`,".png"),height = 512,width = 512)
ggplot(acceptedbyfdrsampleenginesinlge[acceptedbyfdrsampleenginesinlge$FDR<0.5,]) +
  geom_line(aes(x = FDR, y = Accepted, linetype=Tline))+xlab("False discovery rate")+ylab("# Accepted proteins")+
  labs(title = "Accepted proteins by FDR", subtitle = listmkks[i,]$`MK/MKK` )+
  scale_linetype_discrete(name="Engine",labels=c("MYRIMATCH","COMET","MSGF","COMBINED","XTANDEM"))
dev.off()
i=i+1
acceptedbyfdrsampleenginesinlge=acceptedbyfdrsampleengine[acceptedbyfdrsampleengine$Sample==listmkks[i,]$`MK/MKK`,]
acceptedbyfdrsampleenginesinlge$Sample<-NULL
png(paste0("FDRACCEPTED/Accpeted proteins by FDR and engine and combining sample = ",listmkks[i,]$`MK/MKK`,".png"),height = 512,width = 512)
ggplot(acceptedbyfdrsampleenginesinlge[acceptedbyfdrsampleenginesinlge$FDR<0.5,]) +
  geom_line(aes(x = FDR, y = Accepted, linetype=Tline))+xlab("False discovery rate")+ylab("# Accepted proteins")+
  labs(title = "Accepted proteins by FDR", subtitle = listmkks[i,]$`MK/MKK` )+
  scale_linetype_discrete(name="Engine",labels=c("MYRIMATCH","COMET","MSGF","COMBINED","XTANDEM"))
dev.off()
i=i+1
acceptedbyfdrsampleenginesinlge=acceptedbyfdrsampleengine[acceptedbyfdrsampleengine$Sample==listmkks[i,]$`MK/MKK`,]
acceptedbyfdrsampleenginesinlge$Sample<-NULL
png(paste0("FDRACCEPTED/Accpeted proteins by FDR and engine and combining sample = ",listmkks[i,]$`MK/MKK`,".png"),height = 512,width = 512)
ggplot(acceptedbyfdrsampleenginesinlge[acceptedbyfdrsampleenginesinlge$FDR<0.5,]) +
  geom_line(aes(x = FDR, y = Accepted, linetype=Tline))+xlab("False discovery rate")+ylab("# Accepted proteins")+
  labs(title = "Accepted proteins by FDR", subtitle = listmkks[i,]$`MK/MKK` )+
  scale_linetype_discrete(name="Engine",labels=c("MYRIMATCH","COMET","MSGF","COMBINED","XTANDEM"))
dev.off()
i=i+1
acceptedbyfdrsampleenginesinlge=acceptedbyfdrsampleengine[acceptedbyfdrsampleengine$Sample==listmkks[i,]$`MK/MKK`,]
acceptedbyfdrsampleenginesinlge$Sample<-NULL
png(paste0("FDRACCEPTED/Accpeted proteins by FDR and engine and combining sample = ",listmkks[i,]$`MK/MKK`,".png"),height = 512,width = 512)
ggplot(acceptedbyfdrsampleenginesinlge[acceptedbyfdrsampleenginesinlge$FDR<0.5,]) +
  geom_line(aes(x = FDR, y = Accepted, linetype=Tline))+xlab("False discovery rate")+ylab("# Accepted proteins")+
  labs(title = "Accepted proteins by FDR", subtitle = listmkks[i,]$`MK/MKK` )+
  scale_linetype_discrete(name="Engine",labels=c("MYRIMATCH","COMET","MSGF","COMBINED","XTANDEM"))
dev.off()
i=i+1
acceptedbyfdrsampleenginesinlge=acceptedbyfdrsampleengine[acceptedbyfdrsampleengine$Sample==listmkks[i,]$`MK/MKK`,]
acceptedbyfdrsampleenginesinlge$Sample<-NULL
png(paste0("FDRACCEPTED/Accpeted proteins by FDR and engine and combining sample = ",listmkks[i,]$`MK/MKK`,".png"),height = 512,width = 512)
ggplot(acceptedbyfdrsampleenginesinlge[acceptedbyfdrsampleenginesinlge$FDR<0.5,]) +
  geom_line(aes(x = FDR, y = Accepted, linetype=Tline))+xlab("False discovery rate")+ylab("# Accepted proteins")+
  labs(title = "Accepted proteins by FDR", subtitle = listmkks[i,]$`MK/MKK` )+
  scale_linetype_discrete(name="Engine",labels=c("MYRIMATCH","COMET","MSGF","COMBINED","XTANDEM"))
dev.off()
