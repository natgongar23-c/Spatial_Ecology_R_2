#R code for population density

#Instal packages
install.packages("spatstat")

#using the packages
library(spatstat)

# Recall the data
bei

# Looking at the points in space
plot(bei, pch=15)

#decrasig dimension
plot(bei, pch=15, cex=.5)

# drivers
bei.extra

# Plotting variables
plot(bei.extra)

# Subsetting a dataset:
# There are two methots to make a subset:
# first: name of the variable and the $ symbol
# second: number of the layer and [] for tables, [[]] for map layers

elevation <- bei.extra$elev
plot(elevation)

# Sebset by the number of the layer/variable
elevation2 <- bei.extra [[1]]
# plot the new object
plot(elevation2)

# In case bei.extra was a table: bei.extra[1]


# CREATING OUR FIRST MAP
densitymap <- density(bai) 
#output
densitymap
# plot the result
plot(densitymap)

# Ploting the points ontop of the density map
points(bei, cex=.5)

#New concep: MULTIFRAME!

#creating a multiframe
par(mfrow=c(1,2))
plot(elevation)
plot(densitymap)

# Exercise: Put elevation map ontop of the densitymap

par(mfrow=c(2,1))
plot(elevation)
plot(densitymap)





