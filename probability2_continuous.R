library(tidyverse)
library(dslabs)
data(heights)


x <- heights %>% 
  filter(sex=="Male") %>%
  pull(height)

F <- function(a) mean(x <= a)

1 - F(70)


x <- heights %>%
  filter(sex == "Male") %>%
  .$height

n <- length(x)
avg <- mean(x)
s <- sd(x)

simulated_heights <- rnorm(n,avg,s)

tallest <- replicate(10000, {
  simulated_data <- rnorm(800, avg, s)
  max(simulated_data)
})

mean(tallest >= 7*12)

x <- seq(-4,4,length=100)
data.frame(x, f = dnorm(x)) %>%
  ggplot(aes(x,f)) + 
  geom_line()




