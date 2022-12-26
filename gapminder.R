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
 present_year <- 2010
 
# gapminder %>%
#   filter(year == past_year & !is.na(gdp)) %>%
#   ggplot(aes(log2(dollars_per_day))) +
#   geom_histogram(binwidth = 1, col = "blue")

# p <- gapminder %>%
#   filter(year == past_year & !is.na(gdp)) %>%
#   mutate(region = reorder(region, dollars_per_day, FUN = median)) %>%
#   ggplot(aes(region,dollars_per_day, fill = continent)) +
#   geom_boxplot() +
#   theme(axis.text.x = element_text(angle = 90, hjust = 1)) +
#   xlab("") +
#   scale_y_continuous(trans="log2") +
#   geom_point()

# west <- c("Western Europe", "Northern Europe", "Southern Europe", "Northern America", "Australia and New Zealand")
# 
# p <- gapminder %>%
#   filter(year %in% c(past_year,present_year) & !is.na(gdp)) %>%
#   mutate(group = ifelse(region %in% west,"West","Developing")) %>%
#   ggplot(aes(dollars_per_day)) +
#   geom_histogram(binwidth = 1, col = "black") +
#   scale_x_continuous(trans="log2") +
#   facet_grid(year ~ group)

country_list_1 <- gapminder %>%
  filter(year == past_year & !is.na(dollars_per_day)) %>% .$country
country_list_2 <- gapminder %>%
  filter(year == present_year & !is.na(dollars_per_day)) %>% .$country
country_list <- intersect(country_list_1, country_list_2)


gapminder <- gapminder %>%
  mutate(group = case_when(
    .$region %in% west ~ "West",
    .$region == "Northern Africa" ~ "Northern Africa",
    .$region %in% c("Eastern Asia", "South-Eastern Asia") ~ "East Asian",
    .$region == "Southern Asia" ~ "Southern Asia",
    .$region %in% c("Central American","South America","Carribean") ~ "Latin America",
    .$continent == "Africa" & .$region != "Northern Africa" ~ "Sub-Saharan Africa",
    .$region %in% c("Melanesia","Micronesia","Polynesia") ~ "Pacific Islands"))

surv_income <- gapminder %>%
  filter(year %in% present_year & !is.na(gdp) & !is.na(infant_mortality) & !is.na(group)) %>%
  group_by(group) %>%
  summarize(income = sum(gdp)/sum(population)/365,
            infant_survival_rate = 1 - sum(infant_mortality/1000*population)/sum(population))


# gapminder <- gapminder %>%
#   mutate(group = factor(group,levels = c("Others","Latin America","East Asia","Sub-Saharan Africa", "West")))
# 
# p <- gapminder %>%
#   filter(year %in% c(past_year, present_year) & country %in% country_list) %>%
#   ggplot(aes(dollars_per_day, fill = group)) +
#   scale_x_continuous(trans = "log2") +
#   geom_density(alpha = 0.2, bw = 0.75, position = "stack") +
#   facet_grid(year ~ .)
# 

surv_income %>% arrange(income)

surv_income %>% 
  ggplot(aes(income, infant_survival_rate, label = group, color = group)) +
  geom_point(countr) + 
  scale_x_continuous(trans = "log2", limit = c(0.25, 150)) +
  scale_y_continuous(trans = "logit", limit = c(0.875, .9981),
                     breaks = c(.85, .90, .95, .99, .995, .998)) +
  geom_label(size = 3, show.legend = FALSE)












