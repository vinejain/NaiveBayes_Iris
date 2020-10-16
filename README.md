

Vineet Jain

*vineetjain.org@gmail.com*





} Task is to design an algorithm in order to help botanists identify flower types from 4 key

measurements

} Data provided is structured in nature, and comprises of **150 rows** and **5 columns**

} All 150 datapoints are tagged with appropriate class which could be fed into a supervised

learning classification model for future use of class prediction

Independent variables (numeric)

Dependent variable (categorical)

Missing data (blanks)





} Summary statistics

**Statistic**

**Sepal Length Sepal Width**

**Petal Length**

**Petal Width**

Mean

5.85

5.8

0.67

4.4

7.9

1

3.06

3

3.75

4.3

3.13

1

1.19

1.3

0.58

0.1

2.5

0

Median

Variance

Min

0.18

2.2

4.4

1

Max

6.9

1

Missing Values

Outliers

0

2

0

0





} Boxplots below show the **spread** of the data and the **outliers**

Max

Upper Quartile

Median

Lower Quartile

Min

Outliers

Sepal Length

Sepal Width

Petal Length

Petal Width





} QQ plot (or quantile-quantile plot) draws the correlation between the **data variables** and the

**normal distribution**





} Missing data can be treated with either **removal** or **interpolation**

◦ **Removal**

◦ Replace blanks with NA

◦ Use built-in function to remove rows with at least 1 NA

◦ **Imputation**

◦ Use built-in function in R to impute missing value with mean of the previous and next values





} Identifying the flower type in our case, is a non-binary classification task (as there are three

classes in the response variable – setosa, virginica and versicolor)

} We used supervised learning classification model called Naïve Bayes

} Naïve Bayes is a probabilistic classifier which returns the probability of a test point belonging to a

class rather than the label of the test point

} Bayes Theorem is defined as

**P(Ci/X) = P(X/Ci) \* P(Ci) / P(X)**

where Ci denotes the classes and X denotes the features of the data point

◦ P(Ci) is known as the prior probability

◦ P(X/Ci) represents the likelihood function

◦ P(Ci/X) is called the posterior probability

◦ P(X), the denominator is just a scaling factor and can be ignored while calculating probabilities

} Dataset was divided into training (70%) and test (30%) datasets

} Model was trained on the train dataset to identify the flower type

} Model was validated against the test dataset

} Model achieved accuracy of **97.78%**





} Accuracy is defined as the percentage of correct predictions

**Accuracy = Correct Predictions/ Total Predictions**

} Specificity measures the proportion of negatives that are correctly identified as negatives. It is

also known as true negative rate.

**Specificity = TN / (TN + FP)**

} Sensitivity measures the proportion of positives that are correctly identified as positives. It is also

known as true positive rate

**Sensitivity = TP / (TP+FN)**

} Model Results in R are displayed below:

