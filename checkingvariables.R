install.packages("tmaptools")
install.packageS("ggplot2")
install.packages("here")
install.packages("dplyr")






library(tmaptools)
library(ggplot2)
library(here)
library(dplyr)
library(plotly)
library(wesanderson)



#first let's read in the data 

all <- read.csv(here("geocoded_csv/justvariables_lesslocations.csv"))


#ok so we know that 0 is above detect and 1 is below detect 

all$Arsenic_Iod == 1

sum(all$Arsenic_Iod == 1, na.rm=TRUE)


#we want NA to be excluded from the count 

A0 <- all%>%
  filter(Arsenic_Iod == 0)

A1 <- all%>%
  filter(Arsenic_Iod == 1)

nrow(A1)/(nrow(A1)+nrow(A0))*100

#try to do random # 

runif(1)
runif(10, min=0, max=.005)
