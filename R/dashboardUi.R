dashboardUi <- function(id) {
  ns <- NS(id)
  tagList(
    fluidRow(
      column(width = 4,
             DTOutput(ns("statParAn")),
             DTOutput(ns("statParChaussure"))
      ),
      column(width = 4,
             DTOutput(ns("statParTrek"))
      ),
      column(width = 2,
             DTOutput(ns("statParMassif"))
      ),
      column(width = 2,
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
