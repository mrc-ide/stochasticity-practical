r <- user(0.5) # growth rate
N0 <- user(5)  # initial population size


## Deterministic solution; approach to steady state over time
output(N_det) <- N0 * exp(r*t)

## set up ODEs
initial(N) <- N0
deriv(N) <- r * N


