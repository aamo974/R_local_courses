# import data and inspect
library(tidyverse)
library(dslabs)
library(RColorBrewer)
data(us_contagious_diseases)

# str(us_contagious_diseases)

the_disease <- "Measles"

dat <- us_contagious_diseases %>%
  filter(!state %in% c("Hawaii","Alaska") & disease == the_disease) %>%
  mutate(rate = count / population * 10000) %>%
  mutate(state = reorder(state,rate))

#display.brewer.all(type="div")


# dat %>% 
#   ggplot(aes(year,state,fill = rate)) +
#   geom_tile(color = "grey50") +
#   scale_x_continuous(expand = c(0,0)) + 
#   scale_fill_gradientn(colors = brewer.pal(9, "Reds"), trans = "sqrt") +
#   geom_vline(xintercept = 1963, col = "blue", label = "1963") +
#   theme_minimal() + theme(panel.grid = element_blank()) + 
#   ggtitle(the_disease) +
#   ylab("") + xlab("")

avg <- us_contagious_diseases %>%
  filter(disease == the_disease) %>%
  group_by(year) %>%
  summarize(us_rate = sum(count, na.rm = TRUE)/sum(population, na.rm=TRUE)*10000)

dat %>% 
  ggplot() +
  geom_line(aes(year,rate, group = state), color = "grey50", show.legend = FALSE, alpha = 0.2, size = 1) +
  geom_line(mapping = aes(year, us_rate), data = avg, size = 1, col = "black") +
  scale_y_continuous(trans = "sqrt", breaks = c(5,25,125,300)) + 
  scale_fill_gradientn(colors = brewer.pal(9, "Reds"), trans = "sqrt") +
  geom_vline(xintercept = 1963, col = "blue") +
  ggtitle("Cases per 10k by state") +
  ylab("") + xlab("") +
  geom_text(data = data.frame(x=1955, y = 50), mapping = aes(x,y,label = "US average"), color = "black")