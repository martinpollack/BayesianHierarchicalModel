library(ggplot2)
library(stringr)
setwd("C:\\Users\\pollackm\\Documents\\BayesianHierarchicalModel")


d <- read.csv("Data/merged.csv")

sum(is.na(d$price))
hist(d$price[d$price < 1000], freq = F, ylim = c(0, 0.007))

sum(is.na(d$neighbourhood_group_cleansed))

sum(is.na(d$neighbourhood_cleansed))

sum(is.na(d$bedrooms))

sum(is.na(d$beds))
hist(d$price[is.na(d$beds) & d$price < 1000])

sum(is.na(d$bathrooms))
hist(d$price[is.na(d$bathrooms) & d$price < 1000])

sum(is.na(d$reviews_per_month))
hist(d$price[is.na(d$reviews_per_month) & d$price < 1000], freq = F, ylim = c(0, 0.007))

sum(is.na(d$host_is_superhost))
