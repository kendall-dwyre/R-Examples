# Kendall Dwyre
# Purpose: Practice Data Analysis for GitHub Profile
# Started: 5/17/2024
# ---------------------------------------------------- # 

# Required Packages
library(tidyverse)

# Objective:
# Perform data analysis on 'healthcare-dataset-stroke-data.csv'
# Conduct general data cleaning, exploration, and statistical modeling to draw insights.

# 1.) Load the data

health_data <- read_csv("healthcare-dataset-stroke-data.csv")
class(health_data)  # Check the dataframe type
head(health_data, 10)  # Preview the first 10 rows

# The data is loaded into 'health_data'
# Let's proceed by checking for any missing or erroneous data.

# 2.) Data cleaning / preparation

missing_values_present <- any(is.na(health_data))  
print(missing_values_present)  # Check if there are any NA values

# Although there are no NA values, we’ll count them across columns for validation.
na_count_per_column <- colSums(is.na(health_data))
print(na_count_per_column)  # Ensure zeroes across all columns

# The data is clean; we can move forward confidently.

# 3.) Perform exploratory analysis
# Before diving into more complex analysis, it's important to understand basic patterns in the data.

# Gender distribution:
gender_distribution <- table(health_data$gender)
print(gender_distribution)
# Output:
# Female: 2994
# Male: 2115
# Other: 1
# We will exclude "Other" since it has only one observation.

# BMI analysis by gender (excluding "Other")
bmi_analysis <- health_data %>%
  mutate(bmi = as.numeric(ifelse(bmi == 'N/A', NA, bmi))) %>%  # Convert 'N/A' in BMI to NA and convert to numeric
  filter(!is.na(bmi) & bmi > 0) %>%  # Filter out invalid BMI values
  filter(gender %in% c("Female", "Male")) %>%  # Filter out the "Other" gender
  group_by(gender) %>%
  summarize(
    mean_bmi = round(mean(bmi), 2),
    sd_bmi = round(sd(bmi), 2)
  ) %>% 
  as.data.frame()

# Display BMI summary by gender
print(bmi_analysis)

# 4.) Median glucose level analysis based on age filter
# Filtering by age > 50 and calculating median glucose level.

glucose_median_by_age <- health_data %>%
  filter(!is.na(age) & age > 50) %>%  # Filter out missing ages and restrict to age > 50
  summarize(
    median_avg_glucose_level = median(avg_glucose_level, na.rm = TRUE)
  ) %>%
  as.data.frame()

# Display the result
print(glucose_median_by_age)

# 5.) Logistic Regression Analysis
# We will predict the probability of stroke based on age using logistic regression.

log_reg_model <- glm(stroke ~ age, data = health_data, family = binomial)
summary(log_reg_model)

# This model attempts to predict stroke likelihood based on the age of the patient.

# 6.) Correlation Test (cor.test)
# Correlation test to assess linear relationship between age and stroke outcome.

correlation_age_stroke <- cor.test(health_data$age, health_data$stroke)
print(correlation_age_stroke)  # cor = 0.2452

# Interpretation: A slight positive correlation between age and the occurrence of a stroke.
# The p-value confirms statistical significance.

# 7.) More regression (handling categorical variables)
# Converting categorical variables into numerical format to facilitate regression analysis.

health_data <- health_data %>%
  mutate(
    gender_numeric = as.numeric(factor(gender, levels = c('Male', 'Female'))),
    ever_married_numeric = as.numeric(factor(ever_married, levels = c('Yes', 'No'))),
    work_type_numeric = as.numeric(factor(work_type, levels = c('Private', 'Self-employed', 'Govt_job'))),
    residence_type_numeric = as.numeric(factor(Residence_type, levels = c('Urban', 'Rural'))),
    smoking_status_numeric = as.numeric(factor(smoking_status, levels = c('formerly smoked', 'never smoked', 'Unknown', 'smokes')))
  )

# Preview the transformed data
head(health_data, 10)

# Additional insights:
# At this stage, we have transformed our dataset, performed basic exploratory analysis, 
# and run some logistic regression and correlation tests. You can further enhance this analysis
# by incorporating advanced modeling techniques, feature selection, and visualization for more in-depth conclusions.

