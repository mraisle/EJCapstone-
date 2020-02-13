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




HERT <- read.csv(here("geocoded_csv/HERT_rawarc.csv"))


cleaner <- subset(HERT, select = -c(Status,Score,Match_type,
                                      LongLabel,ShortLabel,Addr_type,Type,PlaceName,Place_addr,Phone,
                                      URL,Rank,AddBldg,AddNum,AddNumFrom,AddNumTo,AddRange,Side,StPreDir,StPreType,StName,StType,StDir,
                                      BldgName,LevelType,LevelName,UnitType,UnitName,SubAddr,StAddr,Block,Sector,Nbrhd,District,City,
                                      MetroArea,Territory,Zone,LangCode,Distance,ExInfo,ResultID))



cleaner <- subset(cleaner, select = -c(FID,Loc_name))

cleaner <- subset(cleaner, select = -c(BldgType,Xmin,Xmax,Ymin,Ymax))

cleaner <- subset(cleaner, select = -c(IN_Addre_1, IN_Addre_2, IN_Neighbo))

cleaner <- subset(cleaner, select = -c(IN_Subregi,IN_PostalE, IN_Country,USER_lon,USER_lat))

#cleaner$Subregion[16] = "Northampton County"


names(cleaner)[names(cleaner)=="Subregion"] <- "County"


write.csv(cleaner, here("geocoded_csv/HERT_cleaned.csv"))




