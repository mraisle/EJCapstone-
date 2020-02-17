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




NH <- read.csv(here("geocoded_csv/NH_cleaned.csv"))
cleaner <- NH


cleaner <- subset(HERT, select = -c(Status,Score,Match_type,
                                      LongLabel,ShortLabel,Addr_type,Type,PlaceName,Place_addr,Phone,
                                      URL,Rank,AddBldg,AddNum,AddNumFrom,AddNumTo,AddRange,Side,StPreDir,StPreType,StName,StType,StDir,
                                      BldgName,LevelType,LevelName,UnitType,UnitName,SubAddr,StAddr,Block,Sector,Nbrhd,District,City,
                                      MetroArea,Territory,Zone,LangCode,Distance,ExInfo,ResultID))



cleaner <- subset(cleaner, select = -c(FID,Loc_name))

cleaner <- subset(cleaner, select = -c(BldgType,Xmin,Xmax,Ymin,Ymax))

cleaner <- subset(cleaner, select = -c(IN_Addre_1, IN_Addre_2, IN_Neighbo))

cleaner <- subset(cleaner, select = -c(IN_Subregi,IN_PostalE, IN_Country,USER_lon,USER_lat))

cleaner <- subset(cleaner, select = -c(IN_Address,IN_City, IN_Region,IN_Postal))




cleaner$RegionAbbr[65] = "NC"
cleaner$Region[65] = "North Carolina"
cleaner$Subregion[65] = "Halifax County"


names(cleaner)[names(cleaner)=="Subregion"] <- "County"
names(cleaner)= sub("USER_","",names(cleaner))
Hertclean <- subset(Hertclean, select = -c(latlo))



write.csv(cleaner, here("geocoded_csv/NH_cleaned.csv"))

NHclean <- cleaner

Hertclean <- subset(Hertclean, select = -c(per_1,per_2))


all <- rbind(twotogether,Hertclean)
      

colnames(twotogether)
colnames(Hertclean)

write.csv(all, here("geocoded_csv/allcounties_geocoded.csv"))

