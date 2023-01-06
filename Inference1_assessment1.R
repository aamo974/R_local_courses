# # Write a function called `take_sample` that takes `p` and `N` as arguements and returns the average value of a randomly sampled population.
# take_sample <- function(p,N) {
#   X <- sample(c(0,1), N, replace = TRUE, prob = c(1-p, p))
#   mean(X)
# }
# 
# # Use the `set.seed` function to make sure your answer matches the expected result after random sampling
# set.seed(1)
# 
# # Define `p` as the proportion of Democrats in the population being polled
# p <- 0.45
# 
# # Define `N` as the number of people polled
# N <- 100
# 
# # Call the `take_sample` function to determine the sample average of `N` randomly selected people from a population containing a proportion of Democrats equal to `p`. Print this value to the console.
# take_sample(p,N)



# Define `p` as the proportion of Democrats in the population being polled
p <- 0.45

# Define `N` as the number of people polled
N <- 100

# The variable `B` specifies the number of times we want the sample to be replicated
B <- 10000

# Use the `set.seed` function to make sure your answer matches the expected result after random sampling
set.seed(1)

# Generate `errors` by subtracting the estimate from the actual proportion of Democratic voters
errors <- replicate(B, p - take_sample(p, N))

# Generate a qq-plot of `errors` with a qq-line showing a normal distribution
qqnorm(errors) + qqline(errors)
