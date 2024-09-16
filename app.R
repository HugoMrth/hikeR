#
# This is a Shiny web application template.
# You can run the application by clicking the 'Run App' button above.
#




#### IMPORTS ####

# Shiny packages
library(shiny)
library(shinydashboard)
library(shinyFiles)
library(shinyWidgets)
library(shinyjs)
library(shinybusy)
library(shinyBS)

# Other packages





# Sourcing R/ folder functions
# Not required if App is launched through to "Run App" button

# sapply(list.files("R/", full.names = TRUE), source)









#### SERVER ####

server <- function(input, output, session) {
  # Reactive values
  values <- reactiveValues(
    x = faithful[, 2]
  )

  # Server functions
  firstTabServer("first_tab", values)
  secondTabServer("second_tab", values)
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
      menuItem("First tab", tabName = "first_tab",
               icon = icon("dashboard")),
      menuItem("Second tab", tabName = "second_tab",
               icon = icon("th"),
               badgeLabel = "new", badgeColor = "green")
    )
  ),

  # Body
  dashboardBody(
    # Loading spinner
    useShinyjs(),
    #add_busy_spinner(spin = "fading-circle"),

    # CSS style
    tags$head(
      tags$link(rel = "stylesheet", type = "text/css", href = "style.css")
    ),

    # Tabs body
    tabItems(
      tabItem(tabName = "first_tab", fluidPage(firstTabUi("first_tab"))),
      tabItem(tabName = "second_tab", fluidPage(secondTabui("second_tab")))
    )
  )
)




#### RUN APP ####

# Run the application
shinyApp(ui = ui, server = server)
