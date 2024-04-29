#import the dataset
dataset <- read.csv('Data.csv')

#Split dataset into Learning and Test dataset

#install.packages('caTools')
library(caTools)
set.seed(123)
#assigns TRUE/FALSE values to rows from dataset
split <- sample.split(dataset$Salary, SplitRatio <- 2 / 3)
#TRUE values are trainig values
training_set <- subset(dataset, split <- TRUE)
#FALSE values are test values
test_set <- subset(dataset, split <- FALSE)

#Fitting Linear Regression to the Training set
regressor <- lm(formula <- Salary ~ YearsExperience, #Salary depends on YearsExperience
               data <- training_set)

#> summary(regressor)
#Coefficients -> more stars more significant
#P value -> the lesser the more significant (<5%)

#Predict Test set results
y_pred <- predict(regressor, newdata <- test_set)

#Visualise data
# install.packages('ggplot2')

#Trainig set
library(ggplot2)
ggplot() +
  geom_point(aes(x <- training_set$YearsExperience, y <- training_set$Salary),
             colour <- 'red') +
  geom_line(aes(x <- training_set$YearsExperience, y <- predict(regressor, newdata <- training_set)),
            colour <- 'green') +
  ggtitle('Salary x Experience (Training Set)') +
  xlab('Years Of Experience') +
  ylab('Salary')

#Test set
ggplot() +
  geom_point(aes(x <- test_set$YearsExperience, y <- test_set$Salary),
             colour <- 'red') +
  geom_line(aes(x <- training_set$YearsExperience, y <- predict(regressor, newdata <- training_set)),
            colour <- 'green') +
  ggtitle('Salary x Experience (Test Set)') +
  xlab('Years Of Experience') +
  ylab('Salary')