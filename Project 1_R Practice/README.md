ALY 6000 – Project 1: R Practice

Author: Sean McLean
Course: ALY 6000 – Introduction to Analytics
Date: September 23, 2023

📘 Overview

This project demonstrates fundamental R programming concepts through vector manipulation, mathematical computation, data transformation, and visualization. It includes both an R script and a PDF report summarizing findings, outputs, and visualizations based on the provided project instructions.

The assignment also utilizes the tidyverse and testthat packages for data wrangling, visualization, and automated testing of R code.

🧩 Files Included
File	Description
McLean_Project1.R	Main R script containing all problems, computations, and comments.
McLean_Project1_Report.pdf	Four-page report including title page, key findings, visualizations, and conclusion (APA style).
project1_tests.R	Provided test script to validate solutions using testthat.
ds_salaries.csv	Dataset used for data exploration and visualization.
⚙️ Project Setup

Open RStudio and create a new R project titled:

McLean_Project1

Create an R script named:

McLean_Project1.R

Add this environment-reset code at the top of your script:

cat("\014")  # clear console
rm(list = ls())  # clear environment
try(dev.off(dev.list()["RStudioGD"]), silent = TRUE)  # clear plots
try(p_unload(p_loaded(), character.only = TRUE), silent = TRUE)  # clear packages
options(scipen = 100)  # disable scientific notation

Load packages using pacman:

library(pacman)
p_load(testthat, tidyverse)

🧠 Key Concepts Practiced

Arithmetic and logical operations

Creating and manipulating vectors (c(), seq(), rep(), :)

Subsetting and indexing with brackets and logical vectors

Using built-in functions (sum, mean, median, max, min)

Generating random data with runif() and rnorm()

Computing summary statistics and cumulative sums

Data manipulation with dplyr (select, filter, mutate, arrange, slice)

Visualization with ggplot2

Automated testing with testthat

📊 Data Exploration

Later parts of the project use ds_salaries.csv.
Key steps include:

Reading data with read_csv()

Creating subsets with select() and filter()

Computing derived columns (e.g., salary conversions)

Visualizing job titles vs. salary with ggplot()

Example:

ggplot(better_smaller_dataframe) +
  geom_col(aes(x = job_title, y = salary_in_usd), fill = "blue") +
  xlab("Job Title") +
  ylab("Salary in US Dollars") +
  labs(title = "Comparison of Jobs") +
  scale_y_continuous(labels = scales::dollar) +
  theme(axis.text.x = element_text(angle = 50, hjust = 1))

🧪 Running Tests

To verify solutions:

library(pacman)
p_load(testthat)
test_file("project1_tests.R")

The output will show test results — aim for 100% passing.

🧷 References

Kabacoff, R. (2015). R in Action (2nd ed.). Manning Publications.

GeeksforGeeks – Replicate Elements of Vector in R

Intro2R – Vectors and Indexing

Bookdown – Logical Indexing in R
Statology – Using set.seed() in R

Stat.umn.edu – rnorm() Function Documentation
