

dat<-fredr(series_id = "CZEB6BLTT02STSAQ")

#Base Model

dat$value<-as.ts(dat$value)
dat$date<-ymd(dat$date)
ser<-dat[,c(1,3)]

ggplot(ser, aes(x=date, y=value))+
  geom_line() +
  ggtitle('Total Balance as % of GDP for the Czech Republic') +
  theme_ipsum_tw(grid="XY", axis="xy") +
  geom_smooth()


library(nonlinearTseries)

grid<-selectSETAR(dat$value, m=3)

grid

fit<-setar(dat$value, mL=2, mH=3, th=-1.169727)

forec<-predict(fit, n.ahead = 7)

plot(forec)

dates<-seq(as.Date(max(ser$date)), length.out=8 , by=90)

forec = as.data.frame((forec))

forec$dat<-subset(dates, dates > max(ser$date))

forec<-forec[,c(2,1)]
names(forec)<-names(ser)
ser1<-union_all(ser,forec)

ser1$part<-ifelse(ser1$date> max(ser$date), 'predicted', 'real')

library(ggforce)
library(plotly)

ggplotly(ggplot(ser1, aes(x=date, y=value, color= part))+
  ggtitle('Total Balance as % of GDP for the Czech Republic') +
  theme_ipsum_tw(grid="XY", axis="xy") +
  geom_line()+
  geom_smooth())

  
  