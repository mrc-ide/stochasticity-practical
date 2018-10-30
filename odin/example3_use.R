gen <- odin::odin("odin/example3.R")
mod <- gen()

tt <- seq(0, 15)

# multiple runs

nsim <- 1000
yy <- mod$transform_variables(mod$run(tt, replicate = nsim))

matplot(yy$t, yy$N, type = "l", col = rgb(0,0,0,0.5), lty = 1, lwd = 0.5, xlab = "time", ylab = "N")
lines(yy$t, yy$N_det[, 1], col = "red", lwd = 2)

# # same thing, on log scale
# matplot(yy$t, yy$N, type = "l", col = rgb(0,0,0,0.5), lty = 1, lwd = 0.5, xlab = "time", ylab = "N", log='y')
# lines(yy$t, yy$N[, 1], col = "red", lwd = 2)

# Estimate average N across runs
N_mean <- apply(yy$N,1,mean) 
lines(yy$t, N_mean, col='blue', lwd=2)

# add legend
legend('topleft', col=c('red', 'blue'), lwd=2, legend=c('Deterministic solution', 'Mean of simulations'))

# Estimate fade-out fraction across runs
fade <- (yy$N >=1)
fade_fraction = 100 - 100*apply(fade, 1, mean)

plot(yy$t, fade_fraction, type='l', xlab='time', ylab='Fraction faded out (%)')
