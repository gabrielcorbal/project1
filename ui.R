
shinyUI(dashboardPage(
  skin = 'green',
  dashboardHeader(title = "Top 20 World's Economy",
                  titleWidth = 250),
  
  dashboardSidebar(
    width = 250,
    sidebarUserPanel(name = 'Gabriel Corbal',
                     subtitle = 'Project 1',
                     image = 'http://pngimg.com/uploads/globe/globe_PNG63.png'),
    
    sidebarMenu(
      
      menuItem("About", tabName = "about", icon = icon("pencil")),
      
      menuItem("Overview", tabName = "overview", icon = icon("globe")),
      
      menuItem("Doing Business", tabName = "business", icon = icon("money")),
      
      menuItem("Education", tabName = "education", icon = icon("book")),
      
      menuItem("Data Overview", tabName = "dataover", icon = icon("database")),
      
      menuItem("Data Education", tabName = "dataedu", icon = icon("database")),
      
      menuItem("Data Doing Business", tabName = "databus", icon = icon("database"))
      
      
      
      
      
    )
  ),
  
  
  dashboardBody(tabItems(
    
    #Tab About
    tabItem(tabName = 'about',
            fluidRow(box(
              
              
              widht = 24, p(h2("Shiny Exploratory Visualization."),"This project aims to be a valuable tool for data exploration for the first 20s world economies. The data was extracted from The World Bank Data Indicators. 
There are 3 main visualization panels available to display and compare countries.
Overview, which is composed of geographical and economic data.
Doing Business uses the Doing Business project from the TWB.
Education contains the main metrics of education.
Also is available to search through the indicators tables in each table section.")))),
    
    
    
    #Tab Overview
    tabItem(tabName = "overview",
            fluidRow(box(
              selectizeInput(
                inputId = "stats1",
                label = "Select Item to Display",
                choices = choiceover
              ),
              box(plotOutput("timegraphover"), width = 12)
              
            ),
            box(
              selectizeInput(
                inputId = "stats2",
                label = "Select Item to Compare",
                choices = choice2over
              ),
              box(plotOutput("comparrisonbarover"), width = 12)),
            
            box(
              checkboxGroupInput(
                inputId = "checkGroup",
                label = h4("Select the Countries"),
                choices = unique(intro$Country),
                selected = c("Brazil", "United States", "Canada")
              ), width = 12
            )
            )),
    
    #Tab Data Overview
    tabItem(tabName = "dataover",
            fluidRow(box(DT::dataTableOutput("tableover"), width = 20))
            
    ),
    #Tab Education
    tabItem(tabName = "education",
            fluidRow(box(
              selectizeInput(
                inputId = "stats1edu",
                label = "Select Item to Display",
                choices = choiceedu
              ),
              box(plotOutput("timegraphedu"), width = 12)
              
            ),
            box(
              selectizeInput(
                inputId = "stats2edu",
                label = "Select Item to Compare",
                choices = choiceedu
              ),
              box(plotOutput("comparrisonbaredu"), width = 12)),
            
            box(
              checkboxGroupInput(
                inputId = "checkGroupEdu",
                label = h4("Select the Countries"),
                choices = unique(intro$Country),
                selected = c("Brazil", "United States", "Canada")
              ), width = 12
            )
            )),
    #Tab Data Table Education
    tabItem(tabName = "dataedu",
            fluidRow(box(DT::dataTableOutput("tableedu"), width = 20))
            
    ),
    
    #Tab Doing Business
    tabItem(tabName = "business",
            fluidRow(
              box(
                selectizeInput(
                  inputId = "stats2bus",
                  label = "Select Item to Compare",
                  choices = choicebus
                ),
                box(plotOutput("comparrisonbarbus"), width = 12)),
              box(
                selectizeInput(
                  inputId = "stats1bus",
                  label = "Select Item to Display",
                  choices = choicebus
                ),
                box(plotOutput("timegraphbus"), width = 12)
                
              ),
              
              box(
                checkboxGroupInput(
                  inputId = "checkGroupBus",
                  label = h4("Select the Countries"),
                  choices = unique(intro$Country),
                  selected = c("Brazil", "United States", "Canada")
                ), width = 12
              )
            )),
    #TAB DATA TABLE BUSINESS
    tabItem(tabName = "databus",
            fluidRow(box(DT::dataTableOutput("tablebus"), width = 20))
            
    )     
    
    
    
    
    
    
    
    
    #close the body    
  ))
  #close the page
))