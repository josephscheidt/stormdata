
grep("XX", rawdata$STATE)
mistake <- rawdata[grep("XX", rawdata$STATE),]


unique(rawdata$EVTYPE)
mistake <- rawdata[grep("3/27/1997", rawdata$BGN_DATE),]

ok <- mistake[grep("OK", mistake$STATE),]

stormdatatest <- rawdata

stormdatatest[stormdatatest$REFNUM==203904, 7] <- "KS"
stormdatatest[stormdatatest$REFNUM==773819, 7] <- "SL"
stormdatatest[stormdatatest$REFNUM==881141, 7] <- "SL"

library(dplyr)

stormdatatest$EVTYPE <- toupper(as.character(stormdatatest$EVTYPE))
stormdatatest <- stormdatatest[-grep("^SUMMARY.*", stormdatatest$EVTYPE),]

unique(stormdatatest$EVTYPE)
