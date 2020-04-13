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

EJ2 <- read.csv(here("4-07forclass.csv"))
EJ2 <- EJ2[1:440,]

#colnames(EJ)[18] <- "minoritybin"
#colnames(EJ)[20] <- "lowincomebin"
#colnames(EJ)[23] <- "Edubin"
#colnames(EJ)[31] <- "insideoutsidebin"

#write.csv(EJ, here("4-07forclass.csv"))


#Basic Stats 

EJ2$minoritybin <- as.numeric(EJ2$minoritybin)
EJ2$lowincomebin <- as.numeric(EJ2$lowincomebin)
EJ2$Edubin <- as.numeric(EJ2$Edubin)
EJ2$insideoutsidebin <- as.numeric(EJ2$insideoutsidebin)

maxminor <- max(EJ2$minoritybin, na.rm=TRUE)
maxminor

minminor <- min(EJ2$minoritybin, na.rm=TRUE)
minminor

averageminor <- mean(EJ2$minoritybin, na.rm=TRUE)
averageminor

#countifminority

x <- c(EJ2$minoritybin)
count <- 0
for (val in x) {
  if(val %% 2 == 0)  count = count+1
}
print(count)

trueCount <- 440 - count
trueCount

#countifEDU

x <- c(EJ2$Edubin)
count <- 0
for (val in x) {
  if(val %% 2 == 0)  count = count+1
}
print(count)

trueCountedu <- 440 - count
trueCountedu


#minority Binary with EJ2 
ozone <- cor.test(EJ2$minoritybin, EJ2$Ozone..ppb., 
                  method = "pearson")
ozone

PMmin <- cor.test(EJ2$minoritybin, EJ2$Particulate.Matter..PM.2.5.in.ug.m3., 
               method = "pearson")
PMmin

natadmin <- cor.test(EJ2$minoritybin, EJ2$NATA.Diesel.PM..ug.m3., 
                  method = "pearson")
natadmin

nataairmin <- cor.test(EJ2$minoritybin, EJ2$NATA.Air.Toxics.Cancer.Risk..risk.per.MM., 
                    method = "pearson")
nataairmin


natahazmin <- cor.test(EJ2$minoritybin, EJ2$NATA.Respiratory.Hazard.Index, 
                    method = "pearson")
natahazmin


hazmin <- cor.test(EJ2$minoritybin, EJ2$Hazardous.Waste.Proximity..facility.count.km.distance., 
                method = "pearson")
hazmin


RMPmin <- cor.test(EJ2$minoritybin, EJ2$RMP.Proximity..facility.count.km.distance., 
                method = "pearson")
RMPmin


leadmin <- cor.test(EJ2$minoritybin, EJ2$Lead.Paint.Indicator....pre.1960s.housing., 
                 method = "pearson")
leadmin


supermin <- cor.test(EJ2$minoritybin, EJ2$Superfund.Proximity..site.count.km.distance., 
                  method = "pearson")
supermin


arsenic <- cor.test(EJ2$minoritybin, EJ2$Arsenic.RNG, 
                     method = "pearson")
arsenic

#testing logit regression 

regression.object <- glm(Manganese.RNG ~ minoritybin * lowincomebin, binominal,
                         data = EJ2)
summary(regression.object)







maxminor <- max(EJ2$Linguistically.Isolated.Population, na.rm=TRUE)
maxminor

minminor <- min(EJ2$Linguistically.Isolated.Population, na.rm=TRUE)
minminor

averageminor <- mean(EJ2$Linguistically.Isolated.Population, na.rm=TRUE)
averageminor
