library(gprofiler2)
# http://biit.cs.ut.ee/gprofiler/gost
# https://cran.r-project.org/web/packages/gprofiler2/vignettes/gprofiler2.html

# Q2

atac_narrow = read.csv("~/Downloads/asi/project/atac/callpeak_narrow/atac_narrow_combined_bed.csv")
atac_broad = read.csv("~/Downloads/asi/project/atac/callpeak_broad/atac_broad_combined_bed.csv")

rna = read.csv("~/Downloads/asi/project/rna/rna_df.csv")
chip = read.csv("~/Downloads/asi/project/chip/callpeak/chip_combined_bed.csv")

#broad1 = intersect(as.character(rna$X), rownames(atac_broad))
broad1 = intersect(rna$X, atac_broad$Entrez.ID)
broad2 = intersect(broad1, chip$Entrez.ID)
length(broad2)

narrow1 = intersect(rna$X, atac_narrow$Entrez.ID)
narrow2 = intersect(narrow1, chip$Entrez.ID)
length(narrow2)


write.table(broad2, "~/Downloads/asi/project/broad.csv", sep = ",", row.names = FALSE, col.names = FALSE)
write.table(narrow2, "~/Downloads/asi/project/narrow.csv", sep = ",", row.names = FALSE, col.names = FALSE)

gostres <- gost(query = broad2, 
                organism = "hsapiens", ordered_query = FALSE, 
                multi_query = FALSE, significant = TRUE, exclude_iea = FALSE, 
                measure_underrepresentation = FALSE, evcodes = FALSE, 
                user_threshold = 0.05, correction_method = "fdr", 
                domain_scope = "annotated", custom_bg = NULL, 
                numeric_ns = "", sources = NULL, as_short_link = FALSE)

gostplot(gostres, capped = FALSE, interactive = TRUE)


# Q3

broad_int = read.csv("~/Downloads/asi/project/broad_int.csv")
broad_rna = intersect(rna$X, broad_int$Entrez.ID)
length(broad_rna)

narrow_int = read.csv("~/Downloads/asi/project/narrow_int.csv")
narrow_rna = intersect(rna$X, narrow_int$Entrez.ID)
length(narrow_rna)

write.table(broad_rna, "~/Downloads/asi/project/broad_rna.csv", sep = ",", row.names = FALSE, col.names = FALSE)
write.table(narrow_rna, "~/Downloads/asi/project/narrow_rna.csv", sep = ",", row.names = FALSE, col.names = FALSE)

gostres <- gost(query = narrow_rna, 
                organism = "hsapiens", ordered_query = FALSE, 
                multi_query = FALSE, significant = TRUE, exclude_iea = FALSE, 
                measure_underrepresentation = FALSE, evcodes = FALSE, 
                user_threshold = 0.05, correction_method = "fdr", 
                domain_scope = "annotated", custom_bg = NULL, 
                numeric_ns = "", sources = NULL, as_short_link = FALSE)

gostplot(gostres, capped = FALSE, interactive = TRUE)

#rna = read.csv("~/Downloads/asi/project/rna/rna_df.csv")
