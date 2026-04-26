library(tidyverse)

heart <- read.csv("cleaned_merged_heart_dataset.csv")

num_cols <- c("age", "trestbps", "chol", "thalach", "oldpeak")

num_cols <- intersect(num_cols, names(heart))

heart[num_cols] <- lapply(heart[num_cols], as.numeric)

if ("target" %in% names(heart)) {
  heart$target <- as.factor(heart$target)
}


library(dplyr)

descriptive_stats <- heart %>%
  group_by(target) %>%
  summarise(
    mean_age = mean(age, na.rm=TRUE),
    median_age = median(age, na.rm=TRUE),
    sd_age = sd(age, na.rm=TRUE),
    
    mean_chol = mean(chol, na.rm=TRUE),
    median_chol = median(chol, na.rm=TRUE),
    sd_chol = sd(chol, na.rm=TRUE),
    
    mean_trestbps = mean(trestbps, na.rm=TRUE),
    median_trestbps = median(trestbps, na.rm=TRUE),
    sd_trestbps = sd(trestbps, na.rm=TRUE)
  )

descriptive_stats



heart$sex <- as.factor(heart$sex)

avg_chol_by_sex <- heart %>%
  group_by(sex) %>%
  summarise(mean_chol = mean(chol, na.rm=TRUE))

avg_chol_by_sex



heart$cp <- as.factor(heart$cp)

variation_thalach_by_cp <- heart %>%
  group_by(cp) %>%
  summarise(
    mean_thalachh = mean(thalachh, na.rm=TRUE),
    sd_thalachh = sd(thalachh, na.rm=TRUE),
    min_thalachh = min(thalachh, na.rm=TRUE),
    max_thalachh = max(thalachh, na.rm=TRUE)
  )

variation_thalach_by_cp
