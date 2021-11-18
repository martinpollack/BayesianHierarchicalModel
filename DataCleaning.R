# initial setup
library(tidyverse)
setwd("C:\\Users\\pollackm\\Documents\\BayesianHierarchicalModel")

### BERLIN
Berlinlistings <- read.csv("Data/Berlin Data/listings.csv")
Berlincalendar <- read.csv("Data/Berlin Data/calendar.csv")

Berlincalendar <- filter(Berlincalendar, date == "2021-11-12")

Berlinlistings <- select(Berlinlistings, -price)

Berlinfull <- inner_join(Berlincalendar, Berlinlistings, by = c("listing_id" = "id"))

Berlinfull$price <- parse_number(Berlinfull$price)

### MADRID
Madridlistings <- read.csv("Data/Madrid Data/listings.csv")
Madridcalendar <- read.csv("Data/Madrid Data/calendar.csv")
Madridcalendar <- filter(Madridcalendar, date == "2021-11-12")
#1 missing data point
Madridlistings <- select(Madridlistings, -price)

Madridfull <- inner_join(Madridcalendar, Madridlistings, by = c("listing_id" = "id"))

Madridfull$price <- parse_number(Madridfull$price)

### SINGAPORE
Singaporelistings <- read.csv("Data/Singapore Data/listings.csv")
Singaporecalendar <- read.csv("Data/Singapore Data/calendar.csv")

Singaporecalendar <- filter(Singaporecalendar, date == "2021-11-12")
#3 missing data points
Singaporelistings <- select(Singaporelistings, -price)

Singaporefull <- inner_join(Singaporecalendar, Singaporelistings, by = c("listing_id" = "id"))

Singaporefull$price <- parse_number(Singaporefull$price)

### NEW YORK
New_Yorklistings <- read.csv("Data/New York Data/listings.csv")
New_Yorkcalendar <- read.csv("Data/New York Data/calendar.csv")


New_Yorkcalendar <- filter(New_Yorkcalendar, date == "2021-11-12")
#19 missing data points
New_Yorklistings <- select(New_Yorklistings, -price)

New_Yorkfull <- inner_join(New_Yorkcalendar, New_Yorklistings, by = c("listing_id" = "id"))

New_Yorkfull$price <- parse_number(New_Yorkfull$price)


### LOS ANGELES
Los_Angeleslistings <- read.csv("Data/Los Angeles Data/listings.csv")
Los_Angelescalendar <- read.csv("Data/Los Angeles Data/calendar.csv")


Los_Angelescalendar <- filter(Los_Angelescalendar, date == "2021-11-12")
#5 missing datapoints
Los_Angeleslistings <- select(Los_Angeleslistings, -price)

Los_Angelesfull <- inner_join(Los_Angelescalendar, Los_Angeleslistings, by = c("listing_id" = "id"))

Los_Angelesfull$price <- parse_number(Los_Angelesfull$price)


### MERGE INTO ONE DATASET
Berlinfull$city <- "Berlin"
Los_Angelesfull$city <- "Los Angeles"
Madridfull$city <- "Madrid"
New_Yorkfull$city <- "New York"
Singaporefull$city <- "Singapore"

merged <- rbind(Berlinfull, Los_Angelesfull, Madridfull, New_Yorkfull, Singaporefull)

# fill in bathrooms column from bathrooms_text
merged$bathrooms_text <- str_replace_all(merged$bathrooms_text, "[Hh]alf-bath", "0.5")
merged$bathrooms <- parse_number(merged$bathrooms_text)

write.csv(merged, "Data/merged.csv")
