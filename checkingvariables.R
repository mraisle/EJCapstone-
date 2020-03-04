install.packages("tmaptools")
install.packageS("ggplot2")
install.packages("here")
install.packages("dplyr")

install.packages("tidyr")



library(tidyr)
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

#select 2 dataframes, first lod 

lod <- all %>%
  select(c(1,seq(43,97,2)))

lod_long <- lod %>%
  gather(chemical,lod,-X.1)


#now with the data itself 

data <- all %>%
  select(c(1,seq(42,96,2)))

data_long <- data %>%
  gather(chemical, data, -X.1)

#combine data 

together <- cbind(data_long,lod_long)


togethersub <- together[,c(1,2,3,6)]


random <- togethersub %>%
  mutate("estimate"= ifelse(lod== 1, runif(nrow(togethersub), min=0, max=togethersub$data),togethersub$data))

#trying to plot to make sure it looks ok 

plot <- plot(random)+
  + geom_bar(aes(x=data,y=estimate))
plot


#need to put the data back in a regular format 
#try making a new column with x.1 and chemical and combine them back this way 
  