dashboardUi <- function(id) {
  ns <- NS(id)
  tagList(
    fluidRow(
      column(width = 4,
             DTOutput(ns("statParAn")),
             DTOutput(ns("statParChaussure"))
      ),
      column(width = 5,
             DTOutput(ns("statParTrek"))
      ),
      column(width = 3,
             DTOutput(ns("statParMassif")),
             DTOutput(ns("statParCompagnie"))
      )
    ),
    fluidRow(
      column(width = 12,
             DTOutput(ns("hikesBrowser"))
      )
    )
  )
}
