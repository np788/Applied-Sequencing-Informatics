

setwd("~/Downloads/asi/hw6")

f1f7<-read.csv("./f1f7/Mod.csv", header=TRUE)
f2f8<-read.csv("./f2f8/Mod.csv", header=TRUE)
f3f9<-read.csv("./f3f9/Mod.csv", header=TRUE)

f4f10<-read.csv("./f4f10/Mod.csv", header=TRUE)
f5f11<-read.csv("./f5f11/Mod.csv", header=TRUE)
f6f12<-read.csv("./f6f12/Mod.csv", header=TRUE)


length(unique(f1f7[["geneID"]]))
length(unique(f2f8[["geneID"]]))
length(unique(f3f9[["geneID"]]))

length(unique(f4f10[["geneID"]]))
length(unique(f5f11[["geneID"]]))
length(unique(f6f12[["geneID"]]))

int1 = intersect(f4f10$geneID,f5f11$geneID)
int2 = intersect(f4f10$geneID,f6f12$geneID)
int3 = intersect(f5f11$geneID,f6f12$geneID)

dsu1 = union(int1,int2)
dsu_f = union(dsu1,int3) #All genes that appear in at least two test DSs

ctrlu = union(f1f7$geneID,f2f8$geneID)
ctrlu_f = union(ctrlu,f3f9$geneID) #Genes that appear in all the control DSs

length(setdiff(dsu_f,ctrlu_f))

