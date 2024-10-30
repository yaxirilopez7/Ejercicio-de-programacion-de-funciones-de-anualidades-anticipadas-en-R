#Se presentan las funciones del tema de ANUALIDADES ANTICIPADAS
#Autor: Lic. C. Yaxiri Lopez G.
#V 3.0: 29 de octubre de 2024. 



# Valor futuro, conociendo la anualidad, tasa de interés del periodo y el número (plazo) de anualidades.
valor_futuro <- function(A, i, n) {
  A * ((1 + i)^n - 1) / i * (1 + i)
  
}





# Anualidad, conociendo valor futuro, tasa del periodo y número de pagos.
anualidad_valor_futuro <- function(F, i, n) {
  F * i / ((1 + i)^n - 1) * (1 / (1 + i))
  
  
}









# Número de pagos o plazo, conociendo valor futuro, número de pagos y tasa del periodo.
num_pagos_valor_futuro <- function(F, A, i) {
  log((F * i) / (A * (1 + i)) + 1) / log(1 + i)
  
}









# Tasa del periodo, conociendo valor futuro, número de pagos y monto de la anualidad, con uniroot:
tasa_valor_futuro_uniroot <- function(F, A, n) {
  objetivo <- function(i) A * ((1 + i)^n - 1) * (1 + i) - F
  uniroot(objetivo, lower = 0, upper = 1)$root
}




# Tasa del periodo, conociendo valor futuro, número de pagos y monto de la anualidad, con Newton-Raphson:
tasa_valor_futuro_newton <- function(F, A, n, tol = 1e-7, max_iter = 100) {
  i <- 0.1  # Valor inicial
  for (iter in 1:max_iter) {
    f <- A * ((1 + i)^n - 1) * (1 + i) - F
    f_prime <- A * (n * (1 + i)^(n - 1) * (1 + i) + (1 + i)^n)
    i_new <- i - f / f_prime
    if (abs(i_new - i) < tol) return(i_new)
    i <- i_new
  }
  stop("Newton-Raphson no converge")
}




# Valor actual, conociendo la anualidad, tasa de interés del periodo y el número (plazo) de anualidades.
valor_actual <- function(A, i, n) {
  A * (1 - (1 + i)^(-n)) / i * (1 + i)
  
}





# Anualidad, conociendo valor actual, tasa del periodo y número de pagos.
anualidad_valor_presente <- function(P, i, n) {
  P * i / (1 - (1 + i)^(-n)) * (1 / (1 + i))
  
}




# Número de pagos o plazo, conociendo valor actual, número de pagos y tasa del periodo.
num_pagos_valor_presente <- function(P, A, i) {
  -log(1 - (P * i) / (A * (1 + i))) / log(1 + i)
  
}





# Tasa del periodo, conociendo valor actual, número de pagos y monto de la anualidad, con uniroot:
tasa_valor_presente_uniroot <- function(P, A, n) {
  objetivo <- function(i) A * (1 - (1 + i)^-n) * (1 + i) - P
  uniroot(objetivo, lower = -1, upper = 1)$root
}


# Tasa del periodo, conociendo valor actual, número de pagos y monto de la anualidad, con Newton-Raphson:
tasa_valor_presente_newton <- function(P, A, n, tol = 1e-7, max_iter = 100) {
  i <- 0.1  # Valor inicial
  for (iter in 1:max_iter) {
    f <- A * (1 - (1 + i)^-n) * (1 + i) - P
    f_prime <- A * ((n * (1 + i)^(-n - 1)) * (1 + i) + (1 - (1 + i)^-n))
    i_new <- i - f / f_prime
    if (abs(i_new - i) < tol) return(i_new)
    i <- i_new
  }
  stop("Newton-Raphson no converge")
}




