library(dslabs)
library(tidyverse)
library(ggplot2)
library(ggthemes)
data(murders)
ds_theme_set()



# p <- ggplot(data = murders)
# p + geom_point(aes(population/10^6,total)) +
#   geom_text(aes(population/10^6, total, label = abb, nudge_x = 3)) + 

# p <- murders %>%
#   ggplot(aes(population/10^6,total,label=abb))
#   geom_point()
# 
# #log base10 scale the x and y axes
# p + geom_point(size = 3) + 
#   geom_text(nudge_x = 0.05) + 
#   scale_x_continuous(trans="log10") +
#   scale_y_continuous(trans="log10")

p <- murders %>% ggplot(aes(population/10^6,total,label=abb))

a <- "take care"
p <- p +  geom_text(nudge_x = 0.075) + 
  scale_x_log10() +
  scale_y_log10() +
  xlab("Population in millions (log scale)") + 
  ylab("Total number of murders (log scale)") + 
  ggtitle("Us Gun Murders in US 2010")  +
  geom_point(aes(col=region), size = 3)  
  
  
r <- murders %>% summarize(rate = sum(total) / sum(population) * 10^6) %>% pull(rate)

p <- p + geom_abline(intercept = log10(r), lty = 2, color = "darkgrey") +
  scale_color_discrete(name = "Region")

p <- p + theme_economist()

print(p)