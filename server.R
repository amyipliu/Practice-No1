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
  output$edpie = renderGvis({
    cc1 %>% 
      group_by(., educ) %>% 
      select(., educ) %>%
      filter(., educ %in% c('Graduate', 'Undergraduate', 'High School', 'Others')) %>% 
      summarise(e_sum = n()) %>%
      arrange(., desc(e_sum)) %>% 
      gvisPieChart(., 'educ', 'e_sum', options = list(title="Card Users by Education",
                                                      titleTextStyle="{color:'dark',fontName:'Courier',fontSize:16}"))
  })
  output$edpbar = renderGvis({
    cc1 %>% 
      group_by(., educ) %>% 
      select(., educ) %>%
      filter(., educ %in% c('Graduate', 'Undergraduate', 'High School', 'Others')) %>% 
      summarise(e_sum = n()) %>%
      arrange(., desc(e_sum)) %>%
      gvisBarChart(., 'educ', 'e_sum', list(title="Card Users by Education",
                                               titleTextStyle="{color:'dark',fontName:'Courier',fontSize:16}"))
  })
  output$ageppie = renderGvis({
    cc1 %>% 
      group_by(., ager) %>% 
      summarise(aget = n()) %>%
      gvisPieChart('ager', 'aget', list(title = 'Card Users by Age'))
  })
  output$agepbar = renderPlot({
    cc1 %>% ggplot(aes(x = ager)) + 
      geom_bar(aes(fill = ager)) + 
      xlab('Age Range') +
      scale_fill_discrete(name = 'Age Range')+
      ggtitle('Card Users by Age')+
      ylab('Count')
  })
  output$marppie = renderGvis({
    cc1 %>% 
      group_by(., marr) %>% 
      summarise(Marriage = n()) %>% 
      arrange(., desc(Marriage)) %>%
      gvisPieChart('marr', 'Marriage', list(title = 'Card Users by Marriage', 
                                            pieSliceText='label',
                                            pieHole=0.3))
  })
  output$marpbar = renderGvis({
    cc1 %>% 
      group_by(., marr) %>% 
      summarise(Marriage = n()) %>% 
      arrange(., desc(Marriage)) %>%
      gvisBarChart('marr', 'Marriage', list(title = 'Card Users by Marriage'))
  })
  output$lbsb = renderPlot({
    boxplot(cc1$limit_bal2, main = 'Credit Limit Range')
  })
  output$lbgbx = renderPlot({
    cc1 %>% 
      ggplot() + 
      geom_boxplot(aes( x= gender, y = limit_bal2, fill = gender))+
      xlab('Gender') + ylab('Credit Limit')
  })
  output$test = renderGvis({
    cc1 %>% group_by(., age) %>% 
      select(., age) %>%
      gvisHistogram()
  })
  output$edgepop = renderGvis({
    cc1 %>% 
      group_by(., educ) %>%
      summarise(Male = sum(gender == 'M'), Female = sum(gender == 'F')) %>%
      arrange(., desc(Female)) %>% 
      gvisColumnChart(xvar = c('educ'), yvar = c('Male', 'Female'), options = list(fill = 'gender'))
  })
  output$ed_M = renderGvis({
    cc1 %>% 
      group_by(., educ) %>%
      summarise(Male = sum(gender == 'M')) %>%
      arrange(., desc(Male)) %>% 
      gvisPieChart('educ', 'Male')
  })
  output$ed_F = renderGvis({
    cc1 %>% 
      group_by(., educ) %>%
      summarise(Female = sum(gender == 'F')) %>%
      arrange(., desc(Female)) %>% 
      gvisPieChart('educ', numvar ='Female')
  })
  output$age_gender = renderGvis({
    cc1 %>%
      group_by(., ager) %>%
      summarise(Female = sum(gender == 'F'), Male = sum(gender == 'M')) %>% 
      gvisColumnChart('ager', c('Male', 'Female'))
  })
  output$lb_edu = renderPlot({
    cc1 %>% 
      ggplot(aes(x= educ, y = limit_bal2)) +  
      geom_boxplot(aes(fill=educ)) + xlab('Education Level') + 
      ylab('Credit Limit') +
      scale_fill_brewer(palette = 'YlGnBu', name = 'Edu Level')
  })
  output$lb_mar = renderPlot({
    cc1 %>% 
      ggplot(aes(x = marr, y = limit_bal2)) +  
      geom_boxplot(aes(fill=marr)) + xlab('Marital') + 
      ylab('Credit Limit') +
      scale_fill_brewer(palette = 'YlGnBu', name = 'Marital')
  })
})
