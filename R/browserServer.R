browserServer <- function(id, values) {

  moduleServer(
    id,
    function(input, output, session) {


      #### ObserveEvents ####




      #### Outputs ####

      #### __Datatable ####
      output$hikesBrowser <- renderDT({
        values$data %>%
          mutate(
            Durée = DuréeChar
          ) %>%
          dplyr::select(-DuréeChar, -Année, -Lieu, -Contexte) %>%
          arrange(desc(Date))
      },
      rownames = FALSE,
      options = list(
        pageLength = 25
      )
      )

    })

}
