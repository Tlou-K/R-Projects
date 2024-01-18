library(datasets)
head(iris)
summary(iris)
plot(iris)

#Clear packages
detach("package:datasets", unload =TRUE)

#Clear plots
dev.off()

#Clear console
cat("\014") #ctrl + L

install.packages("pacman")

#load packages
require(pacman)
library(pacman)

plot(iris$Species) #Categorical variable
plot(iris$Petal.Length) #Quantitave variable
plot(iris$Species, iris$Petal.Width) #Cat x quant
plot(iris$Petal.Length, iris$Petal.Width) #Quant pair
plot(iris) #Entire data frame

data(iris)
#Plot with options
plot(iris$Petal.Length, iris$Petal.Width,
     main = "Iris: Petal Length vs. Petal Width",
     xlab = "Petal Length",
     ylab = "Petal Width",
     col = "#cc0000",
     pch = 19)

#Plot formulas with plot
plot(cos, 0, 2*pi)
plot(exp, 1,5)
plot(dnorm, -3, +3)

#Formula plot with options
plot(dnorm, -3, +3,
     col = "#cc0000",
     lwd = 5,
     main = "Standard Normal Distribution",
     xlab = "z-scores",
     ylab = "Density")

