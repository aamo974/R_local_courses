library(gtools)
library(tidyverse)


medals <- permutations(8,3)
nrow(medals)


runners <- c("Jamaica", "Jamaica", "Jamaica", "USA", "Ecuador", "Netherlands", "France", "South Africa")
# runners <- c("Usain Bolt","Yohan Blake","Warren Weir","Runner 4","Runner 5", "Runner 6","Runner 7","Runner 8")
medals <- c("Gold:","Silver:","Bronze:","Fourth:","Fifth:","Sixth:","Seventh:","Eight:")



# ranking <- expand.grid(medal = medals, runner = runners)
# ranking <- paste(ranking$medal, ranking$runner)
# 
# length(ranking)
# cat(paste(ranking), sep="
# ")


B <- 10000
set.seed(1)

results <- replicate(B, {
   podium <- sample(runners,3)
   podium <- all(podium == "Jamaica")
})

