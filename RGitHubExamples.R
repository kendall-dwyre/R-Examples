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
  ) %>% 
  as.data.frame() 

# View the result
print(Q3_data_prep)
# This shows us the mean and standard deviation (created)
# For male and female of 

# 4.) Median of avg_glucose, based on age filtered 

Q4_data_prep <- df %>%
  filter(!is.na(age) & age > 50) %>%
  summarize(
    median_avg_glucose_level = median(avg_glucose_level, na.rm = TRUE)
  ) %>% 
  as.data.frame() 

# Print the value
print(Q4_data_prep)

# ---------------------------------------
# 5.) Linear Regression 

# Performing some linear regression 
# Predicting avg_glucose_level off age and bmi

Q5_model <- glm(stroke ~ age, data = df, family = binomial)
summary(Q5_model) 

# 6.) Performing a cor.test() 

# Cor.test() can be used to perform a hypothesis test of 
# the correlation coefficient between two numeric variables.
# It's goal is determining whether there is a significant
# linear relationship between the variables.

# A cor value close to 1 indicates a strong positive linear relationship.
# -1 indicates a strong negative relationship.
# 0 indicates no linear relationship.

cor_t <- cor.test(df$age, df$stroke) 
print(cor_t)  # cor = .2452

# This indicates that there is a slight positive relationship
# The p-value helps us see that the value is significant

# Cor test helps us see how changes in one variable 
# could affect another variable. 

# 7.) More regression

# Many of our variables are categorical, not as numbers.
# If we want to use them we would need to convert them.

df$gender <- as.numeric(factor(df$gender, levels = c('Male', 'Female')))
df$ever_married <- as.numeric(factor(df$ever_married, levels = c('Yes', 'No')))
df$work_type <- as.numeric(factor(df$work_type, levels = c('Private', 'Self-employed', 'Govt_job')))
df$Residence_type <- as.numeric(factor(df$Residence_type, levels = c('Urban', 'Rural')))
df$smoking_status <- as.numeric(factor(df$smoking_status, levels = c('formerly smoked', 'never smoked', 'Unknown', 'smokes')))

head(df, 10)  
