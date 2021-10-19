library(tidyverse)
ptnt <- readr::read_csv('patents_8.csv')

types <- unique(ptnt$ptype)
types
ptnt2 <-ptnt %>% count(ee_country, ptype)


top10<-ptnt2[order(-ptnt2$n),][1:10,]
