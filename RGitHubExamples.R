# Kendall Dwyre
# Purpose: Practice Data Analysis for GitHub Profile
# Started 5/17/2024
# ---------------------------------------------------- # 

# Packages 
library(tidyverse) 

# Objective 
# Look at the healthcare-dataset-stroke-data.csv
# Do general data analysis to draw conclusions 

# 1.) Load the data 

df <- read_csv("healthcare-dataset-stroke-data.csv")
class(df) # Dataframe type
head(df, 10) 

# The data is now loaded and turned into a dataframe (df)
# But I'm curious if our data has any errors before continuing?

# 2.) Data cleaning / prep 

any(is.na(df)) # Returned: False (No NA's) 
# Returns TRUE if there are any NA
# Returns FALSE if there are no NA

# Not needed, but we can also count the NA's (which are none)
colSums(is.na(df)) # 0's across the board 

# This is good for us.  We can move forward with confidence
# That our data is clean and ready for analysis.

# 3.) Perform some exploration 
# It can be useful to do some exploratory analysis to better 
# Understand your data before making big inferences

# Assuming df is your data frame
table(df$gender) 
# Female 2994
# Male 2115
# Other 1 
# Other will be removed since it's only 1 

Q3_data_prep <- df %>% 
  mutate(bmi = as.numeric(ifelse(bmi == 'N/A', NA, bmi))) %>% 
  filter(!is.na(bmi) & bmi > 0) %>% 
  filter(gender %in% c("Female", "Male")) %>% # No other
  group_by(gender) %>% 
  summarize(
    mean_bmi = round(mean(bmi), 2),
    sd_bmi = round(sd(bmi), 2)
  )

# View the result
print(Q3_data_prep)
# This shows us the mean and standard deviation (created)
# For male and female of 

