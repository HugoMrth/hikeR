dashboardServer <- function(id, values) {

  moduleServer(
    id,
    function(input, output, session) {


      #### ObserveEvents ####




      #### Outputs ####

      #### __Datatable ####
      output$statParAn <- renderDT({
        data.frame(
          Année = levels(values$data$Année),
          N = as.numeric(table(values$data$Année)),
          Km = by(values$data$Km, values$data$Année, sum),
          "Dp" = by(values$data$`D+`, values$data$Année, sum),
          "Dm" = by(values$data$`D-`, values$data$Année, sum)
        )
      },
      rownames = FALSE,
      options = list(
        pageLength = 5
      )
      )

      output$statParChaussure <- renderDT({
        data.frame(
          Chaussure = levels(values$data$Chaussures),
          N = as.numeric(table(values$data$Chaussures)),
          Km = by(values$data$Km, values$data$Chaussures, sum),
          "Dp" = by(values$data$`D+`, values$data$Chaussures, sum),
          "Dm" = by(values$data$`D-`, values$data$Chaussures, sum)
        )
      },
      rownames = FALSE,
      options = list(
        pageLength = 5
      )
      )

    })
    }
