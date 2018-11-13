r <- user(0.5) # growth rate
N0 <- user(1)  # initial population.

dt <- 1 # 0.01
time <- step * dt

## Deterministic solution
output(N_det) <- N0 * exp(r*time)


## Stochastic solution
initial(N) <- N0

n_birth <- rbinom(N, r * dt)

update(N) <- N + n_birth
output(time) <- TRUE
