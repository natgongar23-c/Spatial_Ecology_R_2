# R code can be classifying images to k-means:
#
library(imageRy)
library(terra)

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














