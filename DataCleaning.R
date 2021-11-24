# initial setup
library(tidyverse)
setwd("C:\\Users\\pollackm\\Documents\\BayesianHierarchicalModel")

### BERLIN
Berlinlistings <- read.csv("Data/Berlin Data/listings.csv")
Berlincalendar <- read.csv("Data/Berlin Data/calendar.csv")

Berlincalendar <- filter(Berlincalendar, date == "2021-11-12")

Berlinlistings <- select(Berlinlistings, -price)

Berlinfull <- inner_join(Berlincalendar, Berlinlistings, by = c("listing_id" = "id"))

#convert price to US dollars
Berlinfull$price <- 1.1447*parse_number(Berlinfull$price)


### SINGAPORE
Singaporelistings <- read.csv("Data/Singapore Data/listings.csv")
Singaporecalendar <- read.csv("Data/Singapore Data/calendar.csv")

Singaporecalendar <- filter(Singaporecalendar, date == "2021-11-12")
#3 missing data points
Singaporelistings <- select(Singaporelistings, -price)

Singaporefull <- inner_join(Singaporecalendar, Singaporelistings, by = c("listing_id" = "id"))

# convert to US dollars
Singaporefull$price <- 0.7414*parse_number(Singaporefull$price)

### NEW YORK
New_Yorklistings <- read.csv("Data/New York Data/listings.csv")
New_Yorkcalendar <- read.csv("Data/New York Data/calendar.csv")

New_Yorkcalendar <- filter(New_Yorkcalendar, date == "2021-11-12")
#19 missing data points
New_Yorklistings <- select(New_Yorklistings, -price)

New_Yorkfull <- inner_join(New_Yorkcalendar, New_Yorklistings, by = c("listing_id" = "id"))

New_Yorkfull$price <- parse_number(New_Yorkfull$price)


### MERGE INTO ONE DATASET
Berlinfull$city <- "Berlin"
New_Yorkfull$city <- "New York"
Singaporefull$city <- "Singapore"

merged <- rbind(Berlinfull, New_Yorkfull, Singaporefull)

# fill in bathrooms column from bathrooms_text
merged$bathrooms_text <- str_replace_all(merged$bathrooms_text, "[Hh]alf-bath", "0.5")
merged$bathrooms <- parse_number(merged$bathrooms_text)

### correct prices manually
# NY
merged[merged$listing_id==52940401, "price"] <- 104
merged[merged$listing_id==50444487, "price"] <- 400
merged[merged$listing_id==35281795, "price"] <- 42
merged[merged$listing_id==27967621, "price"] <- 90
merged[merged$listing_id==12733430, "price"] <- 117
merged[merged$listing_id==423015, "price"] <- 35
merged[merged$listing_id==45494997, "price"] <- 314
merged[merged$listing_id==43247631, "price"] <- 334
merged[merged$listing_id==43247472, "price"] <- 269
merged[merged$listing_id==43035720, "price"] <- 609
merged[merged$listing_id==43078550, "price"] <- 143
merged[merged$listing_id==42830099, "price"] <- 314
merged[merged$listing_id==42384530, "price"] <- 100
merged[merged$listing_id==42065564, "price"] <- 284
merged[merged$listing_id==42065563, "price"] <- 239
merged[merged$listing_id==42065562, "price"] <- 369
merged[merged$listing_id==42065555, "price"] <- 258
merged[merged$listing_id==42065547, "price"] <- 249
merged[merged$listing_id==42065545, "price"] <- 369
merged[merged$listing_id==42065543, "price"] <- 409
merged[merged$listing_id==42279171, "price"] <- 378
merged <- merged[!(merged$listing_id %in% c(42279170, 42228997)), ]
merged[merged$listing_id==41792753, "price"] <- 219
merged[merged$listing_id==41740615, "price"] <- 509
merged[merged$listing_id==40560656, "price"] <- 509
merged[merged$listing_id==21238053, "price"] <- 6143
merged[merged$listing_id==33622378, "price"] <- 143
merged <- merged[!(merged$listing_id %in% c(33621795, 33622308, 43310215)), ]
merged[merged$listing_id==20654227, "price"] <- 6429
merged[merged$listing_id==49838495, "price"] <- 55

# Singapore
merged[merged$listing_id==14289091, "price"] <- 5334

# Berlin
merged <- merged[!(merged$listing_id %in% c(52161838)), ]
merged[merged$listing_id==47112187, "price"] <- 274
merged[merged$listing_id==45841246, "price"] <- 159
merged[merged$listing_id==45693213, "price"] <- 162
merged[merged$listing_id==43247575, "price"] <- 128
merged[merged$listing_id==42583346, "price"] <- 7874
merged[merged$listing_id==42687506, "price"] <- 110
merged[merged$listing_id==42279207, "price"] <- 630

write.csv(merged, "~/Downloads/merged.csv")
