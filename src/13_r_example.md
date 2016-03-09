# Short R example

```r
y <- c(1,4,9,13,10)
x <- c(1,2,3,4, 5 )
xx <- seq(1, 5, length.out=250)

plot(x, y)

fit <- lm(y~x)
label1 <- bquote(italic(R)^2 == .(format(summary(fit)$adj.r.squared, digits=4)))
lines(xx, predict(fit, data.frame(x=xx)))
fnc1 <- bquote(y == .(coef(fit)[[2]]) * x + .(coef(fit)[[1]]))


fit <- lm(y~poly(x,3, raw = TRUE))
label2 <- bquote(italic(R)^2 == .(format(summary(fit)$adj.r.squared, digits=4)))
lines(xx, predict(fit, data.frame(x=xx)))
fnc2 <- bquote(y == .(coef(fit)[[4]]) * x^3 + .(coef(fit)[[3]]) * x^2 + .(coef(fit)[[2]]) * x + .  (coef(fit)[[1]]))

labels <- c(label1, fnc1, label2, fnc2)
legend("topleft", bty="n", legend=as.expression(labels))
```

