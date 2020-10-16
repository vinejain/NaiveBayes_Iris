
## Read the iris data
data <- read.csv("iris_data.csv", stringsAsFactors = T)


## We are required to help the Botanists by designing an algorithm to identify flower types from 4 key measurements. Let us check the flower type or species in our dataset (this is our response variable).
levels(factor(data$Species))

## The remaining four are the independent variables
colnames(data[1:4])

## Let us dig into some univariate statistics to describe the data

## 1. Mising Values
sum(is.na(data$Sepal.Length))
sum(is.na(data$Sepal.Width))
sum(is.na(data$Petal.Length))
sum(is.na(data$Petal.Width))
# We find 1 missing value each in 3 of the 4 independent variables

## 2. Central Tendency Measures
## 2.1. Mean

mean(data$Sepal.Length, na.rm = T)
mean(data$Sepal.Width, na.rm = T)
mean(data$Petal.Length, na.rm = T)
mean(data$Petal.Width, na.rm = T)

## 2.2. Median

median(data$Sepal.Length, na.rm = T)
median(data$Sepal.Width, na.rm = T)
median(data$Petal.Length, na.rm = T)
median(data$Petal.Width, na.rm = T)

## 2.3. Mode

getmode <- function(v) {
  uniqv <- unique(v)
  uniqv[which.max(tabulate(match(v, uniqv)))]
}

result <- getmode(data$Species)
print(result)


## 3. Measures of spread and inter-quartile range
## 3.1. Range

range(data$Sepal.Length, na.rm = T)
range(data$Sepal.Width, na.rm = T)
range(data$Petal.Length, na.rm = T)
range(data$Petal.Width, na.rm = T)

## 3.2. Variance

var(data$Sepal.Length, na.rm = T)
var(data$Sepal.Width, na.rm = T)
var(data$Petal.Length, na.rm = T)
var(data$Petal.Width, na.rm = T)

## 3.3. Minimum

min(data$Sepal.Length, na.rm = T)
min(data$Sepal.Width, na.rm = T)
min(data$Petal.Length, na.rm = T)
min(data$Petal.Width, na.rm = T)

## 3.4. Maximum

max(data$Sepal.Length, na.rm = T)
max(data$Sepal.Width, na.rm = T)
max(data$Petal.Length, na.rm = T)
max(data$Petal.Width, na.rm = T)

## 3.5. Inter Quartile Range

# Plotly boxplots
install.packages("plotly")
library(plotly)
p1 <- plot_ly(data, y = ~Sepal.Length, type = "box")
p1
p2 <- plot_ly(data, y = ~Sepal.Width, type = "box")
p2
p3 <- plot_ly(data, y = ~Petal.Length, type = "box")
p3
p4 <- plot_ly(data, y = ~Petal.Width, type = "box")
p4

p <- plot_ly(data, y = ~Sepal.Length, type = "box") %>%
  add_trace(y = ~Sepal.Width) %>%
  add_trace(y = ~Petal.Length) %>%
  add_trace(y = ~Petal.Width)
p

# Boxplot stats
boxplot.stats(data$Sepal.Length)
boxplot.stats(data$Sepal.Width)
boxplot.stats(data$Petal.Length)
boxplot.stats(data$Petal.Width)

IQR(data$Sepal.Length, na.rm = T)
IQR(data$Sepal.Width, na.rm = T)
IQR(data$Petal.Length, na.rm = T)
IQR(data$Petal.Width, na.rm = T)

quantile(data$Sepal.Length, na.rm = T)
quantile(data$Sepal.Width, na.rm = T)
quantile(data$Petal.Length, na.rm = T)
quantile(data$Petal.Width, na.rm = T)

# Quantile-Quantile plots
qqnorm(data$Sepal.Length, na.rm = T, main = 'Sepal Length')
qqline(data$Sepal.Length, col = "steelblue", lwd = 2)
qqnorm(data$Sepal.Width, na.rm = T, main = 'Sepal Width')
qqline(data$Sepal.Width, col = "steelblue", lwd = 2)
qqnorm(data$Petal.Length, na.rm = T, main = 'Petal Length')
qqline(data$Petal.Length, col = "steelblue", lwd = 2)
qqnorm(data$Petal.Width, na.rm = T, main = 'Petal Width')
qqline(data$Petal.Width, col = "steelblue", lwd = 2)

# Empirical Frequency Distribution Function
plot(ecdf(data$Sepal.Length))
plot(ecdf(data$Sepal.Width))
plot(ecdf(iris$Petal.Length))
plot(ecdf(iris$Petal.Width))

## 4. Qualitative Plots
barplot(table(data$Species))
pie(table(iris$Species))

p <- plot_ly(data, labels = ~Species, type = 'pie') %>%
  layout(title = 'Iris Dataset: Species',
         xaxis = list(showgrid = FALSE, zeroline = FALSE, showticklabels = FALSE),
         yaxis = list(showgrid = FALSE, zeroline = FALSE, showticklabels = FALSE))

p


## What should you do with the missing data?
# Missing data can be treated with either interpolation or removal


# 1. Remove rows with blank values
data <- read.csv("iris_data.csv", stringsAsFactors = T)
data[data==""] <- NA
data <- na.omit(data)

# 2. Impute blanks
data <- read.csv("iris_data.csv", stringsAsFactors = T)
#install.packages("Hmisc")
library("Hmisc")
data$Sepal.Length <- impute(data$Sepal.Length, mean)
data$Sepal.Width <- impute(data$Sepal.Width, mean)
data$Petal.Length <- impute(data$Petal.Length, mean)
data$Petal.Width <- impute(data$Petal.Width, mean)

# Since number of blanks << size of data, we can afford to remove the blanks

## Can you come up with a rules based algorithm to help the botanist?
## Naive Bayes Classification Approach

# Divide iris dataset into training (70%) and test (30%) datasets 
data$Sepal.Length <- as.numeric(data$Sepal.Length)
data$Sepal.Width <- as.numeric(data$Sepal.Width)
data$Petal.Length <- as.numeric(data$Petal.Length)
data$Petal.Width <- as.numeric(data$Petal.Width)

set.seed(100)
indices = sample(1:nrow(data), 0.7*nrow(data))
train <- data[indices,]
test <- data[-indices,]

train$Sepal.Length <- as.numeric(train$Sepal.Length)
train$Sepal.Width <- as.numeric(train$Sepal.Width)
train$Petal.Length <- as.numeric(train$Petal.Length)
train$Petal.Width <- as.numeric(train$Petal.Width)


# Model development
#install.packages("e1071")
#install.packages("caret")
library(e1071)
library(caret)

model <- naiveBayes(Species ~ ., data = train)
pred <- predict(model, test[,1:4])
confusionMatrix(pred, test$Species)
#  Accuracy : 0.9778  

