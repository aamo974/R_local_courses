library(tidyverse)
library(dslabs)
data(research_funding_rates)


totals <- research_funding_rates %>%
  select(-discipline) %>%
  summarize_all(funs(sum)) %>%
  summarize(yes_men = awards_men,
            no_men = applications_men - awards_men, 
            yes_women = awards_women,
            no_women = applications_women - awards_women)

totals %>% summarize(percent_men = yes_men/(yes_men+no_men),
                     percent_women = yes_women/(yes_women+no_women))


funding_rate <- totals %>%
  summarize(percent_total = 
              (yes_men + yes_women) / (yes_men + yes_women + no_men + no_women)) %>%
  .$percent_total


tibble(awarded = c("no","yes"),
       men = (totals$no_men + totals$yes_men) * c(1 - funding_rate, funding_rate),
       women = (totals$no_women + totals$yes_women) * c(1 - funding_rate, funding_rate))
