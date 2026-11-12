# R code can be classifying images to k-means:
#
library(imageRy)
library(terra)
library(ggplot2) # install.packages("ggplot2")
# list to the data
im.list()

# ex: import the solar orbit image and assing it to the object called sun
sun <- im.import( "Solar_Orbiter_s_first_views_of_the_Sun_pillars.jpg")

# Classifying
# ?im.classify()
im.classify(sun, num_clusters=3)

# seed 
sunclass <- im.classify(sun, num_clusters=3, seed=42)

# importing data of matogrosso
# ex.: importthe data and giving the name
m1992 <- im.import("matogrosso_l5_1992219_lrg.jpg")
m2006 <- im.import("matogrosso_ast_2006209_lrg.jpg")

#im.multiframe(1, 2)
par(mfrow= c(1,2))
plot(m1992)
plot(m2006)

# flip images towards north
m1992 <- flip(m1992)
m2006 <- flip(m2006)

# Classifying 
m19992class<- im.classify(m1992, num_cluster=2)
# class 1 forest
# class 2 human
m2006class<- im.classify(m2006, num_cluster=2)
# class 1 forest
# class 2 human

# Frequency of pixels attaining to the classes of m1992class
f1992 <- freq(m19992class)
f1992

# Calculating proportions
tot1992 <- ncell(m1992class)
tot1992 
# Exercise: calculate the proportions of the two classes f/t
prop1992 = f1992 / tot1992
prop1992

# Calculating percentages
perc1992 = prop1992 * 100
perc1992

# forest: 83%
# human: 17%

# Repeating the process for m2006class

# Frquency of pixels attaining to the classes of m1992class
f2006 <- freq(m2006class)

# Calculating proportions
tot2006 <- ncell(m2006class)

# Calculate the proportions of the two classes f/t
prop2006 = f2006 / tot2006

# Calculating percentages
perc2006 = prop2006 * 100
perc2006

# human: 55%
# forest: 45%

# Creating a dataframe
class <- c("Forest", "Human")
perc1992 <- c(83, 17)
perc2006 <- c(45, 55)
tabout <- data.frame(class, perc1992, perc2006)
tabout


# Plotting stats
# 1992
ggplot(tabout, aes(x=class, y=perc1992, color=class)) + 
  geom_bar(stat="identity", fill="white")

# Exercise: do the same for 2006
ggplot(tabout, aes(x=class, y=perc2006, color=class)) + 
  geom_bar(stat="identity", fill="white")

# Changing fill color:
# Changing 






# install.packages("patchwork")
# we are gonna use it for plotting togather
# assing plot
p1 <- ggplot(tabout, aes(x=class, y=perc1992, color=class)) + 
  geom_bar(stat="identity", fill="white")
p2 <- ggplot(tabout, aes(x=class, y=perc2006, color=class)) + 
  geom_bar(stat="identity", fill="white")
p1 + p2

# ex. plotting tog
p1 / p2

# CHANGING THE SCALE important: ylim()
p1 <- ggplot(tabout, aes(x=class, y=perc1992, color=class)) + 
  geom_bar(stat="identity", fill="white") + ylim(c(0,100))
p2 <- ggplot(tabout, aes(x=class, y=perc2006, color=class)) + 
  geom_bar(stat="identity", fill="white") + ylim(c(0,100))
p1 / p2

# Removing one legend
p1 <- ggplot(tabout, aes(x=class, y=perc1992, color=class)) + 
  geom_bar(stat="identity", fill="white") +
ylim(c(0,100)) +
theme(legend.position = "none")
p2 <- ggplot(tabout, aes(x=class, y=perc2006, color=class)) + 
  geom_bar(stat="identity", fill="white") + ylim(c(0,100)) + theme(legend.position = "none")
# Using patchwork with satilate data
s1 <- im.ggplot(m1992[[1]])
s2 <- im.ggplot(m2006[[1]])
(s1|s2) /
(p1|p2)

# doing the same with RGB images
rgb1 <- im.ggplotRGB(m1992[[1]])
rgb2 <- im.ggplotRGB(m2006[[1]])
(rgb1|rgb2) /
(p1|p2)









<-
