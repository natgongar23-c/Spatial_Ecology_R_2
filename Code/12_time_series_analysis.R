# R code for developing ecosystem monitoring in different times

# Packages
library(terra)
library(imageRy)
library(patchwork)
library(viridis)
# Listing data
im.list()

# European nitrogen
EN01 <- im.import("EN_01.png")
EN01 <- flip(EN01)
plot(EN01)

# Exercise: import and plot the final image
EN13 <- im.import("EN_13.png")
EN13 <- flip(EN13)
plot(EN13)

# Plloting the two situations one ontop of the other thanks to the patchwork package
p1 <- im.ggplot(EN01[[1]])
p2 <- im.ggplot(EN13[[1]])
p1 / p2

# Differencing images
diffEN <- EN01[[1]] - EN13[[1]]
difEN # info on the output
plot(diffEN)

# Plotting everything together
p3 <- im.ggplot(diffEN)
p1 + p2 + p3
#-----------------------------------------------------
# Time serie analysis with several images at a time
# Exercise: import directly in a stack the NDVI data from 2020
ndvi <- im.import("NDVI_2020")

# Ridgeline plots
im.ridgeline(ndvi) # it will appear that the names is the same, so we should put other name for every image

names(ndvi) <- c("02_feb", "05_may", "08_aug", "11_nov")
ndvi
# changing scaleparamiter inside im.ridgeline
im.ridgeline(ndvi, scale=1)
im.ridgeline(ndvi, scale=2)

# changing palette
im.ridgeline(ndvi, scale=2, palette="magma")
# changing direction
im.ridgeline(ndvi, scale=2, palette="magma", direction=-1)
#------------------------------------------------------
# ice melt in greenland
im.list()
# import the stack of greenland data all togather in stack
gr <- im.import("greenland")

# ex. plot only the T of 2000 with the inferno legend from viridis package
plot(gr[[1]], col=inferno(100)) #color is only for ggplot, col for functionss REMEMBER
# ex. 2015
plot(gr[[4]], col=inferno(100))
# difference between 2000 and 2015
dif <- gr[[1]]- gr[[4]]
plot(dif)
# RGB plot with three different layers in time
# on the red = 2000, all of the parts becoming red will have hight levels of temperature in 2000
# on the green= 2005, green is hight T in 2005
# on the blue= 2015, blue is hight T in 2015
im.plotRGB(gr, 1, 2, 4)
im.plotRGB(


  

















  
