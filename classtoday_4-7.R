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
library(glmnet)


#get out data 

EJ <- read.csv(here("4-07forclass.csv"))
EJ <- EJ[1:440,]

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

x <- c(EJ$minoritybin)
count <- 0
for (val in x) {
  if(val %% 2 == 0)  count = count+1
}
print(count)

trueCount <- 440 - count
trueCount

#minority Binary with EJ 
ozone <- cor.test(EJ$minoritybin, EJ$Ozone..ppb., 
                  method = "pearson")
ozone

PMmin <- cor.test(EJ$minoritybin, EJ$Particulate.Matter..PM.2.5.in.ug.m3., 
               method = "pearson")
PMmin

natadmin <- cor.test(EJ$minoritybin, EJ$NATA.Diesel.PM..ug.m3., 
                  method = "pearson")
natadmin

nataairmin <- cor.test(EJ$minoritybin, EJ$NATA.Air.Toxics.Cancer.Risk..risk.per.MM., 
                    method = "pearson")
nataairmin


natahazmin <- cor.test(EJ$minoritybin, EJ$NATA.Respiratory.Hazard.Index, 
                    method = "pearson")
natahazmin


hazmin <- cor.test(EJ$minoritybin, EJ$Hazardous.Waste.Proximity..facility.count.km.distance., 
                method = "pearson")
hazmin


RMPmin <- cor.test(EJ$minoritybin, EJ$RMP.Proximity..facility.count.km.distance., 
                method = "pearson")
RMPmin


leadmin <- cor.test(EJ$minoritybin, EJ$Lead.Paint.Indicator....pre.1960s.housing., 
                 method = "pearson")
leadmin


supermin <- cor.test(EJ$minoritybin, EJ$Superfund.Proximity..site.count.km.distance., 
                  method = "pearson")
supermin


arsenic <- cor.test(EJ$minoritybin, EJ$Arsenic.RNG, 
                     method = "pearson")
arsenic

#testing logit regression 

regression.object <- glm(Manganese.RNG ~ minoritybin + lowincomebin + Edubin, family="binominal",
                         data = EJ)
summary(regression.object)

