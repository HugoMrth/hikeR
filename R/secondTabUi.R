secondTabui <- function(id) {
  ns <- NS(id)
  tagList(
    fluidRow(
      box(
        title = "Dist Plot", width = 12, status = "primary",

        numericInput(ns("n_bins"), "Number of bins for the histogram", 5, min = 1, max = 100),

        uiOutput(ns("dummyWidget")),

        plotOutput(ns("distPlot"))
      )
    )
  )
}
