library(data.table)
library(Gviz)

setwd("~/Downloads/asi/hw6")
# setwd("/gpfs/scratch/np788/hw6")

bedgraph_50 <- fread('SRR7992450.bedgraph',
  col.names = c('chromosome', 'start', 'end', 'value')
)

bedgraph_51 <- fread('SRR7992451.bedgraph',
                     col.names = c('chromosome', 'start', 'end', 'value')
)

bedgraph_52 <- fread('SRR7992452.bedgraph',
                     col.names = c('chromosome', 'start', 'end', 'value')
)

bedgraph_53 <- fread('SRR7992453.bedgraph',
                     col.names = c('chromosome', 'start', 'end', 'value')
)

bedgraph_56 <- fread('SRR7992456.bedgraph',
                     col.names = c('chromosome', 'start', 'end', 'value')
)

bedgraph_57 <- fread('SRR7992457.bedgraph',
                     col.names = c('chromosome', 'start', 'end', 'value')
)

thechr <- "chr9"
st <- 21075105
en <- 21079942

bedgraph_51_one_chr <- bedgraph_51[chromosome == thechr]
bedgraph_52_one_chr <- bedgraph_52[chromosome == thechr]
bedgraph_53_one_chr <- bedgraph_53[chromosome == thechr]

bedgraph_50_one_chr <- bedgraph_50[chromosome == thechr]
bedgraph_57_one_chr <- bedgraph_57[chromosome == thechr]
bedgraph_56_one_chr <- bedgraph_56[chromosome == thechr]

dtrack50 <- DataTrack(
  range = bedgraph_50_one_chr,
  type = "a",
  genome = 'hg38',
  name = "IDS1"
)

dtrack53 <- DataTrack(
  range = bedgraph_53_one_chr,
  type = "a",
  genome = 'hg38',
  name = "mDS1"
)

dtrack57 <- DataTrack(
  range = bedgraph_57_one_chr,
  type = "a",
  genome = 'hg38',
  name = "iDS2"
)

dtrack52 <- DataTrack(
  range = bedgraph_52_one_chr,
  type = "a",
  genome = 'hg38',
  name = "mDS2"
)

dtrack56 <- DataTrack(
  range = bedgraph_56_one_chr,
  type = "a",
  genome = 'hg38',
  name = "iDS3"
)

dtrack51 <- DataTrack(
  range = bedgraph_51_one_chr,
  type = "a",
  genome = 'hg38',
  name = "mDS3"
)

itrack <- IdeogramTrack(genome = "hg38", chromosome = thechr)

gtrack <- GenomeAxisTrack()

#pdf("img.pdf")
plotTracks(
  list(itrack, gtrack, dtrack50, dtrack53, dtrack57, dtrack52, dtrack56, dtrack51),
  from = st, to = en, ylim = c(0,50))
#dev.off()
