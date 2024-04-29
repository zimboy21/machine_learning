#import the dataset
dataset <- read.csv('Position_Salaries.csv')
dataset <- dataset[2:-1] #from the second to the last

# #Split dataset into Learning and Test dataset
# library(caTools)
# set.seed(123)
# #assigns TRUE/FALSE values to rows from dataset
# split = sample.split(dataset$Salary, SplitRatio <- 0.8)
# #TRUE values are trainig values
# training_set = subset(dataset, split == TRUE)
# #FALSE values are test values
# test_set = subset(dataset, split == FALSE)

# #FEATURE SCALING (OPTIONAL)
# training_set <- scale(training_set)
# test_set <- scale(test_set)

# REGRESSION MODEL
# CREATE REGRESSOR HERE

#PREDICT NEW POLYNOMIAL RESULT
y_predict <- predict(regressor, data.frame(Level = 6.5))

#VISUALISE REGRESSION MODEL RESULTS
library(ggplot2)
x_grid <- seq(min(dataset$Level), max(dataset$Level), 0.1)
ggplot() +
  geom_point(aes(x = dataset$IndepVar, y = dataset$DepVar),
             colour = 'red') +
  geom_line(aes(x = x_grid, y = predict(regressor, newdata = data.frame(Level = x_grid))),
            colour = 'yellow') +
  ggtitle('Regression Model') +
  xlab('INDEPENDENT VARIABLE') +
  ylab('DEPENDENT VARIABLE')

