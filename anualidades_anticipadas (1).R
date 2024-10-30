#Se presentan las funciones del tema de ANUALIDADES ANTICIPADAS
#Autor: Lic. C. Yaxiri Lopez G.
#V 2.0: 29 de octubre de 2024. 



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
tasa_valor_futuro <- function(F, A, n) {
  f <- function(i) valor_futuro(A, i, n) - F
  uniroot(f, c(0, 1))$root  
}




# Tasa del periodo, conociendo valor futuro, número de pagos y monto de la anualidad, con Newton-Raphson:
tasa_valor_futuro_NR <- function(F, A, n, tol = 1e-6) {
  i <- 0.05
  repeat {
    i_new <- i - (valor_futuro(A, i, n) - F) / (A * ((1 + i)^(n-1)) * n)
    if (abs(i_new - i) < tol) break
    i <- i_new
  }
  i
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
tasa_valor_presente <- function(P, A, n) {
  f <- function(i) valor_actual(A, i, n) - P
  uniroot(f, c(0, 1))$root  # Método uniroot
}


# Tasa del periodo, conociendo valor actual, número de pagos y monto de la anualidad, con Newton-Raphson:
tasa_valor_presente_NR <- function(P, A, n, tol = 1e-6) {
  i <- 0.05
  repeat {
    i_new <- i - (valor_actual(A, i, n) - P) / (-A * (1 + i)^(-n) * n)
    if (abs(i_new - i) < tol) break
    i <- i_new
  }
  i
}



