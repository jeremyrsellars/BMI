
# This is the server logic for a Shiny web application.
# You can find out more about building applications with Shiny here:
# 
# http://www.rstudio.com/shiny/
#

library(shiny)

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
})
