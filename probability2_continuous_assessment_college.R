set.seed(16)

act_scores <- rnorm(10000, 20.9, 5.7)

avg <- mean(act_scores)
s <- sd(act_scores)

act <- data.frame(act_scores)


perfect <- act %>%
  filter(as.integer(act$act_scores) >= 30)

total <- nrow(act)
n30 <- nrow(perfect)

pnorm(10,avg, s)

x <- seq(1,36)

# f_x <- data.frame(x, f = dnorm(x,20.9,5.7)) 
# f_x %>%
#   ggplot(aes(x, f)) +
#   geom_line()

# CONVERSION TO Z-SCORES
act$act_scores <- (act$act_scores - avg)/s

# What ACT score value corresponds to 2 standard deviations above the mean (Z = 2)?
2*sd(act_scores) + mean(act_scores)

# What is the 97.5th percentile of act_scores?
mean(qnorm(0.975, mean(act_scores), sd(act_scores)))

# Write a function that takes a value and produces the probability of an ACT score less than or equal to that value (the CDF). Apply this function to the range 1 to 36.
cdf <- function(x) {
  mean(act_scores <= x)
}

# What is the minimum integer score such that the probability of that score or lower is at least .95?
v <- sapply(1:36, cdf)
min(which(v >= .95))

qnorm(0.95,20.9,5.7)

p <- seq(0.01, 0.99, 0.01)
sample_quantiles <- quantile(act_scores, p)
theoretical_quantiles <- qnorm(p, 20.9, 5.7)
qplot(theoretical_quantiles, sample_quantiles) + geom_abline()





