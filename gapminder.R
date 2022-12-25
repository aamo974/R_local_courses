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

filter(gapminder, year == 1962) %>%
  ggplot(aes(fertility, life_expectancy, color = continent)) +
  geom_point()
