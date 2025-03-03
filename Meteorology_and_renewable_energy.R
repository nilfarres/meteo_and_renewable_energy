#-------------------------------------------------------------------------------
#------------------------------- PROJECTE FINAL --------------------------------
#-------------------------------------------------------------------------------

# Establim el directori de treball
setwd("C:/Users/Nil Farrés/Documents/NIL FARRÉS SOLER/UAB/2n curs/2n Semestre/Anàlisi de Dades Complexes/Projecte Final")

# Llegim les dades a analitzar
data <- read.csv("solar_weather.csv")

# Mostrem les primeres files de les dades
head(data)

#Mirem els noms de les variables
colnames(data)

library(dplyr)

# Primer, creem la columna date en el data frame original
data$date <- as.Date(data$Time)

# Després, subconjuntem de nou el data frame per obtenir els màxims diaris
data_max <- data %>% 
  group_by(date) %>% 
  slice_max(Energy.delta.Wh.)

# Eliminem la columna Time
data_max <- data_max %>% select(-Time)

# Mou la columna date al principi
data_max <- data_max %>% 
  relocate(date, .before = Energy.delta.Wh.)

# Eliminem les columnes isSun, SunlightTime.daylength i weather_type, ja que no 
# les considero prou rellevants per l'anàlisi que vull fer.
data_max <- data_max %>% 
  select(-isSun, -SunlightTime.daylength, -weather_type)

print(data_max)

#----------------------------- ANÀLISI DESCRIPTIVA -----------------------------

# Resum estadístic de les dades
summary(data_max)

# Càrrega de la llibreria
library(ggplot2)

