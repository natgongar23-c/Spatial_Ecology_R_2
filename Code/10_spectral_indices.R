# code to develop 
library(terra)
library(viridis)
library(imageRy)

im.list()
# importing image of matogrosso in 1992- Landsat 5
m1992 <- im.import("matogrosso_l5_1992219_lrg.jpg")
# layers of 1992
# layer 1 = NIR
# layer 2 = red
# layer 3 = green

# ex. put the NIR infrared in a im.plotRGB in the green component
im.plotRGB(m1992, r=2, g=1, b=3, title= "NIRg")
# multigrame NIR ontop red , green etc (you can remove r=, b=, g= )
par(mfrow= c(2,2))
im.plotRGB(m1992, r=2, g=1, b=3, title= "NIRg")
im.plotRGB(m1992, r=1, g=3, b=2)
# NIR on top of the blue
im.plotRGB(m1992, r=2, g=3, b=1, title= "NIRg")

# Calculating DVI in 1992
# NIR layer 1
# red layer 2
nir1992 <- m1992[[1]]
red1992 <- m1992[[2]]
dvi1992 = nir1992 - red1992
plot(dvi1992, col=inferno(100))
dev.off()

# Why the image is rangung from 0 to 156?
# see the "reflectance presentation on virtuale"
# 8 bit= 256 RADIOMETRIC RESOLUTION

# types:
# Spatial
# Spectral
# temporal
# radiometric

# imporing the recent image
# make the list
im.list()
# aster image
m2006 <- im.import("matogrosso_ast_2006209_lrg.jpg")

# ex: multiframe with two images in RGB
par(mfrow= c(1,2))  # im.multiframe(2,2) tambien 
im.plotRGB(m1992, r=2, g=1, b=3)
im.plotRGB(m2006, r=2, g=1, b=3)

# ex. NIR on blue component
par(mfrow= c(1,2)) 
im.plotRGB(m1992, r=2, g=3, b=1)
im.plotRGB(m2006, r=2, g=3, b=1)

# DVI of 2006
nir2006 <- m2006[[1]]
red2006 <- m2006[[2]]
dvi2006 = nir2006 - red2006
plot(dvi2006, col=inferno(100))

# multiframe DVI 2006 beside 2006
par(mfrow= c(1,2))
plot(dvi1992, col=inferno(100), main= "DVI 1992")
plot(dvi2006, col=inferno(100), main= "DVI 2006")

# DVI with different number of bits (different number resolutions)

# 8 bit
# range of DVI
# max: NIR=255, RED= 0, DVI= 255-0=255
# min: DVI= -255
# range of dvi: -255 - 255

# 4 bit
# range of DVI
# max: NIR=15, RED= 0, DVI= 15-0= 15
# min: NIR= 0, RED=15, DVI= -15
# range of dvi: -15 - 15

# SOLUTION: NDVI
NDVI= DVI / (NIR + RED)
# 8 bit
# Max: 
# NDVI= (255-0) / (255+0) = 1
# Min:
# NDVI= (0-255) / (0 + 155)= -1
# Range NDVI 8 bits: -1 - 1
# 4 bit
# Max: 
# NDVI= (15-0) / (15+0) = 1
# Min:
# NDVI= (0-15) / (0 + 15)= -1
# Range NDVI 4 bits: -1 - 1


# Ex: calculate the range of NDVI with a 3 bits image
# 3 bit
# Max: 
# NDVI= (7-0) / (7+0) = 1
# Min:
# NDVI= (0-7) / (0 + 7)= -1
# Range NDVI 3 bits: -1 - 1

# REMEMBER THIS IF WE COMPARE IMAGES WITH DIFFERENT BITS, USE NDVI

# NDVI
ndvi1992= dvi1992 / (nir1992 + red1992)
plot(ndvi1992, col=inferno(100))

ndvi2006= dvi2006 / (nir2006 + red2006)
plot(ndvi2006, col=inferno(100))




# Simple way to calculate NDVI
ndvi2006 <- im.ndvi(m2006, 1, 2)
ndvi1992 <- im.ndvi(m1992, 1, 2)
plot(ndvi2006)
plot(ndvi1992)

# Classification




