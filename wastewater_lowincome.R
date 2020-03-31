#working with Wastewater and low income EJ screen varaibles 

3install.packages("ggpubr")


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

EJ <- read.csv(here("onlyEJscreen_master.csv"))
colnames(EJ)[21] <- "wastewater"


#get averages for wasterwater 

EJ$wastewater <- as.numeric(EJ$wastewater)

maxwaster <- max(EJ$wastewater, na.rm=TRUE)
maxwaster

minwaster <- min(EJ$wastewater, na.rm=TRUE)
minwaster

average <- mean(EJ$wastewater, na.rm=TRUE)
average

averageNH <- mean(EJ$wastewater[ which(EJ$County == "Northampton County")])
averageNH

averageHAL <- mean(EJ$wastewater[ which(EJ$County == "Halifax County")], na.rm=TRUE)
averageHAL

averageHERT <- mean(EJ$wastewater[ which(EJ$County == "Hertford County")])
averageHERT

#visualizing data just to test 

test <- ggscatter(EJ, x = "wastewater", y = "Ozone..ppb.", 
          add = "reg.line", conf.int = TRUE, 
          cor.coef = TRUE, cor.method = "pearson",
          xlab = "wastewater", ylab = "ozone")

test

#now just do the pearson correlation 
ozone <- cor.test(EJ$wastewater, EJ$Ozone..ppb., 
                method = "pearson")
ozone

PM <- cor.test(EJ$wastewater, EJ$Particulate.Matter..PM.2.5.in.ug.m3., 
                  method = "pearson")
PM

natad <- cor.test(EJ$wastewater, EJ$NATA.Diesel.PM..ug.m3., 
                  method = "pearson")
natad

nataair <- cor.test(EJ$wastewater, EJ$NATA.Air.Toxics.Cancer.Risk..risk.per.MM., 
                  method = "pearson")
nataair


natahaz <- cor.test(EJ$wastewater, EJ$NATA.Respiratory.Hazard.Index, 
                  method = "pearson")
natahaz


haz <- cor.test(EJ$wastewater, EJ$Hazardous.Waste.Proximity..facility.count.km.distance., 
                  method = "pearson")
haz


RMP <- cor.test(EJ$wastewater, EJ$RMP.Proximity..facility.count.km.distance., 
                  method = "pearson")
RMP


lead <- cor.test(EJ$wastewater, EJ$Lead.Paint.Indicator....pre.1960s.housing., 
                  method = "pearson")
lead


super <- cor.test(EJ$wastewater, EJ$Superfund.Proximity..site.count.km.distance., 
                  method = "pearson")
super


#demographic comparioson 

minor <- cor.test(EJ$wastewater, EJ$Minority.Population, 
                  method = "pearson")
minor