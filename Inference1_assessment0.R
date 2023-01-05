# The vector `p` contains 100 proportions of Democrats ranging from 0 to 1 using the `seq` function
p <- seq(0, 1, length = 100)

# The vector `sample_sizes` contains the three sample sizes
sample_sizes <- c(25, 100, 1000)

# Write a for-loop that calculates the standard error `se` for every value of `p` for each of the three samples sizes `N` in the vector `sample_sizes`. Plot the three graphs, using the `ylim` argument to standardize the y-axis across all three plots.
for(N in sample_sizes) {
  std_err_1 <- list()
  std_err_2 <- list()
  std_err_3 <- list()
  
  i <- 0
  for(P in p) {
    std_err_1[i] <- sqrt(P*(1-P)/sample_sizes[1])
    std_err_2[i] <- sqrt(P*(1-P)/sample_sizes[2])
    std_err_3[i] <- sqrt(P*(1-P)/sample_sizes[3])
  } 
}



for(N in sample_sizes){
  se <- sqrt(p*(1-p)/N)
  plot(p, se, ylim = c(0,0.5/sqrt(25)))
}