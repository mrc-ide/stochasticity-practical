# NB Differential equation implementation only

model1 <- odin::odin({
  ## Derivatives
  deriv(N_ODE) <- r*N_ODE

  ## Initial conditions
  initial(N_ODE) <- N0

  ## parameters
  r <- 0.5 # Growth rate/week
  N0 <- 5 #	Initial number

  config(base) <- "model1"
  
} )

t <- seq(0, 14, 1)
N_ODE <- (model1())$run(t)
plot(N_ODE, xlab = "Time", ylab = "N_ODE", main = "", las = 1)
