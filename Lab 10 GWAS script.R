 source("https://raw.githubusercontent.com/jiabowang/GAPIT/master/gapit_functions.txt")
 
 myY <- read.table(file = "http://zzlab.net/GAPIT/data/mdp_traits.txt", header = TRUE)
 View(myY)

 myGD <- read.table(file = "http://zzlab.net/GAPIT/data/mdp_numeric.txt", header = TRUE)
 head(myGD)[ ,c(1:10)] # just check the top 10 columns 

 myGM <- read.table(file = "http://zzlab.net/GAPIT/data/mdp_SNP_information.txt", header = TRUE)
 head(myGM)
 
 
 myGAPIT=GAPIT(
   Y=myY[,c(1,2)],      # Phenotypes: fist column is genotype ID and second is a phenotype
   GD=myGD,	      	# SNP marker matrix	
   GM=myGM,	# Marker map (position)
   PCA.total=3,	# PC number for population structure correction
   model=c("MLM"))  

 View(myGAPIT$GWAS) 
 
 install.packages("qqman")
 library(qqman)
 library(ggplot2)

 result <- read.csv("GAPIT.Association.GWAS_Results.MLM.EarHT.csv",  header = T)
 head(result)


 png("manhattan_plot_PZA03188.4.png", width = 8, height = 4, units = "in", res = 300 )
 
 manhattan(result, main="Ear height", chr = "Chr", bp = "Pos", p = "P.value", snp = "SNP",           
           col = c("blue", "orange"),           
           genomewideline = 3.5,  highlight = "PZA03188.4"  )
 
 dev.off()
 
 
 #Activity
 getwd()
 setwd("C:/Users/Student/Desktop/Biotech II/gwas/activity")
 activityGAPIT=GAPIT(
   Y=myY[,c(1,3)],      # Phenotypes: fist column is genotype ID and second is a phenotype
   GD=myGD,	      	# SNP marker matrix	
   GM=myGM,	# Marker map (position)
   PCA.total=3,	# PC number for population structure correction
   model=c("MLM"))  
 
 View(activityGAPIT$GWAS) 
 
 install.packages("qqman")
 library(qqman)
 library(ggplot2)
 
 result <- read.csv("GAPIT.Association.GWAS_Results.MLM.dpoll.csv",  header = T)
 head(result)
 
 
 png("manhattan_plot_activity.png", width = 8, height = 4, units = "in", res = 300 )
 
 manhattan(result, main="dPoll", chr = "Chr", bp = "Pos", p = "P.value", snp = "SNP",           
           col = c("#004D98", "#DB0030"),           
           genomewideline = 3,  highlight = c("PZA03591.1", "PZB01013.1"  ))
 
 dev.off()
 
 
 
 
 
 
