#working with binary variables 

#install.packages("ggpubr")


library(here)
library(ggplot2)
library(tidyr)
library(dplyr)
library(wesanderson)
library(viridis)
library(grid)
library(gridExtra)
library(ggpubr)

#get out data 

EJ <- read.csv(here("4-07forclass.csv"))
#colnames(EJ)[18] <- "minoritybin"
#colnames(EJ)[20] <- "lowincomebin"
#colnames(EJ)[23] <- "Edubin"
#colnames(EJ)[31] <- "insideoutsidebin"

#write.csv(EJ, here("4-07forclass.csv"))


#Basic Stats 

EJ$minoritybin <- as.numeric(EJ$minoritybin)
EJ$lowincomebin <- as.numeric(EJ$lowincomebin)
EJ$Edubin <- as.numeric(EJ$Edubin)
EJ$insideoutsidebin <- as.numeric(EJ$insideoutsidebin)

maxminor <- max(EJ$minoritybin, na.rm=TRUE)
maxminor

minminor <- min(EJ$minoritybin, na.rm=TRUE)
minminor

averageminor <- mean(EJ$minoritybin, na.rm=TRUE)
averageminor

#countif 

percentminority <- count
