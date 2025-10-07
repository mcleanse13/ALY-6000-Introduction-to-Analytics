#Sean McLean, 09/23/23, ALY6000
cat("\014") #clears console
rm(list = ls()) #clears global environment
try(dev.off(dev.list()["RStudioGD"]), silent = TRUE) #clears plots
try(p_unload(p_loaded(), character.only = TRUE), silent = TRUE) # clears packages
options(scipen = 100) #disables scientific notation for entire R session
library(pacman)
p_load(testthat)
test_file("project1_tests.R")
123 * 453
5^2 * 40
TRUE & FALSE
TRUE | FALSE
75 %% 10
75 / 10
first_vector <- c(17, 12, -33, 5)
first_vector
#Source: # R in Action (2nd ed): Chapter 2
counting_by_fives <- c(5, 10, 15, 20, 25, 30, 35)
counting_by_fives
second_vector <- seq(10,30, by=2)
second_vector
#Source: www.youtube.com/watch?app=desktop&v=Hw-j-hzAUNM
counting_by_fives_with_seq <- seq(5,35, by=5)
counting_by_fives_with_seq
third_vector <- rep(first_vector, times = 10)
third_vector
#Source: https://www.geeksforgeeks.org/replicate-elements-of-vector-in-r-programming-rep-method/
rep_vector <- rep(0, times = 20)
rep_vector
#Source: https://www.geeksforgeeks.org/replicate-elements-of-vector-in-r-programming-rep-method/
fourth_vector <- (10:1)
fourth_vector
counting_vector <- (5:15)
counting_vector
grades <- c(96, 100, 85, 92, 81, 72)
grades
bonus_points_added <- (grades + 3)
bonus_points_added
one_to_one_hundred <- c(1:100)
one_to_one_hundred
reverse_numbers <- seq(100, -100, by=-3)
reverse_numbers
#the second vector variable has a range of numbers from 10 to 30 that contains only even numbers within that range. Adding 20 to each value changes its range to 30 to 50.
second_vector + 20
#the second vector variable has a range of numbers from 10 to 30 that contains only even numbers within that range. Multiply 20 to each value changes its range to 200 to 600.
second_vector * 20
#the second vector variable has a range of numbers from 10 to 30 that contains only even numbers within that range. Incorporating the function 'greater than or equal to' with a value of 20 will provide each value with a TRUE or FALSE answer depending on whether the value is greater than 20 (TRUE) or less than 20 (FALSE).
second_vector >= 20
#the second vector variable has a range of numbers from 10 to 30 that contains only even numbers within that range. Incorporating the function '!=' with a value of 20 will provide each value with a TRUE or FALSE answer depending on whether the value equals 20 (TRUE) or does not equal 20 (FALSE).
second_vector != 20
total <- sum(one_to_one_hundred)
total
average_value <- mean(one_to_one_hundred)
average_value
median_value <- median(one_to_one_hundred)
median_value
max_value <- max(one_to_one_hundred)
max_value
min_value <- min(one_to_one_hundred)
min_value
first_value <- second_vector[1]
first_value
#Source: www.intro2r.com/vectors.html
first_three_values <- second_vector[1:3]
first_three_values
vector_from_brackets <- second_vector[c(1,5,10,11)]
vector_from_brackets
vector_from_boolean_brackets <- first_vector[c(FALSE, TRUE, FALSE, TRUE)]
vector_from_boolean_brackets
#Source: https://bookdown.org/ndphillips/YaRrr/logical-indexing.html
#The vector is indexed with logical vectors which means that they have only TRUE of FALSE values. So the way the c vector is indexed the only TRUE values are the second and fourth values so 12 and 5 which are the only values that will be returned.
second_vector >= 20
ages_vector <- seq(from = 10, to = 30, by = 2)
ages_vector
ages_vector [ages_vector >= 20]
lowest_grades_removed <- grades
lowest_grades_removed [grades >= 85]
middle_grades_removed <- grades
middle_grades_removed [c(TRUE, TRUE, FALSE, FALSE, TRUE, TRUE)]
#Unsure if this is the correct way to do this but indexing it with logical vectors provided the correct output.
fifth_vector <- second_vector
fifth_vector[-c(5, 10)]
#Source: https://sparkbyexamples.com/r-programming/r-remove-from-vector-with-examples/#remove-specific-value-from-vector
set.seed(5)
random_vector <- runif(n=10, min = 0, max = 1000)
#Source: https://www.statology.org/set-seed-in-r/#:~:text=The%20set.,time%20you%20run%20the%20code
sum_vector <- random_vector
sum(sum_vector)
cumsum_vector <- random_vector
cumsum(cumsum_vector)
mean_vector <- random_vector
mean(mean_vector)
sd_vector <- random_vector
sd(sd_vector)
round_vector <- random_vector
round(random_vector)
sort_vector <- random_vector
sort(sort_vector)
set.seed(5)
random_vector <- rnorm(n=1000, mean = 50, sd = 15)
#Source: https://www.stat.umn.edu/geyer/old/5101/rlook.html#:~:text=rnorm%20is%20the%20R%20function,standard%20deviation%20of%20the%20distribution
hist(random_vector)
#the histogram has a mean of 50 where the top of the bell shaped curve would lie. One standard deviation has a value of 15 so on both sides of the mean the range for one standard deviation would be between 35 and 65. This would indicate that 68 percent of the values will fall within that range.
p_load(tidyverse)
first_dataframe <- read.csv('ds_salaries.csv')
first_dataframe
head(first_dataframe)
#the head function will show just the first six rows of each table in the datafile.
head(first_dataframe, n = 7)
##the head function will show just the first six rows of each table in the datafile. The n function will return how many rows in each table that it has been instructed to, so the first 7 rows.
names(first_dataframe)
#the names function provides all the column names in every table in the datafile.
smaller_dataframe <- select(first_dataframe, job_title, salary_in_usd)
smaller_dataframe
#the vector 'smaller_dataframe' is created and uses the select function for the 'first_dataframe' datafile and two columns 'job_title' and 'salary_in_usd' from the datafile. This returns just the two columns from the datafile for the new vector.
better_smaller_dataframe <- arrange(smaller_dataframe, desc(salary_in_usd))
better_smaller_dataframe
#the vector which contains the 'job_title' and 'salary_in_usd' columns are ordered in descending order of the 'salary_in_used' column by using the desc function.
better_smaller_dataframe <- filter(smaller_dataframe, salary_in_usd > 8000)
better_smaller_dataframe
#the vector which features the 'job_title' and 'salary_in_usd' columns uses the greater than function with a value of 8000 for the 'salary_in_usd' column which returns only the rows with those values.
better_smaller_dataframe <- mutate(smaller_dataframe, salary_in_euros = salary_in_usd * .94)
better_smaller_dataframe
#the vector features three columns (job_title, salary_in_usd, salary_in_euros) from the downloaded datafile. The values in the 'salary_in_euros' column is computed by taking the values in the 'salary_in_usd' column and multiplying each value by .94.
better_smaller_dataframe <- slice(smaller_dataframe, 1, 1, 2, 3, 4, 10, 1)
better_smaller_dataframe
#the vector uses the slice function that extracts and returns just the selected rows from the datafile.
ggplot(better_smaller_dataframe) + 
  geom_col(mapping = aes(x = job_title, y = salary_in_usd), fill = "blue") + 
  xlab("Job Title") + 
  ylab("Salary in US Dollars") + 
  labs(title = "Comparison of Jobs") + 
  scale_y_continuous(labels = scales::dollar) + 
  theme(axis.text.x = element_text(angle = 50, hjust =1))
#The plotting of the vector which includes the job titles and their salaries, the title of the plot, the proper x and y axis labels, the color of the bars, the scale of the x axis in dollars, and the angle of the job title text on the y-axis.