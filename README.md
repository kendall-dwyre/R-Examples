# R-Examples

Stroke Prediction Dataset Analysis
Overview
This repository contains an analysis of the Healthcare Stroke Prediction Dataset. The goal of this project was to explore the dataset, clean and preprocess the data, and perform basic statistical analysis and predictive modeling. This project is part of my data analysis portfolio, showcasing skills in data manipulation, exploratory data analysis (EDA), and regression modeling in R. The final code is well-documented to serve as a reference for future data analysis tasks.

Dataset
The dataset used in this analysis is the Stroke Prediction Dataset, which includes information on various health attributes such as age, gender, hypertension, heart disease, and average glucose levels, among others. The target variable is stroke, a binary indicator showing whether the individual has experienced a stroke.

Purpose
The primary purpose of choosing this dataset is to practice and refine my skills in data analysis, specifically:

Cleaning and preparing healthcare-related data.
Exploring data distributions to understand key health metrics.
Conducting logistic regression analysis to predict stroke occurrence based on patient characteristics.
Performing hypothesis testing to evaluate relationships between variables such as age and stroke.
This analysis serves as an opportunity to showcase my ability to derive meaningful insights from healthcare data and apply statistical techniques to support decision-making processes.

Process and Methodology
1. Data Loading and Cleaning
Data Import: The dataset was imported and converted into a DataFrame for manipulation in R.
Missing Values: The dataset was inspected for missing values. BMI values marked as 'N/A' were converted to NA and appropriately handled.
Categorical Data Handling: Non-numerical columns, such as gender, work type, and smoking status, were transformed into numeric values to allow for statistical modeling.
2. Exploratory Data Analysis (EDA)
Gender Distribution: A basic frequency table was generated to explore gender distribution in the dataset. The category "Other" was excluded due to the presence of only one observation.
BMI Analysis: The mean and standard deviation of BMI were calculated for both males and females. This step provided insights into the health conditions of the patients in the dataset.
Glucose Analysis: A summary of the median average glucose level was calculated for individuals aged over 50, which helped in understanding glucose trends in older populations.
3. Statistical Modeling
Logistic Regression: A logistic regression model was developed to predict the occurrence of a stroke based on age. This model helped quantify how age influences the likelihood of stroke.
Correlation Test: A correlation test was performed to determine the linear relationship between age and stroke. The test returned a slight positive correlation, with statistical significance.
4. Additional Insights
Categorical Variable Encoding: Categorical variables were converted into numerical values to enable further statistical analysis and modeling. This transformation was essential for preparing the data for future machine learning or advanced modeling techniques.
Outcome
The logistic regression model revealed a statistically significant relationship between age and the likelihood of experiencing a stroke.
The correlation analysis confirmed that while the relationship between age and stroke is positive, it is relatively weak (correlation coefficient = 0.2452).
Exploratory analysis highlighted key health trends, such as gender differences in BMI and glucose levels for older adults, contributing to a more holistic understanding of the dataset.
Conclusion
This project highlights the importance of thorough data preparation, exploratory analysis, and applying statistical techniques to understand and predict health outcomes. The code in this repository demonstrates my ability to work with healthcare data, perform predictive modeling, and provide valuable insights based on data-driven evidence.
