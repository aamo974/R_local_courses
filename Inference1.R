library(tidyverse)
library(dslabs)
ds_theme_set()

X_hat <- 0.48
se <- sqrt(X_hat * (1-X_hat) / 25)

pnorm(0.01/se) - pnorm(-0.01/se)


