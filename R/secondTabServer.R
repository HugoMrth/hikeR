secondTabServer <- function(id, values) {

  moduleServer(
    id,
    function(input, output, session) {


      #### ObserveEvents ####
      observeEvent(input$n_bins, {
        if (input$n_bins > 1) { return() }
        updateNumericInput(session, "n_bins", value = 5)
      })



      #### renderUI ####
      output$dummyWidget <- renderUI({
        if (input$n_bins != 5) { return () }
        ns <- session$ns
        numericInput(ns("dummyInput"), "This is useless and only appears if 5 bins are displayed :",
                     value = 1, min = 1, max = 2, step = 1)
      })


      #### renderOutputs ####

      output$distPlot <- renderPlot({
        # generate bins based on input$bins from ui.R
        bins <- seq(min(values$x), max(values$x), length.out = input$n_bins + 1)

        # draw the histogram with the specified number of bins
        hist(values$x, breaks = bins, col = 'darkgray', border = 'white',
             xlab = 'Waiting time to next eruption (in mins)',
             main = 'Histogram of waiting times')
      })

    })

}
