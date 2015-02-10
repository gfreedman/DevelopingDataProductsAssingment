library(shiny)
library(ggplot2)

minHp <- 52
maxHp <- 335
minWt <- 1.513*1000
maxWt <- 5.424*1000
shinyUI(fluidPage(
  titlePanel("Automatic Vs Manual Transmissions Effect on MPG"),
  sidebarPanel(
    sliderInput('inputtedHp', 'Minimum Horsepower (hp)',value = minHp, min = minHp, max = maxHp, step = 1,),
    sliderInput('inputtedWt', 'Minimum Weight (lb)',value = minWt, min = minWt, max = maxWt, step = 1,),
    h5("Adjust the minimum values in the above slider widget to see it's effect on MPG for automatic and manual transmission cars.")
  ),
  mainPanel(
    h5(
      p("This graph shows you a histogram plot of the effect of vehicle transmission type on average MPG (fuel economy). The plot is using the built in mtcars data set in R."),
      p("You can read up on the data structure here --> ", a("http://stat.ethz.ch/R-manual/R-devel/library/datasets/html/mtcars.html")),
      p("In our plot below, we've split the cars by transmission type (auto/manual)")
    ),
    plotOutput('carHist'),
    h5(
        p("You can see initially with the minimum filter values as default --> That manual transmission cars seem to have lower MPG than automatic cars.
        However as you increase horsepower(hp) and weight(wt) with the slider menus in the top left you can see how the blue manual dashed median line 
        starts to move towards the red dashed median line eventually switching places with it."),
      p("When you begin to maximize weight you can see that we have no 'heavy' manual transmission cars."),
      p("When you begin to maximize horsepower you see that we don't have any very high horsepower automatic transmission vehicles."),
      p("Therefore the biggest two factors on MPG are horsepower and weight and transmission type is of secondary importance.")
    ),
    h5("github repo for UI and Server code is here --> ", a("https://github.com/gfreedman/DevelopingDataProductsAssingment"))
  )
))
