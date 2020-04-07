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