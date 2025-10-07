Project 2 – Exploratory Data Analysis (EDA) of Two Data Sets

Course: ALY 6000 – Introduction to Analytics
Tools Used: R, Tidyverse, Janitor, Testthat, Pacman

Overview

This project is divided into two major parts, each focused on hands-on data wrangling, analysis, and visualization using R.
You will explore, clean, and summarize two datasets — 2015.csv (World Happiness data) and baseball.csv (Major League Baseball batting stats from 1986).
The goal is to demonstrate proficiency with Tidyverse functions such as select(), filter(), mutate(), summarize(), and grouping operations using group_by().

Setup

Before starting:

Create an R Project named Lastname_Project2.

Create a script Lastname_Project2.R inside the R folder.

Add both datasets (2015.csv and baseball.csv) to the project directory.

Load all necessary packages using the Pacman loader:

library(pacman)
p_load(tidyverse, janitor, testthat)


Include boilerplate code to clear the environment, console, and plots before each run.

Part 1 – World Happiness Data (2015.csv)
Objective:

Perform EDA on the 2015 World Happiness Report to explore relationships among happiness, freedom, economy, and other quality-of-life metrics.

Key Steps:

Load and inspect data using read_csv(), head(), names(), and glimpse().

Clean column names with janitor::clean_names().

Subset and manipulate data:

Create happy_df with selected columns (country, region, happiness_score, freedom).

Slice the first 10 rows into top_ten_df.

Filter countries with freedom < 0.20 into no_freedom_df.

Arrange by descending freedom to create best_freedom_df.

Feature Engineering:
Add a new column gff_stat = family + freedom + generosity using mutate().

Summary Statistics:

Compute overall averages and maxima (happy_summary).

Group by region to calculate mean happiness, mean freedom, and number of countries (regional_stats_df).

Challenge Tasks:

Compare GDP per capita between the least happy Western European and happiest Sub-Saharan African countries (gdp_df).

Create a scatterplot of mean_happiness vs. mean_freedom by region.

Part 2 – MLB Batting Statistics (baseball.csv)
Objective:

Explore batting data from the 1986 MLB season to calculate player-level performance metrics and age-based summaries.

Key Steps:

Load and inspect the baseball dataset using glimpse() and class().

Summarize by age:

Count players, and compute average Home Runs (HR), Hits (H), and Runs (R) for each age (age_stats_df).

Clean and filter:

Remove players with 0 at-bats (AB).

Create performance metrics:

Compute Batting Average (BA) = H / AB, rounded to 3 decimals.

Compute On-Base Percentage (OBP) = (H + BB) / (AB + BB), also rounded to 3 decimals.

Deliverable: A clean, well-labeled dataset with computed stats ready for analysis or visualization.

Deliverables

Lastname_Project2.R — your complete R script with code for both parts.

Clean, reproducible code that passes all tests in project2_tests.R.

Optional: visualizations for Part 1 challenge problems.

Skills Demonstrated

Data cleaning and transformation with Tidyverse

Data summarization with summarize() and group_by()

Data filtering, slicing, and ordering

Feature engineering using mutate()

Data validation and reproducibility testing

Visualization and comparative analysis
