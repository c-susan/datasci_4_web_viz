# datasci_4_web_viz
HHA507 / Data Science / Assignment 4 / Web-based Data Visualization Using Shiny and Flask

This repo focuses on web-based data visualization using Shiny and Flask. The dataset used in this repo is a subset taken from the <a href="https://data.cdc.gov/500-Cities-Places/PLACES-Local-Data-for-Better-Health-County-Data-20/swc5-untb/" target="_blank">CDC Health Places</a> dataset and visualized using Shiny on R, shinyapps.io, and Python. It is also visualized with Matplotlib using Flask. 

## This repo contains the following:
+ **datasets** folder containing the datset used in the repo.
+ **python_flask** folder containing the code for visualizing the dataset in a basic Flask application.
+ **shiny_python** folder containing the code for visualizing the dataset using Python's shiny package.
+ **shiny_r** folder containing the codes for visualizing and deploying the dataset using Shiny in R and shinyapps.io
+ **README.md** file containing an overview of the repo. 


## Assignment Reflections
### 1. R's Shiny Visualization
**shinyapp.io link:** https://t9tlf5-susan0chen.shinyapps.io/web-viz/ 

The challenege I encoutered during this part of the assignment was when I tried to deploy the code on shinyapps.io. An error message was shown when I tried to publish my initial R file on shinyapps.io. I created a new file by going to File>New File>Shiny Web App... that created a new file called ```app.r```. I copied the code over from my original file to the file```app.r``, ran the app, and published.deployed it on shinyapps.io. The following was the error message I encountered when deploying using my original file:
```
Error in `checkAppLayout()`:
! Cancelling deployment: invalid project layout.
ℹ Expecting one of the following publication types:
  1. A Shiny app with `app.R` or `server.R` + `ui.R`
  2. R Markdown (`.Rmd`) or Quarto (`.qmd`) documents.
  3. A website containing `.html` and/or `.pdf` files.
  4. A plumber API with `plumber.R` or `entrypoint.R`.
Backtrace:
    ▆
 1. └─rsconnect::deployApp(...)
 2.   └─rsconnect:::appMetadata(...)
 3.     └─rsconnect:::checkAppLayout(appDir, appPrimaryDoc)
 4.       └─cli::cli_abort(...)
 5.         └─rlang::abort(...)
```
### 2. Python's Shiny Visualization
*No significant challenge was encountered in this portion, however, I can to pip install matplotlib in the shell.cloud terminal.*

### 3. Flask with Matplotlib Visualization
*No challenge was encountered in this portion.*
