g <- function(x){x^2}

integrate(g, lower = 0, upper = 2)

integrand <- function(x) {sqr/((x+1)*sqrt(x))}
integrate(integrand, lower = 0, upper = Inf)

