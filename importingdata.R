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

northhampton <- read.csv(here("beginning/Northampton_data.csv"))


try <- read_shape(here("beginning/addresses_NH.shp"))

