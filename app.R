#
# This is a Shiny web application template.
# You can run the application by clicking the 'Run App' button above.
#



# Shiny packages
library(shiny)
library(shinydashboard)
library(shinyFiles)
library(shinyWidgets)
library(shinyjs)
library(shinybusy)
library(shinyBS)

# Other packages
library(tidyverse)
library(stringr)
library(gridExtra)
library(forcats)
library(lazyMe)
library(DT)
library(shinyalert)
library(openxlsx)
library(tidyxl)





# Sourcing R/ folder functions
# Not required if App is launched through to "Run App" button

# sapply(list.files("R/", full.names = TRUE), source)


#### SERVER ####

server <- function(input, output, session) {
  DATA <- tidyHikes(openxlsx::read.xlsx("data/Randonnée.xlsx"))
  # values <- list(data = DATA)
  WB <- openxlsx::loadWorkbook("data/Randonnée.xlsx")
  # Reactive values
  values <- reactiveValues(
    data = DATA
  )

  # Server functions
  dashboardServer("dashboard", values)
  #browserServer("browser", values)
}




#### UI ####

# Define UI for application
ui <- dashboardPage(
  # Header
  dashboardHeader(
    title = " "
  ),

  # Sidebar
  dashboardSidebar(
    sidebarMenu(
      # tabs
      menuItem(h2("hikeR"), tabName = "dashboard"#, icon = icon("dashboard", class = "fa")
               )
      # ,
      # menuItem(h2("Historique"), tabName = "browser",
      #          icon = icon("clipboard-list", class = "fa"))
    )
  ),

  # Body
  dashboardBody(
    # Background color
    tags$head(tags$style(HTML('
      .content-wrapper {
        background-color: #fff;
      }

    .dataTable {
        font-family: Bahnschrift, sans-serif;
        font-size: 16px;
    }
    thead th {
        background-color: #2a9d8f;
        color: white;
    }
    tbody tr:nth-child(even) {
        background-color: #AEEAE3;
    }'
    ))),

    # Loading spinner
    useShinyjs(),

    # CSS style sheet to use
    tags$head(
      tags$link(rel = "stylesheet", type = "text/css", href = "style.css")
    ),

    # Tabs body
    tabItems(
      tabItem(tabName = "dashboard", fluidPage(dashboardUi("dashboard")))
      #,
      #tabItem(tabName = "browser", fluidPage(browserUi("browser")))
    )
  )
)




#### RUN APP ####

# Run the application
shinyApp(ui = ui, server = server)
