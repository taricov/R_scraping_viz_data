#Importing libraries: I used the 'datapasta' package in scraping.

library(datapasta)
library(timetk)
library(tidyverse)
library(lubridate)

#Scraping data using datapasta time-saver addins:

highest.rev <- data.table::data.table(
                         V1 = c(1L,2L,3L,
                                4L,5L,6L,7L,8L,9L,10L,11L,12L,13L,14L,
                                15L,16L,17L,18L,19L,20L),
                         V2 = c("Walmart",
                                "State Grid","Amazon","China National Petroleum",
                                "Sinopec Group","Apple","CVS Health",
                                "UnitedHealth","Toyota","Volkswagen",
                                "Berkshire Hathaway","McKesson","China State Construction",
                                "Saudi Aramco","Samsung Electronics",
                                "Ping An Insurance","AmerisourceBergen","BP",
                                "Royal Dutch Shell","ICBC"),
                         V3 = c("Retail",
                                "Electricity","Retail, Information Technology",
                                "Oil and gas","Oil and gas","Electronics",
                                "Healthcare","Healthcare","Automotive",
                                "Automotive","Financials","Healthcare","Construction",
                                "Oil and gas","Electronics","Financials",
                                "Healthcare","Oil and gas","Oil and gas",
                                "Financials"),
                         V4 = c("Increase $559,151","Increase $386,618","Increase $386,064",
                                "Decrease $283,958","Decrease $283,728",
                                "Increase $274,515","Increase $268,706",
                                "Increase $257,141","Decrease $256,722",
                                "Decrease $253,965","Increase $254,510","Increase $238,228",
                                "Increase $234,425","Decrease $229,766",
                                "Increase $200,734","Increase $191,509",
                                "Increase $189,894","Decrease $183,500","Decrease $183,195",
                                "Increase $182,794"),
                         V5 = c("$13,600",
                                "$5,580","$21,331","$4,575","$6,205","$57,411",
                                "$7,179","$15,403","$21,180","$10,104",
                                "$42,521","-$4,539","$3,578","$49,287",
                                "$22,116","$20,739","-$3,409","-$20,305","-$21,680",
                                "$45,783"),
                         V6 = c(2300000,
                                896360,1335000,1242245,553833,147000,256500,
                                330000,366283,662575,360000,67500,356864,
                                79800,267937,362035,21500,68100,87000,439787),
                         V7 = c("United States United States","China China",
                                "United States United States","China China","China China",
                                "United States United States",
                                "United States United States","United States United States",
                                "Japan Japan","Germany Germany",
                                "United States United States","United States United States",
                                "China China","Saudi Arabia Saudi Arabia",
                                "South Korea South Korea","China China",
                                "United States United States","United Kingdom United Kingdom",
                                "Netherlands Netherlands","China China"),
                         V8 = c("[4]","[5]",
                                "[6]","[7]","[8]","[9]","[10]","[11]",
                                "[12]","[13]","[14]","[15]","[16]","[17]",
                                "[18]","[19]","[20]","[21]","[22]","[23]")
               )

#Wrangling the data, reforming it then visualize it:

highest.rev %>% 
  mutate(
    V4 = parse_number(V4),
    V2 = as_factor(V2) %>% fct_rev()
  ) %>%
  ggplot(aes(V4,V2))+
  geom_col(aes(fill = V4)) +
  geom_label(aes(label = scales::dollar_format()(V4)), hjust=1) +
  theme_minimal() +
  scale_x_continuous(labels = scales::dollar_format()) +
  labs(y='Company Name', x='Revenue', title = "Revenue (Millions) for Largest Companies") +
  theme(legend.position = 'none')

  
