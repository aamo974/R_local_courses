library(tidyverse)
data("esoph")

head(esoph)

str(esoph)

n_groups <- nrow(esoph)
all_cases <- sum(esoph$ncases)
all_controls <- sum(esoph$ncontrols)
total <- all_cases + all_controls

p_cancer <- all_cases/total

alc_high <- esoph %>%
  filter(alcgp == "120+")

alc_high_total <- sum(alc_high$ncases) + sum(alc_high$ncontrols)
p_alc_high <- alc_high_total/total


alc_low <- esoph %>%
  filter(esoph$alcgp == "0-39g/day")

alc_low_total <- sum(alc_low$ncases)+sum(alc_low$ncontrols)
p_alc_low <- alc_low_total/total

tob_high <- esoph %>%
  filter(esoph$tobgp == "30+")

tob_high_total <- sum(tob_high$ncases) + sum(tob_high$ncontrols)
sum(tob_high$ncases)/all_cases
sum(tob_high$ncontrol)/all_controls

(sum(alc_high$ncases) + sum(tob_high$ncases))/all_cases

alc_tob_high <- esoph %>%
  filter(esoph$tobgp == "30+" | alcgp == "120+")

a <- sum(alc_tob_high$ncases)/all_cases
b <- sum(alc_tob_high$ncontrols)/all_controls

alc_high_controls <- sum(alc_high$ncontrols)/all_controls
alc_high_cases <- sum(alc_high$ncases)/all_cases


# sum(tob_high$ncontrols)/all_controls

a/b


