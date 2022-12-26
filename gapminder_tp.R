library(dplyr)
library(dslabs)
data(gapminder)


df <- gapminder %>%
  select(continent == "Africa" & year == 2012 & fertility <= 3)