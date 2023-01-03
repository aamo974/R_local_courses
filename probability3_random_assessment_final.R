library(tidyverse)

outcomes <- c(-0.25,1)
p_right <- 1/5
p_false <- 1 - p_right

proba <- c(p_false, p_right)
n <- 44
choices <- 5

p_right * 1 - p_false * 0.25

abs(-0.25-1) * sqrt(p_right * p_false) * sqrt(44)



set.seed(21)
B <- 10000


X <-replicate(n, {
  sample(outcomes, 1, replace = TRUE, prob = proba)
})


Y <- replicate (B, {
  sample()
})