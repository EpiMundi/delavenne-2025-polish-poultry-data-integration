## Header #####################################################################

# 'Title: Analysis of Polish broiler data inside the DECIDE H2020 project

# Author: Camille Delavenne, EpiMundi

# Description: Main script presenting all dependency. Only script to be ran when redoing the analysis to produce the requiered results. 

# Last update date: 2025-08-31

#Directory: Defined by the R project

# R version: 4.0.4

##############################################################################

# Libraries ----------------------------------------------------------
library(tidyr)
library(tidyverse)
library(dplyr)
library(stringr)
library (ISOweek)
library(flextable)
library(ggplot2)
library(lubridate)
library (sf)
library(skimr)
library (webshot) 
library (ggtext)
library (GGally) 
library(ggalluvial)
library (FactoMineR)
library (Factoshiny)
library (factoextra)
library(dendextend)

# Environment ----------------------------------------------------------
rm(list = ls()) 
gc()


# Data preparation -------------------------------------------------------
data_production <- read.csv("Data/Production_20240212A.csv")  
data_lab <- read.csv("Data/Lab_2024-04-11A.csv" ) 
data_prophylaxis<- read.csv("Data/Prophylaxis_2024-04-10A.csv" ) 


# Reference tables for data analysis ------------------------------------------------------

## Provided reference
code_ATB<- read.csv("Data/ReferenceTables/ATB_code.csv" , header = TRUE, fileEncoding = 'UTF-8-BOM') %>%  mutate (Code = as.factor (Code))
code_microorganism<- read.csv("Data/ReferenceTables/Microorganism_code.csv" , header = TRUE, fileEncoding = 'UTF-8-BOM')   %>%  mutate (Code = as.factor (Code))

## Created reference
Lesion_cleaned2 <- read.csv("Data/ReferenceTables/necropsy_lesions_ungrouped_cleaned.csv" , header = TRUE) %>% filter (Sample_definition != "")
reference_ATB <-read.csv ("Data/ReferenceTables/ATB_reference.csv" , header = TRUE, fileEncoding = 'UTF-8-BOM')
reference_Vaccin <-read.csv ("Data/ReferenceTables/Vaccin_clean.csv" , header = TRUE) 
reference_Sero <-read.csv ("Data/ReferenceTables/serology_test_reference.csv" , header = TRUE) 
plot.dim12name <-read.csv("Data/ReferenceTables/Plotfigurename.csv", header = TRUE)

# Data cleaning ----------------------------------------------------

## Preparing files for data integration by setting types and preparing a few contextual variables ( such as season, farm type, etc...)
rmarkdown::render(file.path ("Data_1st_integration.Rmd"),output_file=(paste0("Analysis/integration_ok",Sys.Date(),".html")), quiet = TRUE )

## Data sets description and cleaning up all variables for factorial analysis
rmarkdown::render(file.path ("Data_pre_factoranalysis.Rmd"),output_file=(paste0("Analysis/Analysis_prefactoranalysis_",Sys.Date(),".html")), quiet = TRUE )

# Data Analysis----------------------------------------------------

## Clustering analysis
rmarkdown::render(file.path ("MFAandClustering.Rmd"),output_file=(paste0("Analysis/MFAandClustering_",Sys.Date(),".html")), quiet = TRUE )

## Main outputs----------------------------------------------------
write.csv2(table1B, paste0("Analysis/ClusterresultsqualiStudy",".csv"))
write.csv2(table2B, paste0("Analysis/ClusterresultsquantiStudy",".csv"))
write.csv2(res.HCPC1full[["data.clust"]], paste0("Analysis/Clusterresultsall",".csv"))




