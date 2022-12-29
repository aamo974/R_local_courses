beads <- rep(c("red","blue"), time = c(2,3))

B <- 10000
events  <- replicate(B, sample(beads, replace = TRUE))
tab <- table(events)

prop.table(tab)