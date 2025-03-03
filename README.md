# Meteorology and Renewable Energy

## Overview
This project explores the relationship between meteorological conditions and renewable energy production. Using a dataset containing weather data and energy production records from 2017 to 2022, we apply multiple linear regression, AIC model selection, and bootstrap methods to predict the maximum daily renewable energy production. The goal is to improve the understanding of how weather variables influence energy generation and to provide insights for optimizing renewable energy management.

## Dataset
- **Source:** Kaggle dataset "Renewable Energy and Weather Conditions"
- **Variables:**
  - **Energy production metrics** (daily maximum energy in Wh)
  - **Meteorological variables:**
    - Global Horizontal Irradiance (GHI)
    - Temperature (°C)
    - Atmospheric pressure (hPa)
    - Relative humidity (%)
    - Wind speed (m/s)
    - Precipitation (rain and snow in mm)
    - Cloud cover percentage
    - Daylight duration
- **Preprocessing steps:**
  - Date extraction and daily aggregation
  - Selection of the daily maximum energy production record
  - Removal of less relevant variables (e.g., "isSun", "SunlightTime.daylength", "weather_type")

## Methodology
1. **Descriptive Analysis**
   - Summary statistics for energy production and meteorological parameters
   - Data visualization (histograms, boxplots, scatter plots)
2. **Correlation Analysis**
   - Identifying relationships between variables (e.g., energy vs. GHI, energy vs. humidity)
   - Visualization using correlation heatmaps
3. **Regression Analysis**
   - Multiple linear regression to model energy production
   - Forward and backward model selection based on AIC criteria
   - Evaluation of model performance (R-squared, F-statistic, residual diagnostics)
4. **Bootstrap Methods**
   - Parametric and non-parametric bootstrapping for model uncertainty estimation
   - Generating histograms for parameter distributions
5. **Prediction and Validation**
   - Comparing model predictions with actual energy production
   - Time series visualization of predicted vs. actual values

## Files in the Repository
- `Meteorologia_i_energies_renovables.R`: R script with data processing, analysis, and model implementation.
- `Meteorologia i energies renovables.pdf`: Project report detailing methodology, results, and conclusions.
- `solar_weather.csv`: Dataset containing meteorological and energy production data.

## Requirements
To run this project, install the following R packages:
```r
install.packages(c("dplyr", "ggplot2", "corrplot", "MASS", "ggpubr"))
```

## Running the Project
1. Clone the repository:
   ```bash
   git clone https://github.com/yourusername/Meteorology-Renewables.git
   ```
2. Open RStudio and load `Meteorologia_i_energies_renovables.R`
3. Run the script step by step to process data, analyze relationships, and generate predictions.

## Results
- The model achieves an **R-squared of 0.597**, explaining 59.7% of the variance in energy production.
- The most influential variables in predicting daily maximum energy production are:
  - **Temperature**: Positive correlation with energy production
  - **Humidity**: Negative correlation with energy production
  - **Global Horizontal Irradiance (GHI)**: High correlation, removed to prevent redundancy
- The predictions follow seasonal trends, with higher energy production in spring and summer and lower production in autumn and winter.
- Bootstrap methods confirm the reliability of the estimated coefficients, providing robust confidence intervals.

## License
This project is open-source and available under the MIT License.

---
**Author:** Nil Farrés Soler


