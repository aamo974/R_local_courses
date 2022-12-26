library(dslabs)
library(tidyverse)
library(ggplot2)
library(ggthemes)
ds_theme_set()
data(gapminder)


# gapminder %>%
#   filter(year == 2015 & country %in% c("Sri Lanka", "Turkey")) %>% 
#   select(country, infant_mortality)

# years <- c(1962,1980,1990,2000,2012)
# continents <- c("Europe", "Asia")
# 
# gapminder %>%
#   filter(year %in% years & continent %in% continents) %>%
#   ggplot(aes(fertility, life_expectancy, color = continent)) +
#   geom_point() +
#   facet_wrap(~year)

# countries <- c("South Korea","Germany")
# 
# gapminder %>% filter(country %in% countries) %>%
#   ggplot(aes(year,fertility,color = country)) +
#   geom_line()
# 
# labels <- data.frame(country = countries, x = c(1975,1965), y = c(60,72))
# gapminder %>%
#   filter(country %in% countries)  %>%
#   ggplot(aes(year,life_expectancy, col = country)) +
#   geom_line() +
#   geom_text(data = labels, aes(x,y,label=country), size = 5) +
#   theme(legend.position="none")

 gapminder <- gapminder %>%
   mutate(dollars_per_day = gdp/population/365)
# 
 past_year <- 1970
 
# gapminder %>%
#   filter(year == past_year & !is.na(gdp)) %>%
#   ggplot(aes(log2(dollars_per_day))) +
#   geom_histogram(binwidth = 1, col = "blue")

p <- gapminder %>%
  filter(year == past_year & !is.na(gdp)) %>%
  mutate(region = reorder(region, dollars_per_day, FUN = median)) %>%
  ggplot(aes(region,dollars_per_day, fill = continent)) +
  geom_boxplot() +
  theme(axis.text.x = element.text(angle = 90, hjust = 1)) +
  xlab("")

