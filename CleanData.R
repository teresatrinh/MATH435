library(tidyverse)

data <- read.csv("data/CombinedData.csv")

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
