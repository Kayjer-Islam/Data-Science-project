corrupted_heart_dataset <- read.csv(
  "corrupted_heart_dataset.csv",
  header = TRUE,
  na.strings = c("", "NA")
)

dim(corrupted_heart_dataset) 
names(corrupted_heart_dataset) 
head(corrupted_heart_dataset) 
summary(corrupted_heart_dataset) 

heart <- corrupted_heart_dataset 
 original_rows <- nrow(heart) 
 heart <- unique(heart) 
 new_rows <- nrow(heart) 
 cat("Duplicate rows removed:", original_rows - new_rows)


 colSums(is.na(heart)) 
 
 get_mode <- function(x) { 
   names(which.max(table(x))) 
 } 
 heart$age[is.na(heart$age)]          <- median(heart$age, na.rm = TRUE) 
 heart$trestbps[is.na(heart$trestbps)]   <- median(heart$trestbps, na.rm = TRUE)
 heart$chol[is.na(heart$chol)]        <- median(heart$chol, na.rm = TRUE) 
 heart$thalachh[is.na(heart$thalachh)]   <- median(heart$thalachh, na.rm = TRUE)
 heart$oldpeak[is.na(heart$oldpeak)]   <- median(heart$oldpeak, na.rm = TRUE)
 heart$sex[is.na(heart$sex)]     <- get_mode(heart$sex)         
 heart$cp[is.na(heart$cp)]         <- get_mode(heart$cp)    
 heart$fbs[is.na(heart$fbs)]           <- get_mode(heart$fbs) 
 heart$restecg[is.na(heart$restecg)]  <- get_mode(heart$restecg) 
 heart$exang[is.na(heart$exang)]  <- get_mode(heart$exang) 
 heart$slope[is.na(heart$slope)]  <- get_mode(heart$slope) 
 heart$ca[is.na(heart$ca)]  <- get_mode(heart$ca) 
 heart$thal[is.na(heart$thal)] <- get_mode(heart$thal)
 heart$target[is.na(heart$target)]   <- get_mode(heart$target) 
 
 colSums(is.na(heart))

