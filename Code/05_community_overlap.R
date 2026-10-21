od# Once we have seen how communities are related to each other in space we can preceed to look how they are related during time

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
# Alternative method: create the time variable from the tiger dataset and use it 
tigertime <- Tiger$Timecirc
densityPlot(tigertime)
# Alternative 2
tigertime <- tiger[4]
densityPlot(tigertime)

# Exercise: select of the rows of the kerinci dataset with the species macaque
macaque <- kerinci[kerinci$Sps=="macaque",]
# check 
head(macaque)
# make sure only macaque species has beeen selected
summary(macaque) #lazy beatiful!!
# ex: densityPlot
densityPlot(macaque$Timecirc)
macaquetime <- macaque$Timecirc
densityPlot(macaquetime)

?overlapPlot
# overlap the two distributions
overlapPlot(tigertime,
            macaquetime,
            linetype=c(1,3),
            linecol=c("cyan3","coral"),
            olapcol="deeppink"
            )

          
            
























