entree <- seq(1,6)
side <- seq(1,6)
drink <- seq(1,2)

entree <- 6
side <- nrow(combinations(6,2))
drink <- 3

entree * side * drink


entrees <- function(n){
  total <- n * side * drink
}

sides <- function(n) {
  total <- entree * nrow(combinations(n,2)) * drink
}


results <- sapply(seq(2,12), sides)