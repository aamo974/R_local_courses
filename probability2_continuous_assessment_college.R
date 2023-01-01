set.seed(16)

act_scores <- rnorm(10000, 20.9, 5.7)

mean(act_scores)
sd(act_scores)

act <- data.frame(act_scores)


perfect <- act %>%
  filter(act$act_scores == 36)