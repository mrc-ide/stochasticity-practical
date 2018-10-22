gen <- odin::odin("odin/example4.R")
mod <- gen()

tt <- seq(0, 600)
yy <- mod$transform_variables(mod$run(tt, replicate = 100))

rowSums(yy$I > 0) > 0

matplot(yy$t, yy$I, type = "l", col = "#00000055", lty = 1, lwd = 0.5)
lines(yy$t, yy$I_det[, 1], col = "red", lwd = 2)
lines(yy$t, rowMeans(yy$I), col = "blue", lwd = 2)

lines(yy$t, rowMeans(yy$I), col = "blue", lwd = 2)


f <- function(N, n_rep, generator) {
  mod <- generator(N = N, beta = 0.5, nu = 0.3, I0_at_steady_state = 1)
  y <- mod$transform_variables(mod$run(c(0, 600), replicate = n_rep))
  mean(y$I[2, ] == 0)
}

n <- seq(10, 150, by = 10)
y <- vapply(n, f, numeric(1), 1000, gen)
plot(y ~ n, type = "l")

## Ingredients:
##
## 1. parameter to change
## 2. range and number of steps, possibly on log scale
## 3. some sort of overall summary function, ideally this comes from the model
