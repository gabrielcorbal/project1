library(wbstats)
library(dplyr)


databasefront = wb(country = c("USA", "CHN", "JPN", "DEU", "IND", "GBR", "FRA", "ITA", "BRA", "CAN", 'KOR', 'RUS', 'ESP', 'AUS', 'MEX', 'IDN', 'NLD', 'SAU', "CHE", "TUR"), 
          c('SP.POP.TOTL', 'AG.SRF.TOTL.K2', 'NY.GDP.MKTP.KD.ZG', 'NY.GDP.PCAP.CD', 'NY.GDP.PCAP.KD.ZG', 'SI.POV.GINI', 'FM.LBL.BMNY.ZG', 'BX.KLT.DINV.CD.WD', 'NY.GDP.MKTP.CD' ), 
          return_wide = TRUE, 
                lang = c("en"),
                removeNA = TRUE, POSIXct = FALSE, include_dec = FALSE,
                include_unit = FALSE, include_obsStatus = FALSE,
                include_lastUpdated = FALSE)


df = databasefront %>% rename(.,
       Year = date,
       Country = country,
       Total.Area = AG.SRF.TOTL.K2,
       Foreign.Direct.Investment = BX.KLT.DINV.CD.WD, 
       Broad.Money = FM.LBL.BMNY.ZG, 
       GDP.Growth = NY.GDP.MKTP.KD.ZG, 
       GDP.PerCapita.Growth = NY.GDP.PCAP.KD.ZG, 
       GDP.PerCapita = NY.GDP.PCAP.CD, 
       GINI = SI.POV.GINI, 
       Total.Population = SP.POP.TOTL,
       GDP = NY.GDP.MKTP.CD) %>% 
  
  
  select(., Country, Year, Total.Area, Total.Population,
         GDP,
         Foreign.Direct.Investment, 
         Broad.Money, GDP.Growth, GDP.PerCapita.Growth, 
         GDP.PerCapita, GINI) %>% 
  
  mutate(., Total.Area.Million.KM = Total.Area/1000000, 
         Total.Population.Million = Total.Population/1000000,
         GDP.Billions = GDP/1000000000,
         Foreign.Direct.Investment.Millions = Foreign.Direct.Investment/1000000
  ) %>% 
  select(., Country, Year, Total.Area.Million.KM, Total.Population.Million,
         GDP.Billions,
         Foreign.Direct.Investment.Millions, 
         Broad.Money, GDP.Growth, GDP.PerCapita.Growth, 
         GDP.PerCapita, GINI) %>% 
  mutate_if(is.numeric, round, digits = 3)


write.csv(df, 'overview.csv')


education = wb(country = c("USA", "CHN", "JPN", "DEU", "IND", "GBR", "FRA", "ITA", "BRA", "CAN", 'KOR', 'RUS', 'ESP', 'AUS', 'MEX', 'IDN', 'NLD', 'SAU', "CHE", "TUR"), 
                   c('SE.XPD.TOTL.GD.ZS', 'SE.XPD.TOTL.GB.ZS', 'SE.XPD.PRIM.PC.ZS', 'SE.XPD.SECO.PC.ZS', 'SE.XPD.TERT.PC.ZS', 'SL.TLF.TOTL.IN', 'SE.ADT.LITR.ZS', 'SP.POP.0014.TO.ZS', 'SE.PRM.ENRR', 'SE.SEC.ENRR', 'SE.TER.ENRR'), 
                   return_wide = TRUE, 
                   lang = c("en"),
                   removeNA = TRUE, POSIXct = FALSE, include_dec = FALSE,
                   include_unit = FALSE, include_obsStatus = FALSE,
                   include_lastUpdated = FALSE)


