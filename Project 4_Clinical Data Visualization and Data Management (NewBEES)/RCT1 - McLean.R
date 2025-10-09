#ALY 6000 - RCT1-McLean

#R-DataManagement1: Here are some good texts
#REF TEXTS Authors: Kabacoff "R in Action"
#REF TEXTS Authors: Mehmetoglu & Mittner "Applied Stats"
#REF TEXTS Authors: Schumacker, Randall "Using R ...."

#Import Multiple Packages
#Hmisc - labeling variables
#tidyr - reshaping datasets
#dplyr - DM functions
#summarytools - Descriptive stats
#psych - example datasets
#forcats - manipulating categorical variables
#devtools - installs programs like github?

#Installing multiple packages
myPackages <- c("Hmisc", "tidyr", "dplyr", "summarytools", "psych", "forcats", "devtools")
install.packages(myPackages)

devtools::install_github("ihrke/astatur")

#Generating New Variables
#Let's install dplyr to get access to mutate()
library(dplyr)

#Let's import womanshealth dataset
WHdf <- read.csv("womansHealth.csv", header=TRUE)
headTail(WHdf)
str(WHdf)
class(WHdf)
names(WHdf)

#Installing packages  in R
install.packages("vcd")
#Importing VCD library
library(vcd)

#b. Page 19: Import the VCD Library
library(vcd)
data("SexualFun")
SexualFun

#Import the data set as Student.csv below
stu <- read.csv(file = "Student.csv", header = TRUE)
stu

#Create a New Variable Log_A
e <- 2.71828
e
#log(A) = x <=> A = e^x <=> A e^log(A)
WHdf2 <- mutate(WHdf, log_A = log(A))
headtail(WHdf2)

#Double Check
#What is e^log_A
e ^ 5.85544

#What is WHdf2$A[1]
WHdf2$A[1]

e ^ 5.855444

#Combine Two Variables: TotalVitaminIntake
headtail(WHdf2)
WHdf2 <- mutate(WHdf2, TVIntake = A + C)
class(WHdf2)
summary(WHdf2)

#Creating Categories
WHdf2 <- mutate(WHdf2,
                IronCats = case_when(Iron <= 10 ~ 1,
                                     Iron > 10 & Iron <= 20 ~ 2,
                                     Iron > 20 & Iron <= 30 ~ 3,
                                     Iron > 30 & Iron <= 40 ~ 4,
                                     Iron > 40 & Iron <= 50 ~ 5,
                                     Iron > 50 & Iron <= 60 ~ 6,
                                     TRUE ~ 7))
headtail(WHdf2)

#Replace Values in a Dataset: Eliminate lowest values of Iron
WHdf2$IronCats[WHdf2$IronCats == 1] <- 77
headtail(WHdf2)

#Recheck Variable Data Types -- Change IronCats to factor
str(WHdf2)
WHdf2

#Create WHdf3
WHdf3 <- WHdf2
WHdf3 <- mutate(WHdf3, Iron = replace(Iron, Iron>=0.000, NA))
headtail(WHdf3)
summary(WHdf3)

WHdf3 <- mutate(WHdf3, Protein = replace(Protein, Calcium<=350.0, NA))
WHdf3
headtail(WHdf3, n=20)

#Rename Variable: rename() in dplyr
WHdf3 <- rename(WHdf3, TVI = TVIntake, I_Cat = IronCats)
headtail(WHdf3)

#How many NA and Where are they?
colSums(is.na(WHdf3))
colSums(!is.na(WHdf3))
which(is.na(WHdf3$Protein))
headtail(WHdf3, n=8)

#How many complete records(Observations) do we have?
dim(WHdf3)
complete.cases(WHdf3)

#Let's Remove Observations with Missing Values
#Why is this a problem?
mean(WHdf3$Protein)
mean(WHdf3$Protein, na.rm = TRUE)
summary(WHdf3$Protein)

#Delete the Iron Variable
WHdf3 <- subset(WHdf3, select = - c(Iron))
WHdf3
dim(WHdf3)
complete.cases(WHdf3)
WHdf4 <- WHdf3[complete.cases(WHdf3),]
WHdf4
dim(WHdf4)

#Delete observations where NA exists
dim(WHdf3)
WHdf3
WHdf5 <- na.omit(WHdf3)
WHdf5
dim(WHdf5)
headTail(WHdf5)

sum(complete.cases(WHdf5))
