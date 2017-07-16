#SERVER

library(shinydashboard)

shinyServer(function(input, output){
  output$plot1 <- renderGvis({
    pgg = cc1 %>%
      group_by(., gender) %>% select(., gender) %>%
      summarise(gender_per = n()/nrow(cc1)*100) %>%
      gvisPieChart(., labelvar = 'gender', 
                   numvar = 'gender_per',
                   options=list(
        width='auto',
        height='auto',
        title='Gender Portion',
        legend='none',
        colors="['orange', 'blue']",
        pieSliceText='label',
        pieHole=0.3),
        chartid="doughnut")
  })
  output$gensum = renderGvis({
    cc1 %>%
      group_by(., gender) %>% select(., gender) %>%
      summarise(gender_no = n()) %>%
      gvisBarChart(., xvar = 'gender', yvar = 'gender_no',
                   options = list(title="Population of Card Users by Gender",
                                  titleTextStyle="{color:'dark',fontName:'Courier',fontSize:16}",
                                  hAxes="[{title:'Portion', titleTextStyle: {color: 'dark'}}]",
                                  vAxes="[{title:'Gender', titleTextStyle: {color: 'dark'}}]",
                                  width='auto',
                                  height='auto'
      ))
  })
})
