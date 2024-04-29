#import the dataset
dataset <- read.csv('50_Startups.csv')

#CATEGORICAL DATA ENCODING
dataset$State <- factor(dataset$State,
                        levels <- unique(dataset$State), #c('New York', 'California', 'Florida'),
                        labels <- seq_along(unique(dataset$State))#c(1, 2, 3)
)
#Split dataset into Learning and Test dataset
library(caTools)
set.seed(123)
#assigns TRUE/FALSE values to rows from dataset
split <- sample.split(dataset$Profit, SplitRatio = 0.8)
#TRUE values are trainig values
training_set <- subset(dataset, split == TRUE)
#FALSE values are test values
test_set <- subset(dataset, split == FALSE)

#FIT MULTIPLE LINEAR REGRESSION ON TRAINING SET
regressor <- lm(formula <- Profit ~ .,   #Profit is linear combination of all independent variable
                data <- training_set
)

regressor <- lm(formula <- Profit ~ R.D.Spend + Marketing.Spend,
                data <- training_set
)

#summary(regressor) -> info about coefficients (p_value, significance_level)

#PREDICT TEST RESULTS

y_pred <- predict(regressor, newdata <- test_set)