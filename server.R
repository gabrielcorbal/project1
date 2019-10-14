
shinyServer(function(input, output){
  
  #output timegraph overview
  output$timegraphover <- renderPlot({
    intro %>%
      filter(., Country == input$checkGroup) %>%
      ggplot(., aes_string(x = "Year", y = input$stats1)) +
      geom_line(aes(color = Country)) + labs(title = 'Time-Series Visualization', subtitle = ' ') +
      ylab(' ') + theme_bw() + scale_x_continuous(breaks = seq(from = 1961, to = 2018, by = 5))
    
  })
  
  #output comparisson bar overview
  output$comparrisonbarover <- renderPlot({
    intro %>% 
      filter(., Year == 2018, Country %in% input$checkGroup) %>% 
      ggplot(., aes_string(x = 'Country', y = input$stats2, label = input$stats2)) + 
      geom_bar(position = 'dodge', stat = 'identity', (aes(fill = Country))) +
      geom_text( position = position_dodge(0),
                 vjust = 0) + labs(title = 'Comparrison Plot 2018 Data', subtitle = ' ') +
      ylab(' ') + theme_bw()
    
  })
  #output timegraph education
  output$timegraphedu <- renderPlot({
    edu %>%
      filter(., Country == input$checkGroupEdu) %>%
      ggplot(., aes_string(x = "Year", y = input$stats1edu)) +
      geom_line(aes(color = Country)) + labs(title = 'Time-Series Visualization', subtitle = ' ') +
      ylab(' ') + theme_bw()
    
  })
  
  #output comparrison bar education
  output$comparrisonbaredu <- renderPlot({
    edu %>% 
      filter(., Year == 2014, Country %in% input$checkGroupEdu) %>% 
      ggplot(., aes_string(x = 'Country', y = input$stats2edu, label = input$stats2edu)) + 
      geom_bar(position = 'dodge', stat = 'identity', (aes(fill = Country))) +
      geom_text( position = position_dodge(0),
                 vjust = 0) + labs(title = 'Comparrison Plot 2015 Data', subtitle = ' ') +
      ylab(' ') + theme_bw()
    
  })
  
  #output timegraph business
  output$timegraphbus <- renderPlot({
    bus %>%
      filter(., Country == input$checkGroupBus) %>%
      ggplot(., aes_string(x = "Year", y = input$stats1bus)) +
      geom_line(aes(color = Country)) + labs(title = 'Time-Series Visualization', subtitle = ' ') +
      ylab(' ') + theme_bw() + scale_x_continuous(breaks = seq(from = 2003, to = 2018, by = 1))
    
  })
  
  #output comparrison bar business
  output$comparrisonbarbus <- renderPlot({
    bus %>% 
      filter(., Year == 2018, Country %in% input$checkGroupBus) %>% 
      ggplot(., aes_string(x = 'Country', y = input$stats2bus, label = input$stats2bus)) + 
      geom_bar(position = 'dodge', stat = 'identity', (aes(fill = Country))) +
      geom_text( position = position_dodge(0),
                 vjust = 0) + labs(title = 'Comparrison Plot 2018 Data', subtitle = ' ') +
      ylab(' ') + theme_bw()
    
  })
  
  
  #output table overview
  output$tableover <- DT::renderDataTable({
    datatable(intro, rownames=FALSE) %>% 
      formatStyle(input$selected, background="skyblue", fontWeight='bold')
  })
  
  #output table education
  output$tableedu <- DT::renderDataTable({
    datatable(edu, rownames=FALSE) %>% 
      formatStyle(input$selected, background="skyblue", fontWeight='bold')
  })
  
  #output table business
  output$tablebus <- DT::renderDataTable({
    datatable(bus, rownames=FALSE) %>% 
      formatStyle(input$selected, background="skyblue", fontWeight='bold')
  })
  
  
})