gen <- odin::odin("odin/example1.R")
mod <- gen()

tt <- seq(0, 14, 0.1)
yy <- mod$transform_variables(mod$run(tt, replicate = 100))

plot(yy$t, yy$N_det, type='l', lwd=2, xlab = "time", ylab = "N")
lines(yy$t, yy$N, lwd=2, col='red', lty=2)

legend('topleft', lty=c(1,2), col=c(1,2), legend = c("Exact solution", "Numerical solution"))