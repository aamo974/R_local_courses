library(gtools)
library(tidyverse)

runners <- c("Usain Bolt","Yohan Blake","Warren Weir","Runner 4","Runner 5", "Runner 6","Runner 7","Runner 8")
medals <- c("Gold","Silver","Bronze")

ranking <- expand.grid(medal = medals, runner = runners)
ranking <- paste(ranking$runner, ranking$medal)

combinations()
