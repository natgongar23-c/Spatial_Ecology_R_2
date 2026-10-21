# This code will develop user based functions

function(num1,num2){
  z = num1 + num2
  return(z)
  } 
# x and y are the arguments/ could be num1, num2

# first function
summa <- function(num1,num2){
  z = num1 + num2
  return(z)
  } 
summa(3, 4)

# exercise: built a multiplication of two numbers
function(num1,num2){
  z = num1 * num2
  return(z)
  } 
# Ex: develop your own function to make a sum of three numbers
sumthree  <- function(num1,num2, num3){
  z = num1 + num2 + num3
  return(z)
  } 
# par(mfrow...) 
mf <- function(nx,ny){
  par(mfrow=c(nx, ny))
}

# Putting default values inside functions
mfdef <- function(nx=2,ny=1){
  par(mfrow=c(nx, ny))
  }
mfdef()
plot(3,5)
plot(6,7)
# Using operators to look if the number is positive or negative
amIpositivefunction <- (x){
  if(x>0) 
    print("This number is positive, are you drunk?")
  }
  else{
  print("This number is negative, idiot!")
  }
}
# What about the 0

# if else
amIpositive <- function(x){
  if(x>0){
    print("This number is positive, are you drunk?")
    }
  else if(x<0){
    print("This number is negative, idiot!")  
    }
  else if(x=0){ # mejor no poner directamente lo del cero
    print("Zero non è né negativo né positivo") 
    }
  }
  # Developing for loops

  function(){
    for (i in 1:10) 
  
  loop <- function(){
  for (i in 1:10) {
    print(i)
    }
  }
  
# Ex: develop a loop will print 13000 numbers from 1 to 13000
  loop <- function(){
  for (i in 1:13000) {
    print(i)
    }
  } 

# Loop with an operation inside
    loop2 <- function(){
    for (i in 1:10) {
      multi <- i*4
      print(multi)
    }
  }
loop2()

# Make a loop with the power operator
loop3 <- function(){
    for (i in 1:10) {
      op <- i ^ 4
      print(op)
    }
  }
# Making an output
sink("numbers.txt")
loop2()

getwd()















<<<<<·¼
