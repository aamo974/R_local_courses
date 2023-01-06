

# data("nhtemp")
# data.frame(year = as.numeric(time(nhtemp)), temperature = as.numeric(nhtemp)) %>%
#   ggplot(aes(year, temperature)) +
#   geom_point() +
#   geom_smooth() +
#   ggtitle("Average Yearly Temperatures in New Haven")



p <- 0.45
N <- 1000

X <- sample(c(0,1), N, replace = TRUE, prob = c(1-p, p))

X_hat <- mean(X)
SE_hat <- sqrt(p*(1-p)/N)
c(X_hat - 2*SE_hat, X_hat + 2*SE_hat)

pnorm(qnorm(0.995))