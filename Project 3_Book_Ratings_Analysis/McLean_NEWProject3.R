#ALY 6000 - Project 3
#Installing packages  in R
install.packages("vcd")
#Importing VCD library
library(vcd)
data("SexualFun")
SexualFun
#Import the data set as 'Student.csv' into R
stu <- read.csv(file = 'Student.csv', header = TRUE)
stu
#Plot a sales/temp scatter plot.
sales <- c(8, 11, 15, 20, 21, 11, 18, 10, 6, 22)
temp <- c(69, 80, 77, 84, 80, 77, 87, 70, 65, 90)
plot(sales~temp)
#Creating a dataframe
patientID <- c(1, 2, 3, 4)
age <- c(25, 34, 28, 52)
diabetes <- c("Type1", "Type2", "Type1", "Type1")
status <- c("Poor", "Improved", "Excellent", "Poor")
patientdata <- data.frame(patientID, age, diabetes, status)
patientdata
#Finding out the class of the variable 'patientID'
class(patientdata$patientID)
#Finding out what is contained in the variable 'patientID'
patientdata$patientID
patientID
#Specifying elements in the data frame
patientdata[1:2]
patientdata[c("diabetes", "status")]
patientdata$age
#Need to remember the symbol $ accesses the data frame and columns inside the data frame.