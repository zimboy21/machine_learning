#POLYNOMIAL RERESSION

#import the dataset
dataset <- read.csv('Position_Salaries.csv')
dataset <- dataset[2:3] #[2:-1] from the second to the last

#FIT LINEAR REGRESSION
lin_reg <- lm(formula =  Salary ~ ., #Salary depends on everything else
              data = dataset)

#POLYNOMIAL REGRESSION
dataset$Level_2 <- dataset$Level^2 #Level_2 is Level squared =>
dataset$Level_3 <- dataset$Level^3
dataset$Level_4 <- dataset$Level^4
poly_reg <- lm(formula = Salary ~ .,
               data = dataset)

#VISUALISE REGRSEEIONS
library(ggplot2)
ggplot() +
  geom_point(aes(x = dataset$Level, y = dataset$Salary),
             colour = 'red') +
  geom_line(aes(x = dataset$Level, y = predict(lin_reg, newdata = dataset)), #LINEAR
            colour = 'black') +
  geom_line(aes(x = dataset$Level, y = predict(poly_reg, newdata = dataset)), #POLYNOMIAL
            colour = 'blue') +
  ggtitle('Salary x Level') +
  xlab('Level') +
  ylab('Salary')

#PREDICT NEW LINEAR RESULTS
linear_single_level_prediction <- predict(lin_reg, data.frame(Level = 6.5)) #PREDICT SALARY FOR A LEVEL 6.5

#PREDICT NEW POLYNOMIAL RESULT
polynomial_single_level_prediction <- predict(poly_reg, data.frame(Level = 6.5,
                                                                   Level_2 = 6.5^2,
                                                                   Level_3 = 6.5^3,
                                                                   Level_4 = 6.5^4))