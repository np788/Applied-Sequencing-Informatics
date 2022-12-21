library(data.table)
library(Gviz)
library(GenomicFeatures)
library(rtracklayer)


setwd("~/Downloads/asi/hw6")

myChr = "genome.fa"

myStart = 1
myEnd = 250000

gtrack<-GenomeAxisTrack(col="black") ##Adds genome axis

modelsPos<-makeTxDbFromGFF("genes.gtf", format="gtf")
# rtrackFor <- GeneRegionTrack(modelsPos, genome = "hg38", chromosome = "genome.fa", name = "Gene model", col="black", fill="light blue", stacking="squish", shape="smallArrow", background.title = "transparent", options(ucscChromosomeNames=FALSE)) #squish #dense

file2 <- fread('SRR7992452.bedgraph', col.names = c('chromosome', 'start', 'end', 'value'))
file1 <- fread('SRR7992451.bedgraph', col.names = c('chromosome', 'start', 'end', 'value'))

file1<-file1[file1$start>myStart]
file1<-file1[file1$end<myEnd,]
max1<-max(file1$value)

file2<-file2[file2$start>myStart]
file2<-file2[file2$end<myEnd,]
max2<-max(file2$value)


dataTrack1 <- DataTrack(range = file1, type = "a", chromosome=myChr, genome = 'hg38', fill = "gold1", col = "gold1", options(ucscChromosomeNames=FALSE),col.axis="black", background.title = "transparent", ylim=c(0,max1))
dataTrack2 <- DataTrack(range = file2, type = "a", chromosome=myChr, genome = 'hg38', fill = "gold1", col = "gold1", options(ucscChromosomeNames=FALSE),col.axis="black", background.title = "transparent", ylim=c(0,max1))

plotTracks(list(dataTrack1,dataTrack2,gtrack), from = myStart, to = myEnd, sizes=c(0.16,0.16,0.16), type="hist", col.histogram=NA, cex.title=1, cex.axis=1, title.width=1.2, collapse=FALSE)
