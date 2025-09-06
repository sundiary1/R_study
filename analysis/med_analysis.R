library(here)
library(dplyr)
library(lavaan)
library(bruceR)
library(correlation)
library(tidyverse)

df=import(here("data","数据.sav"))

med_model <- "
  SWA_SUM ~ c*SVA_SUM
  AC_SUM ~ a*SVA_SUM
  SWA_SUM ~ b*AC_SUM
  ab := a*b
  total := c + (a*b)
"

fit <- sem(med_model, data = df, bootstrap = 1000)
summary(fit, standardized = TRUE)
test