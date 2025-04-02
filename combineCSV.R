library(stringr)
library(dplyr)

data <- read.csv("data/NE_LINCOLN_2008.csv")
for (x in 2009:2024) {
    csv <- paste(paste("data/NE_LINCOLN_", x), ".csv")
    csv <- str_replace_all(csv, " ", "")
    data <- bind_rows(data, read.csv(csv))
}

write.csv(data, "data/CombinedData.csv")