#reading data from csv file which is present in Github directory -> files used -> dataforhighways.csv
data<-read.csv("G:/Akshat data/dataforhighways.csv", header=TRUE)
head(data)

data=as.data.frame(data)

#replacing all the NAs with 0
data[is.na(data)]<-0
data
datatr<-t(data)
datatr

#converting datar to tibble
datatr <- as_tibble(datatr)
datatr


#renaming columns according to states and storing it seperately
datatrf<-datatr %>% 
  rename(
    AP = V1,
    ARP = V2,
    ASSAM= V3,
    BI= V4,
    CG=V5,
    GOA=V6,
    GJ=V7,
    HR=V8,
    HP=V9,
    JK=V10,
    JH=V11,
    KN=V12,
    KR=V13,
    MP=V14,
    MH=V15,
    MN=V16,
    MG=V17,
    MI=V18,
    NL=V19,
    OD=V20,
    PJ=V21,
    RJ=V22,
    SI=V23,
    TN=V24,
    TG=V25,
    TR=V26,
    UK=V27,
    UP=V28,
    WB=V29,
    AN=V30,
    CH=V31,
    DN=V32,
    DD=V33,
    DL=V34,
    LK=V35,
    PU=V36,
    AI=V37
  )
#removing 1st row of datatrf which had names
datatrf<-datatrf[-1,]
str(datatrf) #will show as character
datatrf<- as.data.frame(datatrf)
str(datatrf)

datatrf$AP <- as.integer(datatrf$AP) # "thal" also had "?"s in it.
str(datatrf)
sum_AP<-sum(datatrf$AP)
#years on x axis
x<-c(2004, 2005, 2006, 2007, 2008, 2009, 2010, 
     2011, 2012, 2013, 2014, 2015)

#adding a cumulative column on datatrf for All states
cum_AP<-cumsum(datatrf$AP)
cum_ARP<-cumsum(datatrf$ARP)
cum_ASSAM<-cumsum(datatrf$ASSAM)
cum_BI<-cumsum(datatrf$BI)
cum_CG<-cumsum(datatrf$CG)
cum_GOA<-cumsum(datatrf$GOA)
cum_GJ<-cumsum(datatrf$GJ)
cum_HR<-cumsum(datatrf$HR)
cum_HP<-cumsum(datatrf$HP)
cum_JK<-cumsum(datatrf$JK)
cum_JH<-cumsum(datatrf$JH)
cum_KN<-cumsum(datatrf$KN)
cum_KR<-cumsum(datatrf$KR)
cum_MP<-cumsum(datatrf$MP)
cum_MH<-cumsum(datatrf$MH)
cum_MN<-cumsum(datatrf$MN)
cum_MG<-cumsum(datatrf$MG)
cum_MI<-cumsum(datatrf$MI)
cum_NL<-cumsum(datatrf$NL)
cum_OD<-cumsum(datatrf$OD)
cum_PJ<-cumsum(datatrf$PJ)
cum_RJ<-cumsum(datatrf$RJ)
cum_SI<-cumsum(datatrf$SI)
cum_TN<-cumsum(datatrf$TN)
cum_TG<-cumsum(datatrf$TG)
cum_TR<-cumsum(datatrf$TR)
cum_UK<-cumsum(datatrf$UK)
cum_UP<-cumsum(datatrf$UP)
cum_WB<-cumsum(datatrf$WB)
cum_AN<-cumsum(datatrf$AN)
cum_CH<-cumsum(datatrf$CH)
cum_DN<-cumsum(datatrf$DN)
cum_DD<-cumsum(datatrf$DD)
cum_DL<-cumsum(datatrf$DL)
cum_LK<-cumsum(datatrf$LK)
cum_PU<-cumsum(datatrf$PU)
cum_AI<-cumsum(datatrf$AI)


sum(datatrf$AP)


#plotting cumulative line graph for AP
APPlot <- ggplot(datatrf, aes(x=x, y=cum_AP)) +
          geom_point(shape=21, color="black", fill="#69b3a2", size=2)+
          geom_line()

