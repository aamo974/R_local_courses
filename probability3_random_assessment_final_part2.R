library(tidyverse)

a <- 6
b <- -1
p_a <- 5/38
p_b <- 1 - p_a
proba <- c(p_a,p_b)
n <- 500


outcomes <- c(a,b)
mu <- a*p_a + b*p_b 
sig <- abs(a-b) * sqrt(p_a*p_b)

mu500 <- 500 * avg
sig500 <- sig * sqrt(500)

mu500
sig500
