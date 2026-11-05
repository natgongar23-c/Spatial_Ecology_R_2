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