APPlot + ggtitle("Andhra Pradesh") +
  xlab("Year") + ylab("Road length in km")


# for ARP
ARPPlot <- ggplot(datatrf, aes(x=x, y=cum_ARP)) +
  geom_point(shape=21, color="black", fill="#69b3a2", size=2)+
  geom_line()

ARPPlot + ggtitle("Arunachal Pradesh") +
  xlab("Year") + ylab("Road length in km")

#combining data of first 5 states
#assigning colors using Hexadecimal code
colors <- c("Andhra Pradesh" = "#FF00FF", 
            "Arunachal Pradesh" = "#000080", 
            "Assam" = "#00FFFF",
            "Bihar"="#00FF00", 
            "Chhatisgarh"="#FF0000",
            
            "Goa" = "#FF00FF",
            "Gujarat" = "#000080",
            "Haryana" = "#00FFFF",
            "Himachal Pradesh" ="#00FF00",
            "Jammu & Kashmir "="#FF0000",
            
            "Jharkhand"  = "#FF00FF",
            "Karnataka "= "#000080",
            "Kerala "= "#00FFFF",
            "Madhya Pradesh" ="#00FF00",
            "Maharashtra" ="#FF0000",
            
            "Manipur"  = "#FF00FF",
            "Meghalaya" = "#000080",
            "Mizoram "= "#00FFFF",
            "Nagaland" ="#00FF00",
            "Odisha "="#FF0000",
            
            "Punjab  "= "#FF00FF",
            "Rajasthan" = "#000080",
            "Sikkim "= "#00FFFF",
            "Tamil Nadu" ="#00FF00",
            "Telangana "="#FF0000",
            
            "Tripura  "= "#FF00FF",
            "Uttarakhand" = "#000080",
            "Uttar Pradesh" = "#00FFFF",
            "West Bengal" ="#00FF00",
            
            "Andaman & Nicobar Islands  "= "#FF00FF",
            "Chandigarh" = "#000080",
            "Dadra & Nagar Haveli" = "#00FFFF",
            "Daman & Diu "="#00FF00",
            "Delhi "="#FF0000",
            "Lakshadweep"="#00FFF0",
            "Puducherry"="#00000F"
            
            
)

#plotting using ggplot2 for first 5 states

p5 = ggplot() + 
  geom_line(data = datatrf, aes(x = x, y = cum_AP, color="Andhra Pradesh", size =1.05)) +
  geom_line(data =  datatrf, aes(x = x, y = cum_ARP, color="Arunachal Pradesh", size =1.05))+
  geom_line(data =  datatrf, aes(x = x, y = cum_ASSAM, color="Assam", size =1.05)) +
  geom_line(data =  datatrf, aes(x = x, y = cum_BI, color="Bihar", size =1.05)) +
  geom_line(data =  datatrf, aes(x = x, y = cum_CG, color="Chhatisgarh", size =1.05)) +
  geom_point()+
  labs(x = "Year",
       y = "Road length",
       colour = "States") 
print(p5)

#plotting using ggplot2 for next 5 states
p10 = ggplot() + 
  geom_line(data = datatrf, aes(x = x, y = cum_GOA, color="Goa", size =1.05)) +
  geom_line(data =  datatrf, aes(x = x, y = cum_GJ, color="Gujarat", size =1.05))+
  geom_line(data =  datatrf, aes(x = x, y = cum_HR, color="Haryana", size =1.05)) +
  geom_line(data =  datatrf, aes(x = x, y = cum_HP, color="Himachal Pradesh", size =1.05)) +
  geom_line(data =  datatrf, aes(x = x, y = cum_JK, color="Jammu and Kashmir", size =1.05)) +
  geom_point()+
  labs(x = "Year",
       y = "Road length",
       colour = "States") 
print(p10)


