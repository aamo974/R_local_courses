library(tidyverse)
library(dslabs)
data(heights)


# The variable `B` specifies the number of times we want the simulation to run.
B <- 1000

# Use the `set.seed` function to make sure your answer matches the expected result after random number generation.
set.seed(1)

# Create an object called `highestIQ` that contains the highest IQ score from each random distribution of 10,000 people.
highestIQ <- replicate(B, {
  data <- rnorm(10000,100,15)
  max(data)
})

# Make a histogram of the highest IQ scores.
highestIQ %>%
  ggplot(aes(highestIQ)) +
  geom_histogram()