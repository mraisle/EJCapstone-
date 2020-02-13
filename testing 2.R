library(here)
library(dplyr)
install.packages("googlesheets")
library(googlesheets)
gs_auth(new_user = TRUE)
northhampton <- read.csv(here("beginning/Northampton_data.csv"))

summary(northhampton$Lead)

filt <- northhampton%>%
  filter(Lead < .01)


est <- data.frame()

for (i in 1:1000 in) {
  for(n in 1:now(filt)){
  row <- filt[n,]
  row$est <- 
  }
}