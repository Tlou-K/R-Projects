#Load Datasets Packages
library(datasets)

#Load Data
head(mtcars)
head(iris)

#Bar Charts
barplot(mtcars$cyl) # Doesn't work

cylinders <- table(mtcars$cyl)
View(cylinders)
barplot(cylinders)
plot(cylinders)

#Clear environment
rm(list = ls())

#Histogram
#Shape of distribution, Gaps, Outliers, Symmetry
hist(iris$Sepal.Length)
hist(iris$Sepal.Width)
hist(iris$Petal.Length)
hist(iris$Petal.Width)


#View(iris)

#Histogram by group
par(mfrow = c(3, 1))

#Histograms for each species using options

#Sepal Length
hist(iris$Sepal.Length [iris$Species == "setosa"],
     xlim = c(0, 3),
     breaks = 9,
     main = "Sepal Length for Setosa",
     xlab = "",
     col = "red")

hist(iris$Sepal.Length [iris$Species == "versicolor"],
     xlim = c(0, 3),
     breaks = 9,
     main = "Sepal Length for Versicolor",
     xlab = "",
     col = "purple")

hist(iris$Sepal.Length [iris$Species == "virginica"],
     xlim = c(0, 3),
     breaks = 9,
     main = "Sepal Length for Virginica",
     xlab = "",
     col = "blue")

#Sepal Width
hist(iris$Sepal.Width [iris$Species == "setosa"],
     xlim = c(0, 3),
     breaks = 9,
     main = "Sepal Width for Setosa",
     xlab = "",
     col = "red")

hist(iris$Sepal.Width [iris$Species == "versicolor"],
     xlim = c(0, 3),
     breaks = 9,
     main = "Sepal Width for Versicolor",
     xlab = "",
     col = "purple")

hist(iris$Sepal.Width [iris$Species == "virginica"],
     xlim = c(0, 3),
     breaks = 9,
     main = "Sepal Width for Virginica",
     xlab = "",
     col = "blue")

#Petal Length
hist(iris$Petal.Length [iris$Species == "setosa"],
     xlim = c(0, 3),
     breaks = 9,
     main = "Petal Length for Setosa",
     xlab = "",
     col = "red")

hist(iris$Petal.Length [iris$Species == "versicolor"],
     xlim = c(0, 3),
     breaks = 9,
     main = "Petal Length for Versicolor",
     xlab = "",
     col = "purple")

hist(iris$Petal.Length [iris$Species == "virginica"],
     xlim = c(0, 3),
     breaks = 9,
     main = "Petal Length for Virginica",
     xlab = "",
     col = "blue")

#Petal Width
hist(iris$Petal.Width [iris$Species == "setosa"],
     xlim = c(0, 3),
     breaks = 9,
     main = "Petal Width for Setosa",
     xlab = "",
     col = "red")

hist(iris$Petal.Width [iris$Species == "versicolor"],
     xlim = c(0, 3),
     breaks = 9,
     main = "Petal Width for Versicolor",
     xlab = "",
     col = "purple")

hist(iris$Petal.Width [iris$Species == "virginica"],
     xlim = c(0, 3),
     breaks = 9,
     main = "Petal Width for Virginica",
     xlab = "",
     col = "blue")

#Restore graphic parameter
par(mfrow = c(1, 1))

#Scatterplot
#Linear, Spread, Outliers, Correlation

#Univariate
hist(mtcars$wt)
hist(mtcars$mpg)

#Bivariate
plot(mtcars$wt, mtcars$mpg)



#Add options
plot(mtcars$wt, mtcars$mpg,
     pch = 19, #Solid circle
     cex = 1.5, #Make 150% size
     col = "red",
     main = "MPG as a function of Weight of Cars",
     xlab = "Weight(in 1000 pounds)",
     ylab = "MPG")

#Overlaying plots
#increased information density

?lynx
head(lynx)

#Histogram

#Default
hist(lynx)

#Add options
hist(lynx,
     breaks = 14,   #14 bins
     freq = FALSE,  #shows density not freq
     col = "thistle1",
     main = paste("Histogram of Annual Canadian Lynx",
                  "Trappings, 1821-1934"),
     xlab = "Number of Lynx Trapped")

#Add a normal distribution
curve(dnorm(x, mean = mean(lynx), sd = sd(lynx)),
      col = "thistle4",
      lwd = 2,
      add = TRUE)
#Add two kernel density estimators
lines(density(lynx), col = "blue", lwd = 2)
lines(density(lynx, adjust = 3), col = "purple", lwd = 2)

#Add a rug plot
rug(lynx, lwd = 2, col = "grey")

#Summary
#counts, quartiles & mean
summary(iris$Species) #Cat variable
summary(iris$Sepal.Length) #Quant variable
summary(iris) #Entire data frame

#describe
#For quantitative variables only.
#n, mean, sd, median,etc
#picture first, numbers later
p_load(psych)


describe(iris$Sepal.Length) #One quant variable
describe(iris)  #Entire data frame

#selecting cases
#Select by category
hist(iris$Petal.Length[iris$Species == "versicolor"],
     main = "Petal Length: Versicolor")

hist(iris$Petal.Length[iris$Species == "virginica"],
     main = "Petal Length: Virginica")


hist(iris$Petal.Length[iris$Species == "setosa"],
     main = "Petal Length: Setosa")

#Select by value
hist(iris$Petal.Length[iris$Petal.Length < 2],
     main = "Petal Length < 2")

#Multiple selector
hist(iris$Petal.Length[iris$Species == "virginica" & iris$Petal.Length < 5.5],
     main = "Petal Length: Short Virginica")


#data formats
#data types(numeric - int, single, double; character; logical; complex; raw), data structures(vector - 1d array, matrix - 2d/ array - 3+d , data frame - 2d, list - keys & dict)

#Many methods: colon, seq, c, scan & rep

#Importing with rio
rio_ csv <- import("")
rio_ txt <- import("")
rio_ xlsx <- import("")

#Modeling data

#Hierarchical clustering
cars <- mtcars[, c(1:4,6:7, 9:11)]
head(cars)


hc <- cars %>%
  dist %>%
  hclust

plot(hc)

#Add boxes
rect.hclust(hc, k = 8)

#Principal components - less = more i.e, less noise & fewer unhelpful variables in data can translate to more meaning.
#AKA dimensionality reduction
#PCA - two variables, regression, perpendicular distance, collapse, rotate
pc <- prcomp(cars,
             center = TRUE,  #Centers means to 0
             scale = TRUE)  #Sets unit variance
             
#Stats
summary(pc)  #If each variable begins with sd = 1 this one has much as 2.3391
             #others have less than 1 unit of sd which means they are probably not important in the analysis.

plot(pc)

biplot(pc) #big vs small and fast vs slow

#Regression - Use many variable to predict score on one variable
data <- USJudgeRatings
x <- as.matrix(data[-12]) #not including column 12
y <- data[, 12]

reg <- lm(y ~ x)

reg


