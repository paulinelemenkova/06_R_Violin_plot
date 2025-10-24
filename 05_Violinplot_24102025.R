# Libraries
library(tidyverse)
library(ggplot2)
library(dplyr)
library(forcats)
library(readr)

df <- read_csv("FAOSTAT_GPI.csv")
head(df)

p<- ggplot(df, aes(Value, Item)) +
    geom_violin(width=1.5, size=0.1, aes(fill = factor(Item)), alpha = 0.8, trim = F) +
    geom_boxplot(width=0.2, size=0.2, color="purple", alpha=0.3) +
    labs(title = "Gross per Capita Production (GCP) Index for India (2000-2023)", x = "Value (index)", y = "Products") +
    scale_x_continuous(labels = function(x) format(x, scientific = F, digits = 1)) +
    scale_alpha_continuous() +
    theme_grey() +
    theme(legend.position = "bottom")
p
