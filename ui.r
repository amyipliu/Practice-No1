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
              fluidRow(
                  column(width = 10,
                         box(htmlOutput('plot1'))),
                  column(width = 10,
                         box(htmlOutput('gensum'))) 
                  )),
      tabItem(tabName = 'limb',
              'limb analysis'),
      tabItem(tabName = 'data',
              'data')
    )
  )
))



