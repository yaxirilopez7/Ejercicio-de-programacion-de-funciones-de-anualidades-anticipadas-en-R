# Ejercicio-de-programacion-de-funciones-de-anualidades-anticipadas-en-R
En este repositorio encontraras las formulas del tema de Anualidades Anticipadas, implementadas en .R, al igual que algunos ejemplos para un mayor entendimiento en su aplicación


Con el siguiente codigo, puede usted cargar las funciones relativas a los calculos solicitadas de Anualidades Vencidas:

```{r}
source("https://raw.githubusercontent.com/yaxirilopez7/Ejercicio-de-programacion-de-funciones-de-anualidades-anticipadas-en-R/refs/heads/main/anualidades_anticipadas%20(3).R")
```

# Valor Futuro (F):

Ejemplo: Un empresario decide ahorrar $5,000 cada mes en una cuenta que le ofrece una tasa de interés del 8% anual, capitalizable mensualmente, para su retiro en 10 años. Calcula el monto futuro al finalizar el periodo.

```{r}
 valor_futuro(A = 5000, i = 0.08 / 12, n = 10 * 12)
```


# Anualidad (A), conociendo el valor futuro (F):

Ejemplo: Un padre quiere reunir $200,000 para los estudios universitarios de su hijo en 5 años. La cuenta de ahorro ofrece una tasa del 6% anual, capitalizable mensualmente. ¿Cuánto debe ahorrar mensualmente de forma anticipada?


```{r}
anualidad_valor_futuro(F = 200000, i = 0.06 / 12, n = 5 * 12)
```


# Número de pagos (n), conociendo el valor futuro (F):

Ejemplo: Un cliente desea acumular $50,000 para un viaje. Puede ahorrar $1,200 cada mes en una cuenta con una tasa del 4% anual, capitalizable mensualmente. Calcula el tiempo que le tomará alcanzar la meta.


```{r}
 num_pagos_valor_futuro(F = 50000, A = 1200, i = 0.04 / 12)
```



# Tasa de Interés con Valor Futuro: 

Para un valor futuro de $10,000, pagos de $100, y 24 periodos, el comando sería:


```{r}
tasa_valor_futuro_uniroot(F = 10000, A = 100, n = 24)
```

```{r}
tasa_valor_futuro_newton(F = 10000, A = 100, n = 24)
```


# Valor Actual (P):

Ejemplo: Un inversionista quiere comprar un bono que requiere pagos mensuales anticipados de $1,000 durante 3 años a una tasa de interés de 5% anual, capitalizable mensualmente. ¿Cuál es el valor actual del bono?


```{r}
valor_actual(A = 1000, i = 0.05 / 12, n = 3 * 12)
```


# Anualidad (A), conociendo el valor presente (P):

Ejemplo: Una persona quiere financiar una casa con un valor de $500,000. La tasa de interés es del 7% anual, capitalizable mensualmente, y quiere pagar en 20 años con pagos mensuales anticipados. ¿Cuál será el monto mensual de los pagos?



```{r}
anualidad_valor_presente(P = 500000, i = 0.07 / 12, n = 20 * 12)
```


# Número de pagos (n), conociendo el valor presente (P):

Ejemplo: Una tienda departamental ofrece una pantalla LED de 55” en $29,900 si se paga de contado. A crédito, se puede comprar mediante abonos mensuales anticipados de $2,000 cada uno. Calcula el número de pagos mensuales necesarios si la tasa de interés es del 30% anual, capitalizable mensualmente.


```{r}
num_pagos_valor_presente(P = 29900, A = 2000, i = 0.30 / 12)
```


# Tasa de Interés con Valor Presente

Para un valor presente de $10,000, pagos de $100, y 24 periodos

```{r}
tasa_valor_presente_newton(P = 10000, A = 100, n = 24)
```
