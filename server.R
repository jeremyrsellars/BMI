
# This is the server logic for a Shiny web application.
# You can find out more about building applications with Shiny here:
# 
# http://www.rstudio.com/shiny/
#

library(shiny)
library(memisc)

bmi_range <- function(bmi) cases(
  "Very severely underweight"=bmi < 15,
  "Severely underweight"=bmi < 16,
  "Underweight"=bmi < 18.5,
  "Normal (healthy weight)"=bmi < 25,
  "Overweight"=bmi < 30,
  "Obese Class I (Moderately obese)"=bmi < 35,
  "Obese Class II (Severely obese)"=bmi < 40,
  "Obese Class III (Very severely obese)"=bmi > 40)

shinyServer(function(input, output) {

  output$bmi <- renderText({
    # BMI Formula:
    # https://en.wikipedia.org/wiki/Body_mass_index
    
    round(703 * input$pounds / (input$inches ^ 2), 1)
  })
  output$inputPounds <- renderText({input$pounds})
  output$inputInches <- renderText({input$inches})
  output$inputWeight <- renderText({paste0(input$pounds, " lbs")})
  output$inputHeight <- renderText({paste0(floor(input$inches/12),"'",input$inches %% 12, "\" (", input$pounds, " inches)")})
  output$bmi_range <- renderText({as.character(bmi_range(round(703 * input$pounds / (input$inches ^ 2), 1)))})
})

bmi <- 22
bmi_range <- function(bmi) cases(
  "Very severely underweight"=bmi < 15,
  "Severely underweight"=bmi < 16,
  "Underweight"=bmi < 18.5,
  "Normal (healthy weight)"=bmi < 25,
  "Overweight"=bmi < 30,
  "Obese Class I (Moderately obese)"=bmi < 35,
  "Obese Class II (Severely obese)"=bmi < 40,
  "Obese Class III (Very severely obese)"=bmi > 40)
