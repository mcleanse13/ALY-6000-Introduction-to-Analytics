#Project 4 - NewBEES
#Basic Program Initialization
#Video NEU-0: Getting Started
library(ggplot2)
rm(list = ls())
matchData <- read.csv("MatchM-F-15-20-Clean-1-1.csv", header = TRUE)
matchData
dim(matchData)
N = 20
k = 14
class(matchData)
attach(matchData)

#Basic Descriptive Statistics
mean(TumorSize15);mean(TumorSize20)
sd(TumorSize15);sd(TumorSize20)

mean(Days15); mean(Days20)
sd(Days15); sd(Days20)

mean(Age15); mean(Age20)
sd(Age15); sd(Age20)

#GOAL #1 Basic Scatter Plots
#Goal 1: Assessment 1: Days (dependent Variable) versus (TumorSize)
lne1 <- lm(Days15 ~ TumorSize15)
coeffs1 <- coefficients(lne1)
coeffs1
x1 <- 9 #Size
y1 <- coeffs1[1] + coeffs1[2]*x1
y1
##Goal 1: Assessment 1: Confidence interval around slope of Travel
#confint(lne1, "miles")
summary(lne1)
#Goal 1: R plot
plot(Days15 ~ TumorSize15, xlim=c(4,14), ylim=c(0,22), ylab = "Inpatient Days",
     xlab="Lung Tumor Size (cm)",
     main="Stormont Valley: Surgery Outcomes", pch=20, las=2, cex=1.25,
     col="cadetblue")
#Changed las and cex in last plot like shown in the last video because I think the points are a lot more clear.

#Video NEU-2-Basic Plot - Symbols By Category
tmp <- matchData
tmp
tmp$Gender15
class(tmp$Gender15)
tmp$Gender15 <- as.factor(tmp$Gender15)
class(tmp$Gender15)
tmp$Gender15

#14 Create a pchs vector the arguments values for + and x
pchs <- c(3, 4)

#14 Create a cols vector with the two elements: "red" and "gray60"
cols <- c("red", "gray60")

#16 Associate the cols vector with tmp era values
cols[tmp$Gender15]

#Video NEU-1-Basic Plot - Color and Symbol Scatter
#17 Advanced Plot
plot(Days15 ~ TumorSize15, data = matchData, xlim=c(4,14), ylim=c(0,22), ylab= "Inpatient Days", xlab="Lung Tumor Size (cm)",
     main="Stormont Valley: Surgery Outcomes", pch=pchs[tmp$Gender15], col=cols[tmp$Gender15], las=1, cex=1.25)

#Video NEU-3-Basic Plot - Strip Plot
rm(list =ls())

library(dplyr)
df <- read.csv("TumorGlobal-726.csv", header = TRUE, sep = ",")
df
#RHPT Revealed
dim(df)
attach(df)
headtail(df)

#Descriptive Basics for Continuous/Discrete Data
mean(Days)
var(Days)
sd(Days)

#Extract only of Treated Patients
df
df[1:3,]
df
dfTreated <- df[706:725,]
dfT <- dfTreated
dfT

#Basic Descriptive Plots
#Stripchart all patients
stripchart(Days, method = "stack",
           at = c(0.05), #Used 0.05 here, looks closer to the stripchart shown in the video.
           pch = 20, cex = .5,
           las = 1,
           frame.plot = FALSE,
           xlim = c(0,15),
           main="Inpatient Days: 746 Tumor Surgeries")
abline(v = mean(df$Days), col = "red", lwd=3, lty=2)

#Video NEU-4-Basic Plot - Strip Chart 2
#Stripchart Normal Days
set.seed(1895)
a <- rnorm(746,12,4)
a
class(a)
a <- as.integer(a)
a
stripchart(a, method = "stack",
           at = c(0.05),
           pch = 20, cex = .5,
           las = 1,
           frame.plot = FALSE,
           xlim = c(0,25),
           main="Normal: Inpatient Days")
abline(v = mean(df$Days), col = "red", lwd=3, lty=2)
