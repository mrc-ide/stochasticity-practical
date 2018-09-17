# NB Differential equation implementation only

N_exact <- function(TIME){ 
  ## parameters
  r <- 0.5 # Growth rate/week
  s <- 0.3 #	Death rate/week
  N0 <- 1 #	Initial number

  N_exact <- N0*exp((r-s)*TIME)
  
  }

model3 <- odin::odin({
  ## Derivatives
  deriv(N_ODE) <- r*N_ODE-s*N_ODE

  ## Initial conditions
  initial(N_ODE) <- N0

  ## parameters
  r <- 0.5 # Growth rate/week
  s <- 0.3 # Death rate/week
  N0 <- 1 #	Initial number

  config(base) <- "model3"
  
} )

t <- seq(0, 15, 1)
N_ODE <- (model3())$run(t)
plot(N_ODE, xlab = "Time", ylab = "N_ODE", main = "", las = 1)
lines(t, N_exact(t), col='red')
