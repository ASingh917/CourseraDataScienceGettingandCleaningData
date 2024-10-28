run_analysis <- function() {
  # Set the working directory to where the dataset folders are located
  setwd("C:/Users/abhir/Downloads/getdata_projectfiles_UCI HAR Dataset/UCI HAR Dataset")
  
  if (!("reshape2" %in% rownames(installed.packages())) ) {
    stop("Please install required package: reshape2!\n")
  }
  
  library(reshape2)
  
  # Step 1: Merges the training and the test sets to create one data set
  cat("\n")
  cat("Step1: Merges the training and the test set to create one data set.\n")
  
  traindata <- read.table("./train/X_train.txt")
  testdata  <- read.table("./test/X_test.txt")
  joindata  <- rbind(traindata, testdata)
  
  trainlabel <- read.table("./train/y_train.txt")
  testlabel  <- read.table("./test/y_test.txt")
  joinlabel  <- rbind(trainlabel, testlabel)
  
  trainsubject <- read.table("./train/subject_train.txt")
  testsubject  <- read.table("./test/subject_test.txt")
  joinsubject  <- rbind(trainsubject, testsubject)
  
  features <- read.table("./features.txt")
  meanstdindex <- grep("-mean\\(\\)|-std\\(\\)", features[, 2])
  joindatanew <- joindata[, meanstdindex]
  colnames(joindatanew) <- features[meanstdindex, 2]
  colnames(joindatanew) <- gsub("\\(|\\)", "", colnames(joindatanew))
  colnames(joindatanew) <- gsub("-", ".", colnames(joindatanew))
  colnames(joindatanew) <- tolower(colnames(joindatanew))
  
  # Continue with the rest of your code...
}
