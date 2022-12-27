library(dplyr)
library(ggplot2)
library(dslabs)
library(RColorBrewer)
data(us_contagious_diseases)

  # geom_line(aes(year,rate, group = state), color = "grey50", show.legend = FALSE, alpha = 0.2, size = 1) +
  # geom_line(mapping = aes(year, us_rate), data = avg, size = 1, col = "black") +

us_contagious_diseases %>%
  filter(!is.na(population)) %>%
  group_by(year,disease) %>%
  summarize(rate = sum(count)/sum(population)*10000) %>%
  ggplot(aes(year,rate,color=disease)) +
  geom_line()