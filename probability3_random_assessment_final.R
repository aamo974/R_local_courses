library(tidyverse)


# PART 1
outcomes <- c(-0.25,1)
p_right <- 1/5
p_false <- 1 - p_right

proba <- c(p_false, p_right)
n <- 44

p_right * 1 - p_false * 0.25

abs(-0.25-1) * sqrt(p_right * p_false) * sqrt(44)



set.seed(21)
B <- 10000

tests <- replicate(B, {
  X <- sample(outcomes, n, replace = TRUE, prob = proba)
  sum(X)
})
mean(tests >= 8)


tests
mean(tests >= 8)



# PART 2
outcomes <- c(0,1)
p_right <- seq(0.25, 0.95, 0.05)
p_false <- 1 - p_right

proba <- c(p_false, p_right)
n <- 44

avg <- 11
se <- abs(-1) * sqrt(p_right * p_false) * sqrt(44)

calc_avse <- function(x) {
  mu <- n*1*x + 0*(1-x)
  sigma <- sqrt(n) * abs(0-1) * sqrt(x*(1-x))
  1 - pnorm(35, mu, sigma)
}

exp <- sapply(p_right, calc_avse)

min(p[which(exp > 0.8)])

