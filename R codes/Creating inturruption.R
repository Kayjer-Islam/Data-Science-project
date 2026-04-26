
install.packages("tidyverse")   

library(tidyverse)

df <- read_csv("cleaned_merged_heart_dataset.csv")

set.seed(50)

# 1. Introduce missing values in numeric variables
num_cols <- df %>% select(where(is.numeric)) %>% names()
for (col in num_cols){
  idx <- sample(1:nrow(df), size = floor(0.05 * nrow(df)))  # 5% missing
  df[[col]][idx] <- NA
}

# 2. Introduce missing values in categorical variables
cat_cols <- df %>% select(where(~is.character(.) || is.factor(.))) %>% names()
for (col in cat_cols){
  idx <- sample(1:nrow(df), size = floor(0.05 * nrow(df)))
  df[[col]][idx] <- NA
}

# 3. Add duplicates
dup_rows <- df[sample(1:nrow(df), 20), ]
df <- bind_rows(df, dup_rows)

# 4. Add invalid values
df$age[sample(1:nrow(df), 5)] <- c(-5, 140, 200, 0, 300)
df$chol[sample(1:nrow(df), 3)] <- c(1500, -20, 5)
df$trestbps[sample(1:nrow(df), 3)] <- c(300, -10, 999)

# 5. Inconsistent categorical formatting
df$sex[sample(1:nrow(df), 5)] <- c("MALE", "male ", "FEMALE", " female", "X")
df$cp[sample(1:nrow(df), 5)] <- c(" 0", "1 ", "two", "THREE", "unknown")

# 6. Insert outliers
df$thalach[sample(1:nrow(df), 3)] <- c(300, 350, 20)

# Save the corrupted dataset
write_csv(df, "corrupted_heart_dataset.csv")








library(tidyverse)

df <- read_csv("cleaned_merged_heart_dataset.csv")

# Checking column names
print(names(df))

set.seed(50)


# 1. Introducing missing values

num_cols <- df %>% select(where(is.numeric)) %>% names()
cat_cols <- df %>% select(where(~is.character(.) || is.factor(.))) %>% names()

for (col in num_cols){
  idx <- sample(nrow(df), size = floor(0.05 * nrow(df)))
  df[[col]][idx] <- NA
}

for (col in cat_cols){
  idx <- sample(nrow(df), size = floor(0.05 * nrow(df)))
  df[[col]][idx] <- NA
}


# 2. Adding invalid values

if ("age" %in% names(df)) {
  df$age[sample(nrow(df), 5)] <- c(-5, 140, 200, 0, 300)
}

if ("chol" %in% names(df)) {
  df$chol[sample(nrow(df), 3)] <- c(1500, -20, 5)
}

if ("trestbps" %in% names(df)) {
  df$trestbps[sample(nrow(df), 3)] <- c(300, -10, 999)
}

# 3. Adding outliers 

if ("thalach" %in% names(df)) {
  df$thalachh[sample(nrow(df), 3)] <- c(300, 350, 20)
}

# 4. Inconsistent categories

if ("sex" %in% names(df)) {
  df$sex[sample(nrow(df), 5)] <- c("MALE", "male ", "FEMALE", " female", "X")
}

if ("cp" %in% names(df)) {
  df$cp[sample(nrow(df), 5)] <- c("0 ", "1", "two", "Three", "unknown")
}

# 5. Adding duplicates 

dup_rows <- df[sample(nrow(df), 20), ]
df <- bind_rows(df, dup_rows)

write_csv(df, "corrupted_heart_dataset.csv")

cat("Corrupted dataset created successfully!")



















library(tidyverse)

df <- read_csv("cleaned_merged_heart_dataset.csv",
               col_types = cols(.default = "c"))

print(names(df))

set.seed(50)

# 1. Insert Missing Values 
for (col in names(df)) {
 
  idx <- sample(nrow(df), size = floor(0.05 * nrow(df)))
  df[[col]][idx] <- NA
}

# 2. Insert Invalid Values 
if ("age" %in% names(df)) {
  df$age[sample(nrow(df), 5)] <- c("-5", "150", "200", "0", "300")
}

if ("chol" %in% names(df)) {
  df$chol[sample(nrow(df), 3)] <- c("1500", "-20", "0")
}

if ("trestbps" %in% names(df)) {
  df$trestbps[sample(nrow(df), 3)] <- c("300", "-10", "999")
}

# 3. Insert Outliers 

if ("thalach" %in% names(df)) {
  
  df$thalach[sample(nrow(df), 3)] <- c("350", "400", "20")
}

# 4. Inconsistent Categorical Values 

if ("sex" %in% names(df)) {
 
  df$sex[sample(nrow(df), 5)] <- c("MALE", " male", "FEMALE ", "X", "unknown")
}

if ("cp" %in% names(df)) {

    df$cp[sample(nrow(df), 5)] <- c("0 ", "1", "two", "Three", "unknown")
}

# 5. Add duplicates

dup <- df[sample(nrow(df), 20), ]
df <- bind_rows(df, dup)


write_csv(df, "corrupted_heart_dataset.csv")

cat("Corrupted dataset created successfully!")