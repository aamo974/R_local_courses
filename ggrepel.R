  library(dslabs)
  library(ggplot2)
  library(ggthemes)
  library(ggrepel)
  library(tidyverse)
  library(gridExtra)
  
  ### First define the slope of the line
  # r <- murders %>%
  #   summarize(rate = sum(total) / sum(population) * 10^6) %>% .$rate
  # 
  # murders %>%
  #   ggplot(aes(population/10^6, total, label = abb)) +
  #   geom_abline(intercept = log10(r), lty = 2, color = "darkgrey") +
  #   geom_point(aes(col = region), size = 3) +
  #   geom_text_repel() +
  #   scale_x_log10() +
  #   scale_y_log10() +
  #   xlab("Population in millions (log scale)") +
  #   ylab("Total number of murders (log scale)") +
  #   ggtitle("US Gun Murders in 2010") +
  #   scale_color_discrete(name = "Region") +
  #   theme_economist()
  
  data(heights)
  
  p <- heights %>%
    group_by(sex) %>%
    # filter(sex == "Male") %>%
    ggplot(aes(x = height))
  
  #HISTOGRAM 
  # p <- p + geom_histogram(binwidth = 1, fill = "blue", col = "black") +
  #   xlab("Male height in inches") + 
  #   ggtitle("Histogram")
  
  #DENSITY 
  p <- p + geom_density(fill="blue", alpha = 0.2)
  
  #MULTI HISTOGRAM
  # p <- heights %>% filter(sex == "Male") %>% ggplot(aes(x = height))
  # p1 <- p + geom_histogram(binwidth = 1, fill = "blue", col = "black")
  # p2 <- p + geom_histogram(binwidth = 2, fill = "blue", col = "black")
  # p3 <- p + geom_histogram(binwidth = 3, fill = "blue", col = "black")
  
  # arrange plots next to each other in 1 row, 3 columns
  # grid.arrange(p1, p2, p3, ncol = 3)
  print(p)