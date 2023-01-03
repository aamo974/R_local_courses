n <- 1000
loss_per_foreclosure <- -200000

p <- 0.02

B <- 10000
losses <- replicate(B, {
  defaults <- sample(c(0,1), n, prob=c(1-p, p), replace = TRUE)
  sum(defaults * loss_per_foreclosure)
})


n*(p*loss_per_foreclosure + (1-p)*0)
sqrt(n) * abs(loss_per_foreclosure) * sqrt(p*(1-p))

