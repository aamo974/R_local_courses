library(dplyr)
library(ggplot2)
library(dslabs)
data("murders")



murders %>%
  mutate(rate = total/population*100000) %>%
  mutate(reorder(murders$region,rate, .fun="median")) %>%
  ggplot(aes(murders$region,rate)) +
  geom_boxplot() +
  geom_point()


murders %>% 
  mutate(rate = total/population*100000) %>%
  mutate(region=reorder(region, rate, FUN=median)) %>%
  ggplot(aes(region, rate)) +
  geom_boxplot() +
  geom_point()