dfeducation = education %>% 
  rename(.,
         Country = country,
         Year = date,
         Total.Gov.Education.Invest.Percent.of.GDP = SE.XPD.TOTL.GD.ZS,
         Total.Gov.Exp.Percent.of.TotalExpenses = SE.XPD.TOTL.GB.ZS,
         Expenditure.Per.Primary.Student = SE.XPD.PRIM.PC.ZS,
         Expenditure.Per.Secondary.Student = SE.XPD.SECO.PC.ZS,
         Expenditure.Per.Tertiary.Student = SE.XPD.TERT.PC.ZS,
         Literacy.Rate.Adults = SE.ADT.LITR.ZS,
         Popul.Between.0.and.14 = SP.POP.0014.TO.ZS,
         School.Enrollment.Primary = SE.PRM.ENRR,
         School.Enrollment.Secondary = SE.SEC.ENRR,
         School.Enrollment.Tertiary = SE.TER.ENRR
         ) %>% 
  select(.,
         Country, Year, Total.Gov.Education.Invest.Percent.of.GDP, Total.Gov.Exp.Percent.of.TotalExpenses,
         Expenditure.Per.Primary.Student,
         Expenditure.Per.Secondary.Student,
         Expenditure.Per.Tertiary.Student,
         Literacy.Rate.Adults,
         Popul.Between.0.and.14,
         School.Enrollment.Primary,
         School.Enrollment.Secondary,
         School.Enrollment.Tertiary
         ) %>% 
  mutate_if(is.numeric, round, digits = 3)

write.csv(dfeducation, 'education.csv')


business = wb(country = c("USA", "CHN", "JPN", "DEU", "IND", "GBR", "FRA", "ITA", "BRA", "CAN", 'KOR', 'RUS', 'ESP', 'AUS', 'MEX', 'IDN', 'NLD', 'SAU', "CHE", "TUR"), 
               c('IC.REG.DURS', 'IC.PRP.DURS', 'IC.PRP.PROC', 'IC.REG.PROC', 'IC.REG.COST.PC.ZS', 'IC.TAX.LABR.CP.ZS', 'IC.TAX.OTHR.CP.ZS', 'IC.TAX.PAYM', 'IC.TAX.TOTL.CP.ZS', 'IC.TAX.DURS', 'IC.ISV.DURS'), 
               return_wide = TRUE, 
               lang = c("en"),
               removeNA = TRUE, POSIXct = FALSE, include_dec = FALSE,
               include_unit = FALSE, include_obsStatus = FALSE,
               include_lastUpdated = FALSE)


dfbusiness = business %>% 
  rename(.,
         Country = country,
         Year = date,
         Days.to.Start.a.Business = IC.REG.DURS,
         Days.to.Register.Property = IC.PRP.DURS,
         Procedures.to.Register.Property = IC.PRP.PROC,
         StartUp.Precedures.to.Register.a.Business = IC.REG.PROC,
         Cost.of.Business.Percent.of.GNI.per.capita= IC.REG.COST.PC.ZS,
         Tax.Payments.Number = IC.TAX.PAYM,
         Total.Tax.Contributions.Rate.of.Profit = IC.TAX.TOTL.CP.ZS,
         Labor.Tax.and.Contributions = IC.TAX.LABR.CP.ZS,
         Other.Taxes.Rate.of.Profit = IC.TAX.OTHR.CP.ZS,
         Hours.to.Prepare.and.Pay.Taxes = IC.TAX.DURS,
         Time.to.Resolve.Insolvency = IC.ISV.DURS
         ) %>% 
  select(.,
         Country, Year, Days.to.Start.a.Business,
         Days.to.Register.Property,
         Procedures.to.Register.Property,
         StartUp.Precedures.to.Register.a.Business,
         Cost.of.Business.Percent.of.GNI.per.capita,
         Tax.Payments.Number,
         Total.Tax.Contributions.Rate.of.Profit,
         Labor.Tax.and.Contributions,
         Other.Taxes.Rate.of.Profit,
         Hours.to.Prepare.and.Pay.Taxes,
         Time.to.Resolve.Insolvency
         )
                 

write.csv(dfbusiness, 'business.csv')






