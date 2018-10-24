# NB Differential equation implementation only

N_exact <- function(TIME){ 
  ## parameters
  r <- 0.5 # Growth rate/week
  N0 <- 5 #	Initial number

  N_exact <- N0*exp(r*TIME)
  
  }

model2 <- odin::odin({
  ## Derivatives
  deriv(N_ODE) <- r*N_ODE

  ## Initial conditions
  initial(N_ODE) <- N0

  ## parameters
  r <- 0.5 # Growth rate/week
  N0 <- 5 #	Initial number

  config(base) <- "model2"
  
} )

t <- seq(0, 14, 1)
N_ODE <- (model2())$run(t)
plot(N_ODE, xlab = "Time", ylab = "N_ODE", main = "", las = 1)
lines(t, N_exact(t), col='red')
