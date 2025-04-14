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
noNa <- drop_na(data)

write.csv(noNa, "data/NE_LINCOLN_NO_NA.csv")

# remove dose equivalent column and remove any rows with NA in any of the gamma channels
noDose <- data %>%
  select(id, location, time, gamma2, gamma3, gamma4, gamma5, gamma6, gamma7, gamma8, gamma9, gammaSum, status) %>%
  drop_na()

write.csv(noDose, "data/NE_LINCOLN_NO_DOSE.csv")

# normalize gamma channels
normalize <- noDose %>%
  mutate(
    log_gamma2 = log(gamma2),
    log_gamma3 = log(gamma3),
    log_gamma4 = log(gamma4),
    log_gamma5 = log(gamma5),
    log_gamma6 = log(gamma6),
    log_gamma7 = log(gamma7),
    log_gamma8 = log(gamma8),
    log_gamma9 = log(gamma9)
  )

write.csv(normalize, "data/NE_LINCOLN_NORMALIZED.csv")
