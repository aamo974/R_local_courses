library(dslabs)

data(polls_us_election_2016)

names(polls_us_election_2016)

polls <- polls_us_election_2016 %>%
  filter(state == "U.S." & enddate >= "2016-10-31" &
           (grade %in% c("A+", "A", "A-", "B+") | is.na(grade)))

polls <-  polls %>%
  mutate(spread = rawpoll_clinton/100 - rawpoll_trump/100)

d_hat <- polls %>%
  summarize(d_hat = sum(spread * samplesize)/sum(samplesize)) %>%
  .$d_hat

p_hat <- (d_hat + 1) /2
moe <- 1.96 * 2 * sqrt(p_hat * (1 - p_hat)/sum(polls$samplesize))

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