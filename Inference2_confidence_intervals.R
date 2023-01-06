

# data("nhtemp")
# data.frame(year = as.numeric(time(nhtemp)), temperature = as.numeric(nhtemp)) %>%
#   ggplot(aes(year, temperature)) +
#   geom_point() +
#   geom_smooth() +
#   ggtitle("Average Yearly Temperatures in New Haven")

# p <- 0.45
# N <- 1000
# 
# X <- sample(c(0,1), N, replace = TRUE, prob = c(1-p, p))
# 
# X_hat <- mean(X)
# SE_hat <- sqrt(p*(1-p)/N)
# c(X_hat - 2*SE_hat, X_hat + 2*SE_hat)
# 
# pnorm(qnorm(0.995))


# B <- 10000
# inside <- replicate(B, {
#   X <- sample(c(0,1), size = N, replace = TRUE, prob = c(1-p,p))
#   X_hat <- mean(X)
#   SE_hat <- sqrt(p*(1-p)/N)
#   
#   between(p, X_hat-2*SE_hat, X_hat+2*SE_hat)
# })
# 
# mean(inside)

N <- 25
X_hat <- 0.48
(2*X_hat - 1) + c(-2,2)*2*sqrt(X_hat*(1-X_hat)/N)


