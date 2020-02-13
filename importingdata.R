#We're just going to see if we can pull data into r and how it goes 

install.packages("tmaptools")
install.packages("ggplot2")
install.packages("here")
install.packages("dplyr")
install.packages("plotly")
install.packages("wesanderson")



library(tmaptools)
library(ggplot2)
library(here)
library(dplyr)
library(plotly)
library(wesanderson)
install.packages("googlesheets")
library(googlesheets)




northhampton <- read.csv(here("geocoded_csv/NH_rawarc.csv"))


cleaner <- subset(northhampton, select = -c(Status,Score,Match_type,
                                      LongLabel,ShortLabel,Addr_type,Type,PlaceName,Place_addr,Phone,
                                      URL,Rank,AddBldg,AddNum,AddNumFrom,AddNumTo,AddRange,Side,StPreDir,StPreType,StName,StType,StDir,
                                      BldgName,LevelType,LevelName,UnitType,UnitName,SubAddr,StAddr,Block,Sector,Nbrhd,District,City,
                                      MetroArea,Territory,Zone,LangCode,Distance,ExInfo,ResultID))

write.csv(cleaner, here("geocoded_csv/NH_cleaner.csv"))

