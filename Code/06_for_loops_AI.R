# Copy paste the previus code (05_community_overlap.R)
# Plot the two densities of the tiger and the macaque one beside
par(mfrow=c(1,2))
densityPlot(tigertime)
densityPlot(macaquetime)
# Draw one density plot for each ith species
for (i in species)
    times <- kerinci$Timecirc[kerinci$Sps == i]
  densityPlot(times, main = i)
}
