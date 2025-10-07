p_load(testthat)
#testthat::test_file("project2_tests.R")
test_file("project2_tests.R")
cat("\014") # clears console
rm(list = ls()) # clears global environment
try(dev.off(dev.list()["RStudioGD"]), silent = TRUE) # clears plots
try(p_unload(p_loaded(), character.only = TRUE), silent = TRUE) # 
options(scipen = 100) # disables scientific notion for entire R session
library(pacman)
p_load(tidyverse)
#Assignment Part 1
data_2015 <- read.csv('2015.csv')
head(data_2015)
names(data_2015)
glimpse(data_2015)
p_load(janitor)
data_2015 <- clean_names(data_2015)
data_2015
happy_df <- select(data_2015, "country", "region", "happiness_score", "freedom")
happy_df
#Source: https://www.datanovia.com/en/lessons/select-data-frame-columns-in-r/
top_ten_df <- head(happy_df, n=10)
top_ten_df
#Notes: similar line of coding as Python
no_freedom_df <- filter(happy_df, freedom < "0.20")
no_freedom_df
#Source: https://sparkbyexamples.com/r-programming/r-filter-dataframe-by-column-value/#:~:text=You%20can%20do%20this%20by,frame%20and%20return%20data.
best_freedom_df <- arrange(happy_df, desc(freedom))
best_freedom_df
#Remembered this code from the previous project.
rm(gff_stat)
data_2015 <- mutate(data_2015, gff_stat = family + freedom + generosity)
data_2015
#Remembered this code from the previous project.
summary(happy_df)
happy_summary <- summary(happy_df)
happy_summary
mean_happiness <- mean(happy_df$happiness_score)
max_happiness <- max(happy_df$happiness_score)
mean_freedom <- mean(happy_df$freedom)
max_freedom <- max(happy_df$freedom)
happy_summary <- data.frame(
  mean_happiness = mean_happiness,
  max_happiness = max_happiness,
  mean_freedom = mean_freedom,
  max_freedom = max_freedom
)
happy_summary
#Professor via email recommended ChatGPT for proper coding of the previous problem.
regional_stats_df <- happy_df %>%
  group_by(region) %>%
  summarize(
    country_count = n(),
    mean_happiness = mean(happiness_score),
    mean_freedom = mean(freedom)
  )
regional_stats_df
#ChatGPT solution, still working on my research skills!
western_europe <- data_2015[happy_df$region == "Western Europe", ]
western_europe
sub_saharan_africa <- data_2015[happy_df$region == "Sub-Saharan Africa", ]
sub_saharan_africa
ten_least_happy_western_europe <- western_europe[order(western_europe$happiness_score), ][1:10, ]
ten_happiest_sub_saharan_africa <- sub_saharan_africa[order(-sub_saharan_africa$happiness_score), ][1:10, ]
avg_gdp_western_europe <- mean(ten_least_happy_western_europe$economy_gdp_per_capita)
avg_gdp_sub_saharan_africa <- mean(ten_happiest_sub_saharan_africa$economy_gdp_per_capita)
gdp_df <- data.frame(
  europe_gdp = avg_gdp_western_europe,
  africa_gdp = avg_gdp_sub_saharan_africa
)
gdp_df
#Had to use ChatGPT again but it kept giving me the incorrect coding. I figured out that it was giving me the happy_df dataset which did contain the gdp column so I inserted the origianl data_2015 instead to calculate the correct totals.
plot(regional_stats_df$mean_freedom, regional_stats_df$mean_happiness, 
     xlab = "Mean Freedom", ylab = "Mean Happiness", 
     main = "Scatterplot of Mean Happiness vs. Mean Freedom")
min_mean_freedom <- min(regional_stats_df$mean_freedom)
max_mean_freedom <- max(regional_stats_df$mean_freedom)
min_mean_happiness <- min(regional_stats_df$mean_happiness)
max_mean_happiness <- max(regional_stats_df$mean_happiness)
segments(min_mean_freedom, min_mean_happiness, max_mean_freedom, max_mean_happiness, col = "red", lwd = 2)
#Source: https://www.w3schools.com/r/r_graph_scatterplot.asp
#Assignment Part 2
baseball <- read.csv('baseball.csv')
baseball
class(baseball)
age_stats_df <- baseball %>%
  group_by(Age) %>%
  summarize(
    Count = n(),
    HR = mean(HR, na.rm = TRUE),
    H = mean(H, na.rm = TRUE),
    R = mean(R, na.rm = TRUE)
  )
age_stats_df
baseball <- baseball %>%
  filter(AB > 0)
baseball
baseball$BA <- baseball$H / baseball$AB
baseball
baseball$BA <- round(baseball$BA, digits = 3)
baseball
#Source: https://www.statology.org/round-in-r/#:~:text=You%20can%20use%20the%20following,values%20up%20to%20nearest%20integer.
baseball$OBP <- (baseball$H + baseball$BB) / (baseball$AB + baseball$BB)
baseball
baseball$OBP <- round(baseball$OBP, digits = 3)
baseball
strikeout_artist <- baseball %>%
  arrange(desc(SO)) %>%
  head(10)
strikeout_artist
#Used ChatGDT for this problem, gave the wrong code but realized that it labeled the strikeout column as 'K' so I corrected it to 'SO' and it successfully ran.
ggplot(data = baseball, aes(x = HR, y = RBI)) +
  geom_point() +
  labs(
    x = "Number of Home Runs (HRs)",
    y = "Number of RBIs"
  ) +
  ggtitle("Scatterplot of HRs vs. RBIs")
eligible_df <- baseball %>%
  filter(AB >= 300, G >= 100)
eligible_df
hist(eligible_df$BA)
ggplot(data = eligible_df, aes(x = BA)) +
  geom_histogram(binwidth = 0.025, color = "blue", fill = "green") +
  labs(
    x = "Batting Average (BA)",
    y = "Count",
    title = "Histogram of Batting Average for Eligible Players"
  )
eligible_df <- eligible_df |>
  mutate(RankHR =rank(-1 * HR, ties.method = "min"))
eligible_df
eligible_df <- eligible_df |>
  mutate(RankRBI =rank(-1 * RBI, ties.method = "min"))
eligible_df
eligible_df <- eligible_df |>
  mutate(RankOBP =rank(-1 * OBP, ties.method = "min"))
eligible_df
#Used ChatGDT to understand the ranking function and how to arrange it.
eligible_df <- eligible_df %>%
  mutate(TotalRank = RankHR + RankRBI + RankOBP)
eligible_df
mvp_candidates <- eligible_df %>%
  arrange(TotalRank) %>%
  head(20)
mvp_candidates
mvp_candidates_abbreviated <- select(mvp_candidates, "First", "Last", "RankHR", "RankRBI", "RankOBP", "TotalRank")
mvp_candidates_abbreviated