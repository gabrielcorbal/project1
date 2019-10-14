library(shiny)
library(dplyr)
library(ggplot2)
library(shinydashboard)
library(DT)
library(googleVis)
library(ggthemes)


intro = read.csv('overview.csv')
edu = read.csv('education.csv')
bus = read.csv('business.csv')

choiceover <- colnames(intro[5:12])
choice2over <- colnames(intro[4:6])

choiceedu <- colnames(edu[4:13])

choicebus <- colnames(bus[4:14])