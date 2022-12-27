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

# 
# titanic %>%
#   filter(Fare != 0 & !is.na(Fare)) %>%
#   ggplot(aes(Survived, Fare, color = Survived)) +
#   geom_boxplot() +
#   # theme(axis.text.x = element_text(angle = 90, hjust = 1)) +
#   geom_point() +
#   geom_jitter(width = 0.1, alpha = 0.2) +
#   scale_y_continuous(trans = "log2")
# 
# titanic %>%
#   filter(!is.na(Pclass)) %>%
#   ggplot(aes(Pclass, fill = Survived)) +
#   geom_bar(position = position_dodge()) + 
#   facet_grid(.~Pclass)



titanic %>%
  filter(!is.na(Age) & !is.na(Sex) & !is.na(Survived)) %>%
  ggplot(aes(Age, y = ..count.., fill = Survived)) +
  geom_density(alpha = 0.2) +
  facet_grid(Pclass ~ Sex)



