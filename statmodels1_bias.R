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
moe