

# initial -----------------------------------------------------------------

library(tidyverse)
library(forecast)

install.packages("forecast")

# import file -------------------------------------------------------------

z_term <- read_excel("zestawienie_amplitud_szumowych.xlsx", sheet = "Szum termiczny", 
                     range = cell_limits(c(3, 1), c(NA, 2)), col_names = FALSE)

z_ofdm <- read_excel("zestawienie_amplitud_szumowych.xlsx", sheet = "Zakłócenie od OFDM", 
                     range = cell_limits(c(3, 1), c(NA, 2)), col_names = FALSE)

z_ofdm <- read_excel("zestawienie_amplitud_szumowych.xlsx", sheet = "Zakłócenie od OFDM", 
                     range = cell_limits(c(3, 1), c(NA, 2)), col_names = FALSE)


names(z_term) <- c("I", "Q")

plot(z_term$I)

acf(z_term$I)
