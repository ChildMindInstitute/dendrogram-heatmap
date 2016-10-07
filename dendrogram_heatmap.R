# From the BioConductor R package: http://manuals.bioinformatics.ucr.edu/home/R_BioCondManual#clustering_primer
# (c/o Aki at CMI, 2016)
# Apache v2.0 License

hr <- hclust(as.dist(1-cor(t(Std_IVs_CBCL_Full), method="spearman")), method="ward.D2"); 
hc <- hclust(as.dist(1-cor(Std_IVs_CBCL_Full, method="spearman")), method="ward.D2")
heatmap(Std_IVs_CBCL_Full, Rowv=as.dendrogram(hr), Colv=as.dendrogram(hc), col=inferno(256), scale="row", density.info="none", trace="none", RowSideColors=mycolhc)
mycl <- cutree(hr, h=max(hr$height)/1.5); mycolhc <- rainbow(length(unique(mycl)), start=0.1, end=0.9); 
mycolhc <- mycolhc[as.vector(mycl)]
NewMat<-as.matrix(print(mycl))


#Then this code you can use to extract the group assignments, which you can use for later analysis.

Group1<-mycl[ which(mycl=='1')]
Group1Labels<-as.matrix(print(Group1))
Group1Labels<-(rownames(Group1Labels))
Group1Data<-Std_IVs_CBCL_Full[Group1Labels,]
Group1Data<-data.frame(Group1Data)

Group2<-mycl[ which(mycl=='2')]
Group2Labels<-as.matrix(print(Group2))
Group2Labels<-(rownames(Group2Labels))
Group2Data<-Std_IVs_CBCL_Full[Group2Labels,]
Group2Data<-data.frame(Group2Data)
