#install.packages("UsingR")
library(shiny)

shinyServer(
  function(input, output) {
    output$carHist <- renderPlot({
      
      # Get user inputted data and store as server variables:
      inputtedHp <- input$inputtedHp
      inputtedWt <- input$inputtedWt / 1000
      
      # Load up mtcars:
      data(mtcars)
      mtcars$am <- as.factor(mtcars$am)
      levels(mtcars$am) <- c("Automatic", "Manual")
      
      # subset mtcars based on user input from slider widget:
      mtcars <- subset(mtcars, hp >= inputtedHp)
      mtcars <- subset(mtcars, wt >= inputtedWt)
      
      # Plot dual histrogram graph with subsetted data:
      sumMtcars <- aggregate(mpg~am, data = mtcars, function(x) mean(x))
      ggplot(mtcars, aes(x=mpg, fill=am)) + geom_histogram(binwidth=1, alpha=.5, position="identity") + geom_vline(data=sumMtcars, aes(xintercept=mpg, colour=am), linetype="dashed", size=1)

    })
  }
)
