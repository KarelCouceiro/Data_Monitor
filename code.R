library(fredr)
library(forecast)
fredr_set_key("ed43ed5f8fa6abd9fb6236a0f64445f5")

#Balance of payments BPM6: Current account Balance: Total: Total Balance as % of GDP for the Czech Republic

dat<-fredr(series_id = "CZEB6BLTT02STSAQ")