#plotting using ggplot2 for next 5 states
p15 = ggplot() + 
  geom_line(data = datatrf, aes(x = x, y = cum_JH, color="Jharkhand", size =1.05)) +
  geom_line(data =  datatrf, aes(x = x, y = cum_KN, color="Karnataka", size =1.05))+
  geom_line(data =  datatrf, aes(x = x, y = cum_KR, color="Kerala", size =1.05)) +
  geom_line(data =  datatrf, aes(x = x, y = cum_MP, color="Madhya Pradesh", size =1.05)) +
  geom_line(data =  datatrf, aes(x = x, y = cum_MH, color="Maharashtra", size =1.05)) +
  geom_point()+
  labs(x = "Year",
       y = "Road length",
       colour = "States") 
print(p15)

#plotting using ggplot2 for next 5 states
p20 = ggplot() + 
  geom_line(data = datatrf, aes(x = x, y = cum_MN, color="Manipur", size =1.05)) +
  geom_line(data =  datatrf, aes(x = x, y = cum_MG, color="Meghalaya", size =1.05))+
  geom_line(data =  datatrf, aes(x = x, y = cum_MI, color="Mizoram", size =1.05)) +
  geom_line(data =  datatrf, aes(x = x, y = cum_NL, color="Nagaland", size =1.05)) +
  geom_line(data =  datatrf, aes(x = x, y = cum_OD, color="Odisha", size =1.05)) +
  geom_point()+
  labs(x = "Year",
       y = "Road length",
       colour = "States") 
print(p20)

#plotting using ggplot2 for next 5 states
p25 = ggplot() + 
  geom_line(data = datatrf, aes(x = x, y = cum_PJ, color="Punjab", size =1.05)) +
  geom_line(data = datatrf, aes(x = x, y = cum_RJ, color="Rajasthan", size =1.05)) +
  geom_line(data =  datatrf, aes(x = x, y = cum_SI, color="Sikkim", size =1.05))+
  geom_line(data =  datatrf, aes(x = x, y = cum_TN, color="Tamil Nadu", size =1.05)) +
  geom_line(data =  datatrf, aes(x = x, y = cum_TG, color="Telangana", size =1.05)) +

  geom_point()+
  labs(x = "Year",
       y = "Road length",
       colour = "States") 
print(p25)

#plotting using ggplot2 for next 5 states
p30 = ggplot() + 
  geom_line(data =  datatrf, aes(x = x, y = cum_TR, color="Tripura", size =1.05)) +
  geom_line(data =  datatrf, aes(x = x, y = cum_UK, color="Uttarakhan", size =1.05))+
  geom_line(data =  datatrf, aes(x = x, y = cum_UP, color="Uttar Pradesh", size =1.05)) +
  geom_line(data =  datatrf, aes(x = x, y = cum_WB, color="West Bengal", size =1.05)) +
  geom_point()+
  labs(x = "Year",
       y = "Road length",
       colour = "States") 
print(p30)

#plotting using ggplot2 for UTs
p_ut = ggplot() + 
  geom_line(data =  datatrf, aes(x = x, y = cum_AN, color="Andaman and Nicobar", size =1.05)) +
  geom_line(data =  datatrf, aes(x = x, y = cum_CH, color="Chandigarh", size =1.05))+
  geom_line(data =  datatrf, aes(x = x, y = cum_DN, color="Dadar and Nagar", size =1.05)) +
  geom_line(data =  datatrf, aes(x = x, y = cum_DD, color="Daman and Diu", size =1.05)) +
  geom_line(data =  datatrf, aes(x = x, y = cum_DL, color="Delhi", size =1.05))+
  geom_line(data =  datatrf, aes(x = x, y = cum_LK, color="Lakshadweep", size =1.05)) +
  geom_line(data =  datatrf, aes(x = x, y = cum_PU, color="Puducherry", size =1.05)) +
  geom_point()+
  labs(x = "Year",
       y = "Road length",
       colour = "States") 
print(p_ut)


#arranging data of all states in one window
library("cowplot")
plot_grid(p5,p10,p15,p20,p25,p30,
          ncol = 2, nrow = 3)
