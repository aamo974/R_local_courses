options(digits = 3)    # report 3 significant digits
library(tidyverse)
library(titanic)

titanic <- titanic_train %>%
  select(Survived, Pclass, Sex, Age, SibSp, Parch, Fare) %>%
  mutate(Survived = factor(Survived),
         Pclass = factor(Pclass),
         Sex = factor(Sex))

dat <- titanic %>%
  filter(!is.na(Age) & !is.na(Sex))

# dat %>%
#   ggplot(aes(Age,fill = Sex)) +
#   geom_density(alpha = 0.2)
# 
# 
# titanic %>%
#   ggplot(aes(Age, fill = Sex)) +
#   geom_density(alpha = 0.2) +
#   facet_grid(Sex ~ .)

# params <- titanic %>%
#   filter(!is.na(Age)) %>%
#   summarize(mean = mean(Age), sd = sd(Age))
# 
# 
# titanic %>%
#   filter(!is.na(Age)) %>%
#   ggplot(aes(sample = Age)) +
#   geom_qq(dparams = params) +
#   geom_abline()


# 
# titanic %>%
#   ggplot(aes(Sex, fill = Survived)) + 
#   geom_bar(position = position_dodge())

# 
# titanic %>%
#   ggplot(aes(Age, y = ..count.. , fill = Survived)) +
#   geom_density(alpha=0.2) 
# 


titanic %>%
  filter(Fare == 0 & !is.na(Fare)) %>%
  group_by(Survived) %>%
  ggplot(aes(Fare, color = Survived)) +
  geom_boxplot()