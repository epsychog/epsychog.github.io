library(shiny)
library (caret)
library(ISLR)
library(Hmisc)

# Load in the Wage dataset and asssign it in a variable
data(Wage)


# Define server logic required to make the appropriate plot for the predictor Wage
shinyServer(function(input, output) {
  
  # Return the command of the plot to be printed based on the user selection
  plotCmd <- reactive ({
    cutWage = cut2(Wage$wage,g=3)
    qq <- qplot(age,wage,colour=education,data=Wage)
    switch(input$plotType, 
         "Feature Plot (Wage)" = featurePlot(x=Wage[,c("age","education","jobclass")], y=Wage$wage,plot="pairs"),
         "Jobclass (Age vs Wage)" = qplot(age,wage,colour=jobclass,data=Wage),
         "Smoothers (Age vs Wage)" = qq + geom_smooth(method='lm', formula=y~x),
         "Boxplot (Wage vs Age)" = qplot(cutWage, age, data=Wage, fill=cutWage, geom=c("boxplot")),
         "Density Plot (Wage)" = qplot(wage, colour=education, data=Wage, geom="density")
    )
  })
  
  
  # Show the caption in line with the plot type selected
  output$caption <- renderText({
    input$plotType    
  })


  # Generate a plot of the predictors of the selected type
  output$showPlot <- renderPlot({
    print(plotCmd())
  })
})