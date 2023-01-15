library(dslabs)
library(dplyr)
data("polls_us_election_2016")

one_poll_per_polster <- polls %>%
  group_by(pollster) %>%
  filter(enddate == max(enddate)) %>%
  ungroup()

one_poll_per_polster %>%
  ggplot(aes(spread)) +
  geom_histogram(binwidth = 0.01)

results <- one_poll_per_polster %>%
  summarize(avg = mean(spread), se = sd(spread)/sqrt(length(spread))) %>%
  mutate(start = avg - 1.96*se, end = avg + 1.96*se)

round(results*100,1)