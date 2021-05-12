Course Project: Shiny Application and Reproducible Pitch
========================================================
author: Daria Karpova
date: 12.05.2021
autosize: true

About the project
========================================================

This project is created for the 'Developing Data Products' course on Coursera conducted by The Jonh's Hopkins University. The presented application is a simple calculator with the abilities to sum, subtract, multiply, divide and take to a power. A user needs to choose the first number, the second and the operation they want to perform on the numbers. Then the result is shown below.

Instructions:

1. Write a shiny application with associated supporting documentation. The documentation should be thought of as whatever a user will need to get started using your application.
2. Deploy the application on Rstudio's shiny server
3. Share the application link by pasting it into the provided text box
4. Share your server.R and ui.R code on github

Application Interface
========================================================

![alt text](app.jpg)


ui.R code
========================================================


```r
library(shiny)

shinyUI(fluidPage(
    titlePanel("Simple Shiny Calculator"),
    sidebarLayout(
        mainPanel(
            h5("This is a simple calculator. 
        You put the first and the second number,
        select the operator and voila!"),
            numericInput("num1", "First number", 0),
            numericInput("num2", "Second number", 0),
            selectInput("operator", "Operation",
                        choices = c("+","-","*", "/", "^"))
        ),
        mainPanel(
            h2("The result is:"),
            textOutput("output")
        ))))
```

<!--html_preserve--><div class="container-fluid">
<h2>Simple Shiny Calculator</h2>
<div class="row">
<div class="col-sm-8" role="main">
<h5>This is a simple calculator. 
        You put the first and the second number,
        select the operator and voila!</h5>
<div class="form-group shiny-input-container">
<label class="control-label" id="num1-label" for="num1">First number</label>
<input id="num1" type="number" class="form-control" value="0"/>
</div>
<div class="form-group shiny-input-container">
<label class="control-label" id="num2-label" for="num2">Second number</label>
<input id="num2" type="number" class="form-control" value="0"/>
</div>
<div class="form-group shiny-input-container">
<label class="control-label" id="operator-label" for="operator">Operation</label>
<div>
<select id="operator"><option value="+" selected>+</option>
<option value="-">-</option>
<option value="*">*</option>
<option value="/">/</option>
<option value="^">^</option></select>
<script type="application/json" data-for="operator" data-nonempty="">{"plugins":["selectize-plugin-a11y"]}</script>
</div>
</div>
</div>
<div class="col-sm-8" role="main">
<h2>The result is:</h2>
<div id="output" class="shiny-text-output"></div>
</div>
</div>
</div><!--/html_preserve-->

server.R code
========================================================


```r
library(shiny)

shinyServer(function(input, output) {
    output$output <- renderText({
        switch(input$operator,
               "+" = input$num1 + input$num2,
               "-" = input$num1 - input$num2,
               "*" = input$num1 * input$num2,
               "/" = input$num1 / input$num2,
               "^" = input$num1^(input$num2))
    })
})
```

