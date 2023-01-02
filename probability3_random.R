library(tidyverse)

beads <- rep(c("Red","Blue"), times=c(2,3))
X = ifelse(sample(beads,1) == "Blue", 1, 0)

n = 1000
color <- rep(c("Black", "Red", "Green"), c(18, 18, 2))

X <- sample(ifelse( color == "Red", -1, 1), n, replace = TRUE)
X[1:10]

X <- sample(c(-1,1), n, replace = TRUE, prob=c(9/19,10/19))
sum(X)

B <- 10000
S <- replicate(B, {
  X <- sample(c(-1,1), n, replace = TRUE, prob = c(9/19, 10/19))
  sum(X)
})

mean(S < 0)
mean(S)
sd(S)

s <- seq(min(S), max(S), length = 100)
normal_density <- data.frame(s = s, f = dnorm(s, mean(S), sd(S)))
data.frame(S = S) %>%
  ggplot(aes(S, ..density..)) +
  geom_histogram(color = "black", binwidth = 10) +
  ylab("Probability") +
  geom_line(data = normal_density, mapping = aes(s,f), color = "blue")