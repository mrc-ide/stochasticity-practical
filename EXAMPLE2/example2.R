r <- user(0.5) # growth rate
N0 <- user(1)  # initial population.

dt <- 1 # 0.01
time <- step * dt

## Deterministic solution; approach to steady state over time
output(N_det) <- N0 * exp(r*time)

initial(N) <- N0

n_birth <- rbinom(N, r * dt)

update(N) <- N + n_birth
output(time) <- TRUE
