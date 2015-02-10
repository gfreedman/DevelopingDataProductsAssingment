library(shiny)
minHp <- 52
maxHp <- 335
minWt <- 1.513*1000
maxWt <- 5.424*1000
shinyUI(fluidPage(
  headerPanel("Automatic Vs Manual Transmissions Effect on MPG"),
  sidebarPanel(
    sliderInput('inputtedHp', 'Minimum Horsepower (hp)',value = minHp, min = minHp, max = maxHp, step = 1,),
    sliderInput('inputtedWt', 'Minimum Weight (lb)',value = minWt, min = minWt, max = maxWt, step = 1,),
    h5("Adjust the minimum values in the above slider widget to see it's effect on MPG for automatic and manual transmission cars.")
  ),
  mainPanel(
    "Histogram Plot of the effect of transmission type of MPG",
    plotOutput('carHist'),
    p("You can see initially with the minimum filter values as default --> That manual transmission cars seem to have lower MPG than automatic cars.
      However as you increase horsepower(hp) and weight(wt) with the slider menus in the top left you can see how the blue manual dashed median line 
      starts to move towards the red dashed median line eventually switching places with it."),
    p("When you begin to maximize weight you can see that we have no 'heavy' manual transmission cars. 
      When you begin to maximize horsepower you see that we don't have any high horsepower automatic transmission vehicles."),
    p("Therefore the biggest two factors on MPG are horsepower and weight.")
  )
))
