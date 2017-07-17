######UI####


library(shinydashboard)

shinyUI(dashboardPage(skin = 'black',
  dashboardHeader(title = "Default of Credit Card Clients Dataset"),
  dashboardSidebar(sidebarUserPanel("Amy IP Liu"),
                   sidebarMenu(
                     menuItem("Home", tabName = 'home', icon = icon("home")),
                     menuItem("Population", tabName = 'population', icon = icon("bar-chart")),
                     menuItem("Limit Balance", tabName = 'limb', icon = icon("object-align-vertical", lib = 'glyphicon')),
                     menuItem("Data", tabName = 'data', icon = icon("tasks"))
                   )),
  dashboardBody(
    tabItems(
      tabItem(tabName = 'home',
              'homepage'),
      tabItem(tabName = 'population',
              fluidRow( #test
                box(title = 'test', solidHeader = TRUE, htmlOutput('test')),
                box(title = "Inputs", status = "warning", solidHeader = TRUE,
                    "Box content here", br(), "More box content",
                    sliderInput("slider", "Slider input:", 1, 10, 5)
                )
              ),
              fluidRow(
                box(htmlOutput('plot1'), width = 5, background = "light-blue"),
                box(htmlOutput('gensum'), background = "maroon") 
                ),
              fluidRow(
                box(htmlOutput('edpie'), width = 5, background = "light-blue"),
                box(htmlOutput('edpbar'), background = "maroon")
               ),
              fluidRow(
                box(htmlOutput('ageppie'), width = 5, height = 'auto', background = 'light-blue'),
                box(plotOutput('agepbar'), background = 'maroon')
                ),
              fluidRow(
                box(htmlOutput('marppie'), width = 5, background = 'light-blue'),
                box(htmlOutput('marpbar'), background = 'maroon')
                ),
              fluidRow(
                box(title = 'Male Education Portion', 
                    htmlOutput('ed_M'), width = 5, 
                    background = 'light-blue',
                    solidHeader = T),
                box(title = 'Female Education Portion', 
                    htmlOutput('ed_F'), width = 5,
                    background = 'maroon',
                    solidHeader = T),
                box(title = 'Education & Gender Distribution', 
                    htmlOutput('edgepop'),
                    background = 'teal',
                    solidHeader = T),
                box(title = 'Gender & Age Distribution',
                    htmlOutput('age_gender'),
                    background = 'teal',
                    solidHeader = T)
              )),
      tabItem(tabName = 'limb',
              fluidRow(
                box(plotOutput('lbsb'), width = 6, background = 'light-blue')
              ),
              fluidRow(
                box(plotOutput('lbgbx'), title = 'Credit Limit by Gender',
                    background = 'light-blue')
               ),
              fluidRow(
                box(plotOutput('lb_edu'), title = 'Credit Limit by Education', background = 'light-blue'),
                box(plotOutput('lb_mar'), title = 'Credit Limit by Marital', background = 'light-blue')
              )
              ),
      tabItem(tabName = 'data',
              'data')
    )
  )
))



