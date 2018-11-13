gen <- odin::odin('~/Documents/teaching_etc/StochPractical2018/stochasticity-practical/EXAMPLE2/example2.R')
mod <- gen()

tt <- seq(0, 14)

# one stochastic run - why does this never go above the deterministic solution?
yy <- mod$transform_variables(mod$run(tt))

plot(yy$t, yy$N_det, type='l', lwd=2, xlab = "time", ylab = "N")
lines(yy$t, yy$N)

# multiple runs

nsim <- 100
yy <- mod$transform_variables(mod$run(tt, replicate = nsim))

matplot(yy$t, yy$N, type = "l", col = rgb(0,0,0,0.1), lty = 1, lwd = 0.5, xlab = "time", ylab = "N")
lines(yy$t, yy$N[, 1], col = "red", lwd = 2)

matplot(yy$t, yy$N, type = "l", col = rgb(0,0,0,0.1), lty = 1, lwd = 0.5, xlab = "time", ylab = "N", log='y')
lines(yy$t, yy$N[, 1], col = "red", lwd = 2)

