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






# Sourcing R/ folder functions
# Not required if App is launched through to "Run App" button

# sapply(list.files("R/", full.names = TRUE), source)









#### SERVER ####

server <- function(input, output, session) {
  DATA <- tidyHikes(openxlsx::read.xlsx("data/Randonnée.xlsx"))
  WB <- openxlsx::loadWorkbook("data/Randonnée.xlsx")
  # Reactive values
  values <- reactiveValues(
    data = DATA,
    vecMassif = unlist(str_split(data$Massif, " & ")),
    vecLieu  = unlist(str_split(data$Lieu, ", ")),
    vecCompagnie  = unlist(str_split(data$Compagnie, ", "))
  )

  # Server functions
  dashboardServer("dashboard", values)
  browserServer("browser", values)
}




#### UI ####

# Define UI for application
ui <- dashboardPage(
  # Header
  dashboardHeader(
    title = "My template"
  ),

  # Sidebar
  dashboardSidebar(
    sidebarMenu(
      # tabs
      menuItem("Statistiques", tabName = "dashboard",
               icon = icon("dashboard", class = "fa")),
      menuItem("Historique", tabName = "browser",
               icon = icon("clipboard-list", class = "fa"))
    )
  ),

  # Body
  dashboardBody(
    # Background color
    tags$head(tags$style(HTML('
      .content-wrapper {
        background-color: #fff;
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
      tabItem(tabName = "dashboard", fluidPage(dashboardUi("dashboard"))),
      tabItem(tabName = "browser", fluidPage(browserUi("browser")))
    )
  )
)




#### RUN APP ####

# Run the application
shinyApp(ui = ui, server = server)
