# Load the data
data(polls_us_election_2016)

# Generate an object `polls` that contains data filtered for polls that ended on or after October 31, 2016 in the United States
polls <- polls_us_election_2016 %>%
  filter(state == "U.S." & enddate >= as.Date("2016-10-31","%Y-%m-%d"))

# How many rows does `polls` contain? Print this value to the console.
nrow(polls)

# Assign the sample size of the first poll in `polls` to a variable called `N`. Print this value to the console.
N <- polls$samplesize[1]
N

# For the first poll in `polls`, assign the estimated percentage of Clinton voters to a variable called `X_hat`. Print this value to the console.
X_hat <- polls$rawpoll_clinton[1]/100
X_hat

# Calculate the standard error of `X_hat` and save it to a variable called `se_hat`. Print this value to the console.
se_hat <- sqrt(X_hat * (1-X_hat) / N)
se_hat

# Use `qnorm` to calculate the 95% confidence interval for the proportion of Clinton voters. Save the lower and then the upper confidence interval to a variable called `ci`.
ci <- c(X_hat - qnorm(0.975) * se_hat, X_hat + qnorm(0.975) * se_hat)
