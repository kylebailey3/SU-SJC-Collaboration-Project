library(tidyverse)
ptnt <- readr::read_csv('patents_8.csv')
head(ptnt, 10)

top10 <- sort(table(ptnt$ee_city),decreasing=TRUE)[1:10]

top10