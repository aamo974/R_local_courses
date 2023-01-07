d <- 0.039
Ns <- c(1298, 533, 1342, 897, 774, 254, 812, 324, 1291, 1056, 2172, 516)
p <- (d+1)/2

confidence_intervals <- sapply(Ns, function(N) {
  
  X <- sample(c(0,1),N,replace = TRUE, prob=c(1-p,p))
  X_hat <- mean(X)
  SE_hat <- sqrt(X_hat*(1-X_hat)/N)
  2*c(X_hat, X_hat-2*SE_hat, X_hat+SE_hat)-1
})

polls <- data.frame(poll=1:ncol(confidence_intervals),
                    t(confidence_intervals),
                    sample_size = Ns)

names(polls)<-c("poll","estimate","low","high","sample_size")
sum(polls$sample_size)