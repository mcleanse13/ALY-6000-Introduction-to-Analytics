#NewBees Project 5 - Sean McLean
#BASIC PROGRAM INITIALIZATION
library(ggplot2)
rm(list = ls())
matchData <- read.csv("MatchM-F-15-20-Clean-1-1.csv", header = TRUE)
matchData
dim(matchData)
N = 20
k = 16
class(matchData)
attach(matchData)

#Basic Descriptive Statistics
mean(TumorSize15);mean(TumorSize20)
sd(TumorSize15);sd(TumorSize20)

mean(Days15);mean(Days20)
sd(Days15);sd(Days20)

mean(Age15);mean(Age20)
sd(Age15);sd(Age20)

#GOAL #1 BASIC SCATTER PLOTS
#GOAL #1: ASSESSMENT 1: Days (dependent Variable) versus (TumorSize)
lne1 <- lm(Days15 ~ TumorSize15)
coeffs1 <- coefficients(lne1)
coeffs1
x1 <- 9 #Size
y1 <- coeffs1[1] + coeffs1[2]*x1
y1
##GOAL 1: ASSESSMENT 1: Confidence interval around slope of Travel
#contfint(lne1, "miles")
summary(lne1)
#GOAL 1: R plot
plot(Days15 ~ TumorSize15, xlim=c(4,14), ylim=c(0,22), ylab = "Inpatient Days",
     xlab="Lung Tumor Size (cm)", main="Stormont Valley: Surgery Outcomes", pch=20,
     las=2, cex=1.25, col="cadetblue") 

tmp <- matchData
tmp
tmp$Gender15
class(tmp$Gender15)
tmp$Gender15 <- as.factor(tmp$Gender15)
class(tmp$Gender15)
tmp$Gender15

#14 CREATE a pchs vector the arguments values for + and x
pchs <- c(3,4)

#14 CREATE a cols vector: with the two elements: "red" and "gray60"
cols <- c("red","gray60")

#16 Associate the cols vector with tmp era values
cols[tmp$Gender15]

#17 Advanced Plot
plot(Days15 ~ TumorSize15, data=matchData, xlim=c(4,14), ylim=c(0,22), ylab = "Inpatient Days",
     xlab="Lung Tumor Size (cm)", main="Stormont Valley: Surgery Outcomes", pch=pchs[tmp$Gender15],
     col=cols[tmp$Gender15], las=1, cex=1.25) 

#BoxPlot
boxplot(Days20, main="Inpatient Days - Lot 20")

#BOXPLOT WITH JITTER
ggplot(matchData, aes(x = "", y = Days20)) + 
  geom_boxplot(outlier.shape = NA) + 
  geom_jitter(width = 0.2, color = 2, shape = 20)

#BOXPLOT WITH JITTER by Gender
ggplot(matchData, aes(x = Gender20, y = Days20, color = Gender20, shape = Gender20)) + 
  geom_boxplot(outlier.shape = NA) + 
  geom_jitter(width=0.2, color = 2) +
  ggtitle("Inpatient Days by Gender: Lot 20") + 
  xlab("Gender") + ylab("Days in Hospital")
