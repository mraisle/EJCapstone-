#working with Wastewater and low income EJ screen varaibles 

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

EJ <- read.csv(here("onlyEJscreen_master.csv"))
colnames(EJ)[23] <- "wastewater"
colnames(EJ)[24] <- "DemIndex"

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


lowin <- cor.test(EJ$wastewater, EJ$Low.Income.Population, 
                  method = "pearson")
lowin

ling <- cor.test(EJ$wastewater, EJ$Linguistically.Isolated.Population, 
                  method = "pearson")
ling

edu <- cor.test(EJ$wastewater, EJ$Population.with.Less.Than.High.School.Education, 
                  method = "pearson")
edu

baby <- cor.test(EJ$wastewater, EJ$Population.under.Age.5, 
                  method = "pearson")
baby

old <- cor.test(EJ$wastewater, EJ$Population.over.Age.64, 
                 method = "pearson")
old





#low-income stuff 

colnames(EJ)[26] <- "lowincome"

maxincome <- max(EJ$lowincome, na.rm=TRUE)
maxincome

minincome <- min(EJ$lowincome, na.rm=TRUE)
minincome

average <- mean(EJ$lowincome, na.rm=TRUE)
average

averageNH <- mean(EJ$lowincome[ which(EJ$County == "Northampton County")])
averageNH

averageHAL <- mean(EJ$lowincome[ which(EJ$County == "Halifax County")], na.rm=TRUE)
averageHAL

averageHERT <- mean(EJ$lowincome[ which(EJ$County == "Hertford County")])
averageHERT

#compare to other demo variables 

minor2 <- cor.test(EJ$lowincome, EJ$Minority.Population, 
                  method = "pearson")
minor2

ling2 <- cor.test(EJ$lowincome, EJ$Linguistically.Isolated.Population, 
                 method = "pearson")
ling2

edu2 <- cor.test(EJ$lowincome, EJ$Population.with.Less.Than.High.School.Education, 
                method = "pearson")
edu2

baby2 <- cor.test(EJ$lowincome, EJ$Population.under.Age.5, 
                 method = "pearson")
baby2

old2 <- cor.test(EJ$lowincome, EJ$Population.over.Age.64, 
                method = "pearson")
old2

#compare EJ variables 

ozone2 <- cor.test(EJ$lowincome, EJ$Ozone..ppb., 
                  method = "pearson")
ozone2

PM2 <- cor.test(EJ$lowincome, EJ$Particulate.Matter..PM.2.5.in.ug.m3., 
               method = "pearson")
PM2

natad2 <- cor.test(EJ$lowincome, EJ$NATA.Diesel.PM..ug.m3., 
                  method = "pearson")
natad2

nataair2 <- cor.test(EJ$lowincome, EJ$NATA.Air.Toxics.Cancer.Risk..risk.per.MM., 
                    method = "pearson")
nataair2


natahaz2 <- cor.test(EJ$lowincome, EJ$NATA.Respiratory.Hazard.Index, 
                    method = "pearson")
natahaz2


haz2 <- cor.test(EJ$lowincome, EJ$Hazardous.Waste.Proximity..facility.count.km.distance., 
                method = "pearson")
haz2


RMP2 <- cor.test(EJ$lowincome, EJ$RMP.Proximity..facility.count.km.distance., 
                method = "pearson")
RMP2


lead2 <- cor.test(EJ$lowincome, EJ$Lead.Paint.Indicator....pre.1960s.housing., 
                 method = "pearson")
lead2


super2 <- cor.test(EJ$lowincome, EJ$Superfund.Proximity..site.count.km.distance., 
                  method = "pearson")
super2

#ok now we're just going to run all these tests but for demographic index 

EJ$DemIndex <- as.numeric(EJ$DemIndex)

maxdem <- max(EJ$DemIndex, na.rm=TRUE)
maxdem

mindem <- min(EJ$DemIndex, na.rm=TRUE)
mindem

averagedem <- mean(EJ$DemIndex, na.rm=TRUE)
averagedem

averageNHdem <- mean(EJ$DemIndex[ which(EJ$County == "Northampton County")])
averageNHdem

averageHALdem <- mean(EJ$DemIndex[ which(EJ$County == "Halifax County")], na.rm=TRUE)
averageHALdem

averageHERTdem <- mean(EJ$DemIndex[ which(EJ$County == "Hertford County")])
averageHERTdem

#compare to other demo variables 

minor2dem <- cor.test(EJ$DemIndex, EJ$Minority.Population, 
                   method = "pearson")
minor2dem

ling2dem <- cor.test(EJ$DemIndex, EJ$Linguistically.Isolated.Population, 
                  method = "pearson")
ling2dem

edu2dem <- cor.test(EJ$DemIndex, EJ$Population.with.Less.Than.High.School.Education, 
                 method = "pearson")
edu2dem

baby2dem <- cor.test(EJ$DemIndex, EJ$Population.under.Age.5, 
                  method = "pearson")
baby2dem

old2dem <- cor.test(EJ$DemIndex, EJ$Population.over.Age.64, 
                 method = "pearson")
old2dem

#compare EJ variables 

ozone2dem <- cor.test(EJ$DemIndex, EJ$Ozone..ppb., 
                   method = "pearson")
ozone2dem

PM2dem <- cor.test(EJ$DemIndex, EJ$Particulate.Matter..PM.2.5.in.ug.m3., 
                method = "pearson")
PM2dem

natad2dem <- cor.test(EJ$DemIndex, EJ$NATA.Diesel.PM..ug.m3., 
                   method = "pearson")
natad2dem

nataair2dem <- cor.test(EJ$DemIndex, EJ$NATA.Air.Toxics.Cancer.Risk..risk.per.MM., 
                     method = "pearson")
nataair2dem


natahaz2dem <- cor.test(EJ$DemIndex, EJ$NATA.Respiratory.Hazard.Index, 
                     method = "pearson")
natahaz2dem


haz2dem <- cor.test(EJ$DemIndex, EJ$Hazardous.Waste.Proximity..facility.count.km.distance., 
                 method = "pearson")
haz2dem


RMP2dem <- cor.test(EJ$DemIndex, EJ$RMP.Proximity..facility.count.km.distance., 
                 method = "pearson")
RMP2dem


lead2dem <- cor.test(EJ$DemIndex, EJ$Lead.Paint.Indicator....pre.1960s.housing., 
                  method = "pearson")
lead2dem


super2dem <- cor.test(EJ$DemIndex, EJ$Superfund.Proximity..site.count.km.distance., 
                   method = "pearson")
super2dem

