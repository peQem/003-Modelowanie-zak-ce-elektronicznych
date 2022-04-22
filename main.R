


# initial -----------------------------------------------------------------

library(tidyverse)
library(forecast)
library(fitdistrplus)



# import file -------------------------------------------------------------

z_term <- read_excel("zestawienie_amplitud_szumowych.xlsx", sheet = "Szum termiczny", 
                     range = cell_limits(c(3, 1), c(NA, 2)), col_names = FALSE)

z_ofdm <- read_excel("zestawienie_amplitud_szumowych.xlsx", sheet = "Zakłócenie od OFDM", 
                     range = cell_limits(c(3, 1), c(NA, 2)), col_names = FALSE)

z_wifi <- read_excel("zestawienie_amplitud_szumowych.xlsx", sheet = "Zakłócenie od WiFi6 _ v1", 
                     range = cell_limits(c(3, 1), c(NA, 2)), col_names = FALSE)


names(z_term) <- c("I", "Q")
names(z_ofdm) <- c("I", "Q")
names(z_wifi) <- c("I", "Q")



# testing on normal data --------------------------------------------------

plot(z_term$I)
plotdist(z_term$I, breaks = 60, histo = TRUE, demp = TRUE)

descdist(z_term$I, boot = 1000)

fw <- fitdist(z_term$I*1000, "norm")

plot(fw)



# wifi --------------------------------------------------------------------


plot(z_wifi$I)
plotdist(z_wifi$I, breaks = 60, histo = TRUE, demp = TRUE)

descdist(z_wifi$I, boot = 1000)

fw <- fitdist(z_wifi$I*1000, "norm")

plot(fw)

summary(fw)
