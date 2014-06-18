library(shiny)

# Define UI for application
shinyUI(pageWithSidebar(
  
  # Application title
  headerPanel("Plot Predictors of Wage Dataset"),
  
  # Sidebar with controls to select the type of plot to drW
  sidebarPanel(  
    selectInput("plotType", "Choose a Plot Type",
                choices = c(" ",
                            "Feature Plot (Wage)", 
                            "Jobclass (Age vs Wage)", 
                            "Smoothers (Age vs Wage)",
                            "Boxplot (Wage vs Age)",
                            "Density Plot (Wage)"))
  ),
  
  # Show the the pot type selected as the caption and plot the requested plot
  mainPanel(
    h3(textOutput("caption")),
    
    # Documentation for the application
    p('The current application produces a variety of plots that help visualise the predictor variables.
       The dataset used is the Wages dataset and the predictor in the plots include were age, wage, jobcode and education.'),
    p('A description of the available selection follows:'),
    p('Feature Plot (Wage): Creates a feature plot using age, education and jobcode against wage'),
    p('Jobclass (Age vs Wage): Creates a plot of age versus wage coloured by jobclass.'),
    p('Smoothers (Age vs Wage): Creates a plot of age versus wage coloured by education. In addition it applies a linear smoother for each education class'),
    p('Boxplot (Wage vs Age): Creates a box plot of age versus wage showing with different colours the various wage ranges'),
    p('Density Plot (Wage): Creates a density plot of wage versus education'),
        
    plotOutput("showPlot")
  )
))