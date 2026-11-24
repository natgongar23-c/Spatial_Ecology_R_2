# code to estimate spatial variability of an image
library(terra)
library(imageRy)
library(viridis)
# listing data
im.list()
# importing the data
sent <- im.import("sentinel.png")
# layer 1 # NIR
# LAYER 2 # red
# layer 3 # green

# ex: plot RGB the image putting NIR onyop of the green component
#?im.plotRGB
im.plotRGB(sent, 2, 1, 3)

# ex. make the same plot with the terra: plotRGB function
plotRGB(sent, 2, 1, 3, strech="lin") # linear streching
# measure the mean: univariate statistics
# moving windows
?focal
meanNIR <- focal(sent[[1]], w=3, fun="mean")
plot(meanNIR)
# ex. plot the original NIR band beside the meanNIR
im.multiframe(1, 2)
plot(sent[[1]])
plot(meanNIR)
# other manner: create a stack
stackNIR <- c(sent[[1]], meanNIR) 
# ex. calculate the mean of the NIR with moving windows of 7*7 pixels
meanNIR7 <- focal(sent[[1]], w=7, fun="mean")
# ex. plot all together making a stack
stackNIR <- c(sent[[1]], meanNIR, meanNIR7) 
plot(stackNIR)
# ex. make the 13*13 mean, put the stack and plot the stack with the inferno legend
meanNIR13 <- focal(sent[[1]], w=13, fun="mean")
stackNIR <- c(sent[[1]], meanNIR, meanNIR7, meanNIR13) 
plot(stackNIR, col="inferno"(100))


