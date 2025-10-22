# Integrating Heterogeneous Data to Address Endemic Diseases in Broiler Production: insights from a Polish case study

This repository contains the R code and analysis pipeline for the paper:"Integrating heterogeneous data to address endemic diseases in broiler production: insights from a Polish case study." 

Project funded by the European Union’s Horizon 2020 research and innovation program under grant agreement No. 101000494 (DECIDE). 

## Study Abstract: 

### Background
Endemic contagious diseases in broilers have a significant impact on production performance. 
However, endemic contagious diseases are multifaceted and complex. They are rarely monitored on a large scale. 
This complexity hinders their mitigation, as timely information about their distribution and knowledge about their impact on production performance is scarce. 
This study aimed to evaluate whether data routinely produced by the Polish broiler industry, the first European meat producer, could be reused to generate knowledge about those diseases 
and provide stakeholders with contextual information to improve their disease management.

### Results
The study reused a high-dimensional dataset collected by a large producer and a veterinary laboratory, which implemented a screening program at the end of the production cycle. 
The dataset covered 115 flocks produced between 2018 and 2023 across Poland. It contained information on production indicators, health indicators, necropsy lesions, and a list of evidence 
of infection or infestation by a diverse range of aetiological agents (bacterial, viral, and Eimeria). 
The screened flocks, despite strong production performance indicators, presented a higher mortality rate and a large diversity of pathogens. 
The cluster analysis enabled the identification of three distinct flock profiles, connecting the observation variables (health, production indicator, necropsy lesions) to the aetiological agents.

### Conclusion
The study is an example of how high-dimensional data produced by the broiler industry can be reused and integrated to create contextual knowledge 
for farmers and veterinarians about endemic contagious diseases. Access to this timely contextual knowledge is essential to enhance disease prevention and management efforts.

## Repository Structure - folder and files

Directory/File | Description
--- | --- 
main.R | Main execution script. Runs the entire analysis pipeline by rendering the three R Markdown files (.Rmd).
Data_1st_integration.Rmd | Data Cleaning & Initial Integration. Prepares files, sets data types, and computes contextual variables (e.g., season, farm type).
Data_pre_factoranalysis.Rmd | Data Description & Clean up. Describes the integrated dataset and prepares variables for the subsequent clustering analysis as defined in the methodology.
MFAandClustering.Rmd | Data Analysis. Executes the clustering analysis (e.g., Multiple Factor Analysis and clustering) to identify flock profiles. Includes a few additional hypothesis.
Reference_Tables/ | Folder containing necessary reference or lookup tables used during the data integration steps.
Data | Required folder for the raw data files (see below).
Analysis | Output folder where the rendered HTML reports and analysis results will be saved.

## Data Access and Preparation

The necessary data files for this analysis are publicly available on Zenodo. Before running the analysis, you must download and prepare these files.

1. Download the Data: Access and download the required data files from the following repository: **10.5281/zenodo.17406208.**
2. Create the Folder: Ensure there is a folder named **Data/** and **Analysis/** in the root directory of this repository.
3. Place Files: The following three .csv files must be placed directly inside the **Data/** folder:

    * Production_20240212A.csv
    * Lab_2024-04-11A.csv
    * Prophylaxis_2024-04-10A.csv
    
The main.R script is configured to read these files from this specific location and execute the analysis by sequentially rendering the three R Markdown files (.Rmd) as HTML reports into the **Analysis/** folder. 


## How to Run the Analysis

### 1. Requirements
The project requires R and several packages (detailed in the main.R file under librairies). 

### 2. Execution

After successfully downloading and placing the data files in the Data/ folder, follow these steps to reproduce the full analysis:

  * Open the R console or RStudio.
  * Set the working directory to the root of this repository.
  * Download the required library packages and their dependencies manually or using  install.packages([name of the package], dependencies = TRUE) function
  * Run the **main.R** script
  * Check outputs once the script ran in the **Analysis/** folder.



