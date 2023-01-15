library(dslabs)
library(dplyr)

prev <- 0.00025
N <- 10000
outcome <- sample(c("Disease","Healthy"), N, replace = TRUE, prob = c(prev, 1-prev))


N_D <- sum(outcome == "Disease")
N_D
N_H <- sum(outcome == "Healthy")
N_H

accuracy <- 0.99

test <- vector("character", N)
test[outcome == "Disease"] <- sample(c("+","-"), N_D, replace = TRUE, prob = c(accuracy,1-accuracy))
test[outcome == "Healthy"] <- sample(c("-","+"), N_H, replace = TRUE, prob = c(accuracy,1-accuracy))

table(outcome, test)