#Histograma de l'energia produïda màxima diària
hist(data_max$Energy.delta.Wh., main = "Histograma de l'energia produïda màxima 
     diària", xlab = "Energy.delta.Wh", col = "blue")

# Gràfic de la màxima energia renovable produïda diàriament
ggplot(data_max, aes(x = date, y = Energy.delta.Wh.)) +
  geom_line(color = "blue") +
  labs(title = "Gràfic de la màxima energia renovable produïda diàriament",
       x = "Dia", y = "Energy.delta.Wh")

# Histograma de la Irradiació Solar Horitzontal Global (GHI)
hist(data_max$GHI, main = "Histograma de la Irradiació Solar Horitzontal 
     Global (GHI)", xlab = "GHI", col = "green")

# Gràfic de de la Irradiació Solar Horitzontal Global (GHI) diària quan 
# l'energia produïda és màxima
ggplot(data_max, aes(x = date, y = GHI)) +
  geom_line(color = "green") +
  labs(title = "Gràfic de de la Irradiació Solar Horitzontal Global (GHI) 
       diària quan l'energia produïda és màxima", x = "Dia", y = "GHI")

# Histograma de temperatures
hist(data_max$temp, main = "Histograma de temperatures", 
     xlab = "Temperatura", col = "lightblue")

# Gràfic de la temperatura diària quan l'energia produïda és màxima
ggplot(data_max, aes(x = date, y = temp)) +
  geom_line(color = "lightblue") +
  labs(title = "Gràfic de la temperatura diària quan l'energia produïda és 
       màxima", x = "Dia", y = "Temperatura")

# Histograma de la humitat
hist(data_max$humidity, main = "Histograma de la humitat", 
     xlab = "Humitat", col = "red")

# Gràfic de l'humitat diària quan l'energia produïda és màxima
ggplot(data_max, aes(x = date, y = humidity)) +
  geom_line(color = "red") +
  labs(title = "Gràfic de l'humitat diària quan l'energia produïda és màxima",
       x = "Dia", y = "Humitat")

# Histograma de la pressió atmosfèrica
hist(data_max$pressure, main = "Histograma de la pressió atmosfèrica", 
     xlab = "Pressió atmosfèrica", col = "purple")

# Gràfic de la pressió atmosfèrica diària quan l'energia produïda és màxima
ggplot(data_max, aes(x = date, y = pressure)) +
  geom_line(color = "purple") +
  labs(title = "Gràfic de la pressió atmosfèrica diària quan l'energia produïda
       és màxima", x = "Dia", y = "Pressió atmosfèrica")

# Histograma de la velocitat del vent
hist(data_max$wind_speed, main = "Histograma de la velocitat del vent", 
     xlab = "Velocitat del vent (m/s)", col = "yellow")

# Gràfic de la velocitat del vent diària quan l'energia produïda és màxima
ggplot(data_max, aes(x = date, y = wind_speed)) +
  geom_line(color = "yellow") +
  labs(title = "Gràfic de la velocitat del vent diària quan l'energia produïda 
       és màxima", x = "Dia", y = "Velocitat del vent (m/s)")

# Histograma de pluja a les hores en què la producció d'energia renovable és 
# màxima
hist(data_max$rain_1h, main = "Histograma de pluja a les hores en què la 
     producció d'energia renovable és màxima", xlab = "Pluja (mm)", 
     col = "orange")

# Gràfic de pluja a les hores en què la producció d'energia renovable és
# màxima en funció del temps
ggplot(data_max, aes(x = date, y = rain_1h)) +
  geom_line(color = "orange") +
  labs(title = "# Gràfic de pluja a les hores en què la producció d'energia 
       renovable és màxima en funció del temps", x = "Dia", y = "Pluja (mm)")

# Histograma de neu a les hores en què la producció d'energia renovable és 
# màxima
hist(data_max$snow_1h, main = "Histograma de neu a les hores en què la 
     producció d'energia renovable és màxima", xlab = "Neu (mm)", col = "gray")

# Gràfic de neu a les hores en què la producció d'energia renovable és màxima
# en funció del temps
ggplot(data_max, aes(x = date, y = snow_1h)) +
  geom_line(color = "gray") +
  labs(title = "# Gràfic de neu a les hores en què la producció d'energia 
       renovable és màxima en funció del temps", x = "Dia", y = "Neu (mm)")

# Gràfic de dispersió de "temp" vs "pressure"
ggplot(data_max, aes(x = temp, y = pressure)) +
  geom_jitter(alpha = 0.5, size = 2, width = 0.3, height = 0.3) +
  labs(title = "temp vs pressure", x = "temp", y = "pressure")

# Gràfic de dispersió de "humidity" vs "wind_speed"
ggplot(data_max, aes(x = humidity, y = wind_speed)) +
  geom_jitter(alpha = 0.5, size = 2, width = 0.3, height = 0.3) +
  labs(title = "humidity vs wind_speed", x = "humidity", y = "wind_speed")

# Gràfic de dispersió de "Energy.delta.Wh." vs "wind_speed"
ggplot(data_max, aes(x = Energy.delta.Wh., y = wind_speed)) +
  geom_jitter(alpha = 0.5, size = 2, width = 0.3, height = 0.3) +
  labs(title = "Energy.delta.Wh. vs wind_speed", x = "Energy.delta.Wh.", 
       y = "wind_speed")

# Gràfic de dispersió de "Energy.delta.Wh." vs "GHI"
ggplot(data_max, aes(x = Energy.delta.Wh., y = GHI)) +
  geom_jitter(alpha = 0.5, size = 2, width = 0.3, height = 0.3) +
  labs(title = "Energy.delta.Wh. vs GHI", x = "Energy.delta.Wh.", y = "GHI")

# Diagrama de caixa de la temperatura
boxplot(data_max$temp, data_max = data_max, xlab = "", ylab = "Temperatura",
        main = "Diagrama de caixa de la temperatura", col = "lightblue")

# Diagrama de caixa de la pressió atmosfèrica
boxplot(data_max$pressure, data_max = data_max, xlab = "", 
        ylab = "Pressió atmosfèrica", main = "Diagrama de caixa de la pressió
        atmosfèrica", col = "purple")

# Diagrama de caixa de la humitat
boxplot(data_max$humidity, data_max = data_max, xlab = "", ylab = "Humitat",
        main = "Diagrama de caixa de la humitat", col = "red")

# Diagrama de caixa de la velocitat del vent
boxplot(data_max$wind_speed, data_max = data_max, xlab = "", 
        ylab = "Velocitat del vent", main = "Diagrama de caixa de la 
        velocitat del vent", col = "yellow")

# Diagrama de caixa de la màxima energia diària produïda
boxplot(data_max$Energy.delta.Wh., data_max = data_max, xlab = "", 
        ylab = "Màxima energia diària produïda", main = "Diagrama de caixa 
        de la màxima energia diària produïda", col = "blue")

# Diagrama de caixa de GHI
boxplot(data_max$GHI, data_max = data_max, xlab = "", ylab = "GHI", 
        main = "Diagrama de caixa de GHI", col = "green")

#------------------------- ANÀLISI DE CORRELACIÓ -------------------------------

#Agafem només les dades numèriques.
numeric_data <- data_max[, sapply(data_max, is.numeric)]

#Construïm la matriu de correlació
correlation_matrix <- cor(numeric_data)

# Arrodonim la matriu de correlació a dos decimals
correlation_matrix <- round(correlation_matrix, 2)

# Mostra la matriu de correlació
print(correlation_matrix)

# Gràfic de correlació
library(corrplot)
corrplot(correlation_matrix)

# Matriu de dispersió
pairs(numeric_data)

#------------------------- ANÀLISI DE REGRESSIÓ --------------------------------

# Carreguem el paquet MASS
library(MASS)

# Creem un model de regressió lineal complet amb totes les variables
model_full <- lm(Energy.delta.Wh. ~ ., data = data_max)
summary(model_full)

# Realitzem la selecció de models cap enrere
model_backward <- stepAIC(model_full, trace = TRUE, direction = "backward")

# Creem el model nul (sense predictors)
null_model <- lm(Energy.delta.Wh. ~ 1, data = data_max)

# Realitzem la selecció cap endavant
model_forward <- stepAIC(null_model, scope = list(lower = null_model, 
                                                  upper = model_full), 
                         direction = "forward", trace = TRUE)

# Apliquem stepwise selection
model_stepwise <- step(model_full)

# Creem un model final amb les variables seleccionades, 
# eliminant la variable GHI, que no ens interessa.
model_final <- lm(Energy.delta.Wh. ~ date + temp + pressure +
                    humidity + wind_speed + rain_1h + snow_1h + clouds_all, 
                  data = data_max)

# Resum del model
summary(model_final)

# Calculem els residus del model
residus <- resid(model_final)

# Gràfic de probabilitat normal dels residus: 
# Aquest gràfic es pot utilitzar per verificar la suposició de normalitat
# dels errors.
qqnorm(residus, main = "Gràfic de probabilitat normal dels Residus")
qqline(residus)

#----------------------------- MÈTODES BOOTSTRAP -------------------------------

# Generem valors ajustats (fitted values)
fitted_values <- predict(model_final)

# Generate residuals
resids <- residuals(model_final)

# Generem una nova resposta
new_response <- fitted_values + sample(resids, replace = TRUE)

# Creem new data
new_data <- data_max
new_data$Energy.delta.Wh. <- new_response

# Ajustem el model a les noves dades
new_fit <- lm(Energy.delta.Wh. ~ date + temp + pressure + 
                humidity + wind_speed + rain_1h + snow_1h + clouds_all, 
              data = new_data)


# --- BOOTSTRAP PARAMÈTRIC ---

# Inicialitzem una matriu per emmagatzemar les estimacions dels paràmetres
param_estimates_bparam <- matrix(nrow = 10000, ncol = length(coef(model_final)))

# Bucle Bootstrap paramètric
for(i in 1:10000) {

  # Generem una nova resposta
  new_response <- fitted_values + sample(resids, replace = TRUE)
  

  # Actualitzem les dades
  new_data$Energy.delta.Wh. <- new_response

  # Ajustem el model a les noves dades
  new_fit <- lm(Energy.delta.Wh. ~ date + temp + pressure + 
                  humidity + wind_speed + rain_1h + snow_1h + clouds_all, 
                data = new_data)

  # Emmagatzemem les estimacions dels paràmetres
  param_estimates_bparam[i, ] <- coef(new_fit)

}


# --- BOOTSTRAP NO-PARAMÈTRIC ---

# Initialize a matrix to store parameter estimates
param_estimates_bnoparam <- matrix(nrow = 10000, 
                                   ncol = length(coef(model_final)))

# Bootstrap loop
for(i in 1:10000) {
  
  # Resample data
  new_data <- data_max[sample(nrow(data_max), replace = TRUE), ]
  
  # Fit the model to the new data
  new_fit <- lm(Energy.delta.Wh. ~ date + temp + pressure + 
                  humidity + wind_speed + rain_1h + snow_1h + clouds_all,
                data = new_data)

  # Store parameter estimates
  param_estimates_bnoparam[i, ] <- coef(new_fit)
  
}


# --- HISTOGRAMES PER A CADA PARÀMETRE ESTIMAT ---

library(ggpubr)
library(ggplot2)

# Creem una llista buida per emmagatzemar els histogrames
hist_list <- list()

# Convertim la matriu en un data.frame
df <- as.data.frame(param_estimates_bparam)

# Definim correctament els noms de les columnes
names(df) <- c("Intercept", "date", "temp", "pressure", "humidity",
               "wind_speed", "rain_1h", "snow_1h", "clouds_all")

# Creem un histograma per a cada paràmetre estimat i l'emmagatzema a la llista
for (i in 3:ncol(df)) {
  p <- ggplot(df, aes_string(x = names(df)[i])) +
    geom_histogram(bins = 30, fill = 'blue', color = 'black') +
    labs(title = paste("Distribució Bootstrap de", names(df)[i]),
         x = names(df)[i],
         y = "Freqüència") +
    theme_minimal()
  
  hist_list[[i-2]] <- p
}

# Utilitzem ggarrange per combinar tots els histogrames en un sol gràfic
combined_plot <- ggarrange(plotlist = hist_list, ncol = 4, nrow = 2)

# Mostrem el gràfic combinat
print(combined_plot)


# --- GRÀFIC DE LES PREDICCIONS ---

# Creem un nou dataframe amb les dades originals i les prediccions
prediction_data <- data_max
prediction_data$predicted_energy <- predict(model_final, newdata = data_max)

# Utilitzem ggplot per a dibuixar les dades originals i les prediccions de la 
# màxima energia produïda diàriament.
ggplot(prediction_data, aes(x = date)) +
  geom_line(aes(y = Energy.delta.Wh.), color = "blue") +
  geom_line(aes(y = predicted_energy), color = "red") +
  labs(x = "Dia", y = "Màxima energia produïda",
       title = "Màxima energia produïda diària actual i predita",
       color = "Source") +
  scale_color_manual(values = c("blue", "red"),
                     labels = c("Actual", "Predicted"))
