qexp <- function(phi, b) {
    function(delay) 1 - (1 - phi) * exp(-b * delay)
}

qgom <- function(phi, b) {
    function(delay) exp(log(phi) * exp(-b * delay))
}

