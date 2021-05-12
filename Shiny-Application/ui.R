#
# This is the user-interface definition of a Shiny web application. You can
# run the application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#

library(shiny)

shinyUI(fluidPage(
    titlePanel("Simple Shiny Calculator"),
        mainPanel(
            h5("This application is a calculator. You can apply sum, subtraction, multiplication,
               division or power function to  two numbers. For that please choose the numbers and the function below.", width = "20px"),
            numericInput("num1", "First number", 0),
            numericInput("num2", "Second number", 0),
            selectInput("operator", "Operation",
                        choices = c("+","-","*", "/", "^")),
            h2("The result is:"),
            textOutput("output"),
            width = 4,
        )
))