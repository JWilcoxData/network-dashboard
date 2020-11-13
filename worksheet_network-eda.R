# NetworkAnalyzer EDA Worksheet

# Libraries ------------
library(dplyr)


# Constants -------------



# Data Loading ----------
data <- read.csv(
  file = "raw_data1.csv",
  header = TRUE,
  stringsAsFactors = FALSE
)

ip_addresses <- read.csv(
  file = "data/GeoLite2-Country-Blocks-IPv4.csv",
  header = TRUE,
  stringsAsFactors = FALSE
)

locations <- read.csv(
  file = "data/GeoLite2-Country-Locations-en.csv",
  header = TRUE,
  stringsAsFactors = FALSE
)

# Data Transformation ------

# Column renaming
names(data) <- names(data) %>%
  gsub(
    pattern = "(\\.)+",
    replacement = "_"
  ) %>%
  tolower()

ip_addresses <- ip_addresses %>%
  mutate(
    address = gsub(
      pattern = "(\\/[0-9][0-9])",
      replacement = "",
      network
    )
  )

ip_locale <- merge(ip_addresses, locations, by.x = "geoname_id", by.y = "geoname_id", all = TRUE) %>%
  select(
    address, geoname_id, continent_code, continent_name, country_iso_code, country_name
  )

temp <- merge(data, ip_addresses, by.x = c("destination"), by.y = c("address"), all.x = TRUE)

data %>%
  group_by(source) %>%
  summarise(total = n())




