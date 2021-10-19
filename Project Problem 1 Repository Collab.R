##load libraries
library(dplyr)
library(tidyr)
library(tidyverse)

##read in data
patents <- read.csv("patents_8.csv", header = TRUE)

##Clean the data of rows with NA for patnum
cleandata <- patents %>% drop_na(patnum)

##how many years it takes for a patents to pass by country
timetogrant <- cleandata %>%
  mutate(GrantTime = (grantyear - applyear))%>%
  group_by(ee_country)%>%
  summarise(a = mean(GrantTime),
            m = median(GrantTime),
            n = n()) %>%
  ungroup()
 

##number of patents by state in the US
patentsbystate <- cleandata[cleandata$ee_country == 'US',] %>%
  drop_na(ee_state)%>%
  group_by(ee_state)%>%
  summarise(count = n())

# Find the top ten cities who filed for the most patents 
head(patents, 10)

top10 <- sort(table(patents$ee_city),decreasing=TRUE)[1:10]

top10

types <- unique(patents$ptype)
types
ptnt2 <-patents %>% count(ee_country, ptype)


top10<-ptnt2[order(-ptnt2$n),][1:10,]
