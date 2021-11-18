# Data cleaning
library(tidyverse)
Berlinlistings <- read.csv("C:/Users/mincebow/Desktop/All Data for Bayesian Project/Berlin Data/listings.csv")
Berlincalendar <- read.csv("C:/Users/mincebow/Desktop/All Data for Bayesian Project/Berlin Data/calendar.csv")

Berlincalendar <- filter(Berlincalendar, date == "2021-11-05")

Berlinlistings <- select(Berlinlistings, -price)

Berlinfull <- inner_join(Berlincalendar, Berlinlistings, by = c("listing_id" = "id"))

Berlinfull$price <- parse_number(Berlinfull$price)


Madridlistings <- read.csv("C:/Users/mincebow/Desktop/All Data for Bayesian Project/Madrid Data/listings.csv")
Madridcalendar <- read.csv("C:/Users/mincebow/Desktop/All Data for Bayesian Project/Madrid Data/calendar.csv")


Madridcalendar <- filter(Madridcalendar, date == "2021-11-12")
#1 missing data point
Madridlistings <- select(Madridlistings, -price)

Madridfull <- inner_join(Madridcalendar, Madridlistings, by = c("listing_id" = "id"))

Madridfull$price <- parse_number(Madridfull$price)


Singaporelistings <- read.csv("C:/Users/mincebow/Desktop/All Data for Bayesian Project/Singapore Data/listings.csv")
Singaporecalendar <- read.csv("C:/Users/mincebow/Desktop/All Data for Bayesian Project/Singapore Data/calendar.csv")


Singaporecalendar <- filter(Singaporecalendar, date == "2021-11-05")
#3 missing data points
Singaporelistings <- select(Singaporelistings, -price)

Singaporefull <- inner_join(Singaporecalendar, Singaporelistings, by = c("listing_id" = "id"))

Singaporefull$price <- parse_number(Singaporefull$price)




New_Yorklistings <- read.csv("C:/Users/mincebow/Desktop/All Data for Bayesian Project/New York Data/listings.csv")
New_Yorkcalendar <- read.csv("C:/Users/mincebow/Desktop/All Data for Bayesian Project/New York Data/calendar.csv")


New_Yorkcalendar <- filter(New_Yorkcalendar, date == "2021-11-05")
#19 missing data points
New_Yorklistings <- select(New_Yorklistings, -price)

New_Yorkfull <- inner_join(New_Yorkcalendar, New_Yorklistings, by = c("listing_id" = "id"))

New_Yorkfull$price <- parse_number(New_Yorkfull$price)



Los_Angeleslistings <- read.csv("C:/Users/mincebow/Desktop/All Data for Bayesian Project/Los Angeles Data/listings.csv")
Los_Angelescalendar <- read.csv("C:/Users/mincebow/Desktop/All Data for Bayesian Project/Los Angeles Data/calendar.csv")


Los_Angelescalendar <- filter(Los_Angelescalendar, date == "2021-11-05")
#5 missing datapoints
Los_Angeleslistings <- select(Los_Angeleslistings, -price)

Los_Angelesfull <- inner_join(Los_Angelescalendar, Los_Angeleslistings, by = c("listing_id" = "id"))

Los_Angelesfull$price <- parse_number(Los_Angelesfull$price)
