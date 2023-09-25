# Import necessary libraries
library(shiny)
library(ggplot2)
library(dplyr)

# UI for the Shiny app
ui <- fluidPage(
  titlePanel("Cancer Prevalence in Alabama by County"),
  sidebarLayout(
    sidebarPanel(
      selectInput("county", "Choose a county:", choices = NULL)
    ),
    mainPanel(
      plotOutput("barPlot")
    )
  )
)

# Server logic
server <- function(input, output, session) {
  
  # Load the dataset
  df <- reactive({
    url <- "https://raw.githubusercontent.com/c-susan/datasci_4_web_viz/main/datasets/alabama_PLACES__Local_Data_for_Better_Health__County_Data_2023_release.csv"
    read.csv(url)
  })
  
  # Filter the dataset
  df_cancer <- reactive({
    data <- df()
    filter(data, MeasureId == "BINGE", Data_Value_Type == "Crude prevalence")
  })
  
  # Update county choices dynamically based on dataset
  observe({
    cancer_data <- df_cancer()
    updateSelectInput(session, "county", choices = sort(unique(cancer_data$LocationName)))
  })
  
  # Render the bar plot
  output$barPlot <- renderPlot({
    cancer_data <- df_cancer()
    county_data <- cancer_data[cancer_data$LocationName == input$county, ]
    avg_value <- mean(cancer_data$Data_Value, na.rm = TRUE)
    
    ggplot() +
      geom_bar(data = county_data, aes(x = LocationName, y = Data_Value, fill = LocationName), stat = "identity") +
      geom_hline(aes(yintercept = avg_value), linetype = "dashed", color = "dodgerblue") +
      labs(title = 'Cancer Crude Prevalence',
           y = 'Data Value (Crude prevalence) - Percent',
           x = 'Location (County)') +
      theme(axis.text.x = element_text(angle = 90, hjust = 1)) +
      ylim(0, 30) +
      scale_fill_manual(values = c("lightcoral", "dodgerblue"))
  })
  
}

# Run the Shiny app
shinyApp(ui, server)