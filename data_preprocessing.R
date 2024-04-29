#import the dataset
dataset = read.csv('.csv')

#Split dataset into Learning and Test dataset
library(caTools)
set.seed(123)

#assigns TRUE/FALSE values to rows from dataset
split = sample.split(dataset$Salary, SplitRatio <- 0.8)
#TRUE values are trainig values
training_set = subset(dataset, split == TRUE)
#FALSE values are test values
test_set = subset(dataset, split == FALSE)

#FEATURE SCALING
training_set <- scale(training_set)
test_set <- scale(test_set)