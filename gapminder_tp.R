library(dplyr)
library(ggplot2)
library(dslabs)
data(gapminder)

# d <- gapminder %>% 
#   filter(year %in% seq(1960,2010) & country == "Cambodia") %>% 
#   select(life_expectancy,year) 
# 

mutate(gapminder,"dollars_per_day",gdp/population/365)




