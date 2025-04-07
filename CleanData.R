library(tidyverse)

data <- read.csv("data/CombinedData.csv")

# renaming data columns into shorter names
data <- data %>%
  rename(
    id = X,
    location = LOCATION_NAME,
    time = SAMPLE.COLLECTION.TIME,
    doseEquivalent = DOSE.EQUIVALENT.RATE..nSv.h.,
    gamma2 = GAMMA.COUNT.RATE.R02..CPM.,
    gamma3 = GAMMA.COUNT.RATE.R03..CPM.,
    gamma4 = GAMMA.COUNT.RATE.R04..CPM.,
    gamma5 = GAMMA.COUNT.RATE.R05..CPM.,
    gamma6 = GAMMA.COUNT.RATE.R06..CPM.,
    gamma7 = GAMMA.COUNT.RATE.R07..CPM.,
    gamma8 = GAMMA.COUNT.RATE.R08..CPM., 
    gamma9 = GAMMA.COUNT.RATE.R09..CPM.,
    status = STATUS
  )

data['gammaSum'] <- data['gamma2'] + data['gamma3'] + data['gamma4'] + data['gamma5'] + data['gamma6'] + data['gamma7'] + data['gamma8'] + data['gamma9']

data <- data %>% relocate(gammaSum, .before = status)

# exporting all raw data with renamed columns
write.csv(data, "data/NE_LINCOLN_2008_2024.csv")

# removing data that does not have dose equivalent rate
data <- drop_na(data)

write.csv(data, "data/NE_LINCOLN_NO_NA.csv")
