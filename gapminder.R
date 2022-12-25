library(dslabs)
library(tidyverse)
library(ggplot2)
library(ggthemes)
ds_theme_set()
data(gapminder)

head(gapminder)

# gapminder %>%
#   filter(year == 2015 & country %in% c("Sri Lanka", "Turkey")) %>% 
#   select(country, infant_mortality)

years <- c(1962,1980,1990,2000,2012)
continents <- c("Europe", "Asia")

filter(gapminder, year %in% years && continent %in% continents) %>%
  ggplot(aes(fertility, life_expectancy, color = continent)) +
  geom_point() +
  facet_wrap(~year)


