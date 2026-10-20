# Once we have seen how communities are related to each other in space we can preceed to look how they are related during time

library(overlap)
# Using the data
data(kerinci) 
kerinci
head(kerinci)
?head

# If youwant to look at the end of data set: tail()
tail(kerinci)

summary(kerinci)

# Circular time 
circulartime <- kerinci$Time * 2 * pi
# Putting the circulare time inside the data set/table
kerinci$Timecirc <- kerinci$Time * 2 * pi

# Subsetting the dataset with the selection of the species tiguer
# dataset[colum of the table dont forguet the , in case there are more colums in the table]
tiger <- kerinci[kerinci$Sps=="tiguer",]
summary(tiguer)

?densityPlot
# density plot of spreading
densityPlot(tiger$Timecirc)
# Alternative
tigertime <- Tiger$Timecirc
densityPlot(tigertime)

