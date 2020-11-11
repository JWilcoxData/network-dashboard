# NetworkAnalyzer EDA Worksheet

# Libraries ------------
library(dplyr)


# Constants -------------



# Data Loading ----------
data <- read.csv(file = 'raw_data1.csv',
         header = TRUE,
         stringsAsFactors = FALSE
             )


# Data Transformation ------

# Column renaming
names(data) <- names(data) %>% gsub(pattern = "(\\.)+",
                                    replacement = "_") %>% tolower()

data %>%
    group_by(source) %>%
    summarise(total = n())
