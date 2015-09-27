
# This is the user-interface definition of a Shiny web application.
# You can find out more about building applications with Shiny here:
# 
# http://www.rstudio.com/shiny/
#

library(shiny)

shinyUI(pageWithSidebar(
  
  # Application title
  headerPanel("Body Mass Index Calculator"),
  
  # Sidebar with a slider input for number of bins
  sidebarPanel(
    sliderInput("pounds",
                "Weight in lbs:",
                min = 0,
                max = 600,
                value = 220),
    sliderInput("inches",
                "Height in inches:",
                min = 0,
                max = 10*12,
                value = 5.5*12),
    submitButton('Submit')
  ),
  
  mainPanel(
    h3("Your BMI"),
    verbatimTextOutput("bmi"),
    h4("You entered"),
    tags$ul(
      tags$li("Weight",
        verbatimTextOutput("inputWeight")),
      tags$li("Height",
        verbatimTextOutput("inputHeight"))),
    h4("More Information"),
    tags$a(href="https://en.wikipedia.org/wiki/Body_mass_index", "Wikipedia - Body mass index"))))
