# first operation
2 + 3

# first object
cecilia <- 2 + 3

# second object
julius <- 4 + 6

cecilia + julius # 2 + 3 + 4 + 6
cecilia*julius
cecilia^julius


#first function c( ) 
matteo <- c(5, 10, 20, 50, 80) #an a array is a set of elements, of mammal species in this case
sum(5,10) #do not put sum ()

elisa <- c(100, 80, 50, 20, 10)  #an a array of human deaths

plot(matteo, elisa)

#changing the point character
plot(matteo, elisa, pch=19)

#caracter exaggeration
plot(matteo, elisa, pch=19, cex=2)

#color
plot(matteo, elisa, pch=19, cex=2, col="blue")

#changing labels
plot(matteo, elisa, pch=19, cex=2, col="blue", xlab="mammals", ylab="number of human deapths", cex.axis=2)

#long fuction
plot(matteo, 
     elisa, 
     pch=19, 
     cex=2, 
     col="blue", 
     xlab="mammals", 
     ylab="number of human deapths", 
     cex.axis=2,
     cex.lab=2)
