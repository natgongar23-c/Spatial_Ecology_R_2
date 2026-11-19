# code to download external data and upload them to R
setwd()

# eagle satellite: ozonein antartica 
# Linux
setwd("~/Downloads")

# Mac
setwd("/Users/ducciorocchini/Downloads")
# Mac users can also make use of the tilde ~
setwd("~\Downloads")

# Windows: \ in the path, the correct one is the slash! /
setwd("c://....../Downloads")

# Check your working directory
getwd()

# Importing the image
ozone <- rast("ozone_geos5_20260918_hires.jpg")
ozone

# Plot the image
ozone <- flip(ozone)
plotRGB(ozone, 1, 2, 3, stretch="lin")
plotRGB(ozone, 1, 3, 2, stretch="lin")
plotRGB(ozone, 3, 1, 2, stretch="lin")


# https://zenodo.org/records/24343819 (drone photos)

setwd("C:/Users/ogarc/Desktop/Spatial EcoR")
getwd("C:/Users/ogarc/Desktop/Spatial EcoR")
# C:\Users\ogarc\Desktop\Spatial EcoR> no <

# group photo
gp <- rast("DJI_20261118105938_0002_D (1).jpg")
plot(gp)

# ndvi group photo
gpndvi <- rast("DJI_20261118105938_0002_F.jpg")
plotRGB(gpndvi, 2, 3, 1, strech="lin")

# plot single layers
im.multiframe(2, 2)
plot(gpndvi[[1]])
plot(gpndvi[[2]])
plot(gpndvi[[3]])

# import several images togather
list.files( path="C:/Users/ogarc/Desktop/Spatial EcoR",
          pattern="DJI_20261118105853_0005",
          full.names=TRUE )   # ptting the path, is the same setwd("C:/Users/ogarc/Desktop/Spatial EcoR")
files <- list.files()
bologna <- rast(files)
library(viridis)
plot(bologna[[2]], col=magma(100))
# q mod master, putting the diff cameras/diff angles of the drone 
#  bologna <- rast(files)
# Error: [rast] extents do not match
# Además: Aviso:
# [rast] unknown extent 
# > library(viridis)
# > plot(bologna[[2]], col=magma(100))
# Error en h(simpleError(msg, call)): 
  error al evaluar el argumento 'x' al seleccionar un método para la función 'plot': objeto 'bologna' no encontrado
# > plot(bologna[[2]])
#Error en h(simpleError(msg, call)): 
  error al evaluar el argumento 'x' al seleccionar un método para la función 'plot': objeto 'bologna' no encontrado
#> 

# Uploding directly from github
# ask ai to change link for r after copy
groupphoto <- rast("https://raw.githubusercontent.com/ducciorocchini/Spatial_Ecology_in_R_2026/main/DJI_20261118105938_0002_D.JPG")
# same for zenodo

# search google earth engine search files and do directly the import to R without rastering individually or download



<<<♠<♠♠
