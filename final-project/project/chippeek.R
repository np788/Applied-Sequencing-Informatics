library(ChIPseeker)
library("TxDb.Hsapiens.UCSC.hg38.knownGene")

setwd("/Users/parghi/Downloads/asi/project/atac/")

txdb = TxDb.Hsapiens.UCSC.hg38.knownGene

file = "atac1_peaks.broadPeak"

peak <- readPeakFile(refseq)

peakAnno <- as.data.frame(annotatePeak(refseq, tssRegion=c(-3000, 3000), TxDb=txdb, annoDb="org.Hs.eg.db"))

peakAnno_atac3 <- as.data.frame(annotatePeak(atac3, tssRegion=c(-3000, 3000),
                                             TxDb=txdb, annoDb="org.Hs.eg.db"))
