### https://bioconductor.org/packages/release/bioc/html/exomePeak2.html
### https://bioconductor.org/packages/release/bioc/vignettes/exomePeak2/inst/doc/Vignette_V_0.99.html

library("exomePeak2")

setwd("/gpfs/scratch/np788/hw6")

gtf<-"/gpfs/scratch/np788/Homo_sapiens/UCSC/hg38/Annotation/Archives/archive-2015-08-14-08-18-15/Genes.gencode/genes.gtf"

#ictrl1 = input rna
#mctrl1 = ip

#iCTRL - input RNA

f1 <- "./SRR7992458/SRR7992458Aligned.sortedByCoord.out.bam"
f2 <- "./SRR7992461/SRR7992461Aligned.sortedByCoord.out.bam"
f3 <- "./SRR7992460/SRR7992460Aligned.sortedByCoord.out.bam"

#iDS - input RNA

f4 <- "./SRR7992450/SRR7992450Aligned.sortedByCoord.out.bam"
f5 <- "./SRR7992457/SRR7992457Aligned.sortedByCoord.out.bam"
f6 <- "./SRR7992456/SRR7992456Aligned.sortedByCoord.out.bam"

#mCTRL - IP

f7 <- "./SRR7992455/SRR7992455Aligned.sortedByCoord.out.bam"
f8 <- "./SRR7992454/SRR7992454Aligned.sortedByCoord.out.bam"
f9 <- "./SRR7992459/SRR7992459Aligned.sortedByCoord.out.bam"

#mDS - IP

f10 <- "./SRR7992453/SRR7992453Aligned.sortedByCoord.out.bam"
f11 <- "./SRR7992452/SRR7992452Aligned.sortedByCoord.out.bam"
f12 <- "./SRR7992451/SRR7992451Aligned.sortedByCoord.out.bam"



f1f7 <- exomePeak2(bam_ip = f7, bam_input = f1,  gff_dir = gtf, paired_end = FALSE, save_plot_name = "f1f7", save_dir = "f1f7")
f2f8 <- exomePeak2(bam_ip = f8, bam_input = f2,  gff_dir = gtf, paired_end = FALSE, save_plot_name = "f2f8", save_dir = "f2f8")
f3f9 <- exomePeak2(bam_ip = f9, bam_input = f3,  gff_dir = gtf, paired_end = FALSE, save_plot_name = "f3f9", save_dir = "f3f9")

f4f10 <- exomePeak2(bam_ip = f10, bam_input = f4,  gff_dir = gtf, paired_end = FALSE, save_plot_name = "f4f10", save_dir = "f4f10")
f5f11 <- exomePeak2(bam_ip = f11, bam_input = f5,  gff_dir = gtf, paired_end = FALSE, save_plot_name = "f5f11", save_dir = "f5f11")
f6f12 <- exomePeak2(bam_ip = f12, bam_input = f6,  gff_dir = gtf, paired_end = FALSE, save_plot_name = "f6f12", save_dir = "f6f12")





