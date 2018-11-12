beta <- user(0.5) # contact rate
nu <- user(0.3) # recovery
N <- user(100)  # total population.

## Steady-state prevelance
I_star <- N * (beta - nu) / beta

dt <- 1 # 0.01
time <- step * dt

## Deterministic solution; approach to steady state over time
output(I_det) <- I_star / (1 + (I_star / I0 - 1) * exp(-(beta - nu) * time))

I0 <- user(1)
I0_at_steady_state <- user(0)

initial(I) <- if (I0_at_steady_state > 0) round(I_star) else I0

FOI <- beta * I / N
S <- N - I

n_infections <- rbinom(S, FOI * dt)
n_recoveries <- rbinom(I, nu * dt)

update(I) <- I + n_infections - n_recoveries
output(S) <- TRUE
output(time) <- TRUE
