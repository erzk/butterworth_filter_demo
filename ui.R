# define UI
shinyUI(fluidPage(

  # sidebar with a slider
  sidebarLayout(
    sidebarPanel(
  
      # header
      p("Change the filter settings."),

      # define the order of the filter
      sliderInput("ordSlider",
                  "Order:",
                  min = 1,
                  max = 10,
                  value = 1),
      
      # define the slider widget = high pass
      sliderInput("hpSlider",
                  "High pass (Hz):",
                  min = 50,
                  max = 200,
                  value = 70),
      
      # define the slider widget = high pass
      sliderInput("lpSlider",
                  "Low pass(Hz):",
                  min = 200,
                  max = 2000,
                  value = 2000)
      ),
 
    # show the generated plot
    mainPanel(
      h1("Butterworth Filter Demo", align ="center"),
      br(),
      p("The sliders set the values of a ",
        # add a link
        a("Butterworth filter.", 
          href = "https://en.wikipedia.org/wiki/Butterworth_filter")),
      # plot goes here
      plotOutput("signalPlot")
      )
  )
))
