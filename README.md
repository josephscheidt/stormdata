# Storm Data Processing

This readme contains more detailed information on the processing done on the raw storm database from the National Oceanic and Atmospheric Administration.


##State corrections

Three observations in the raw data contained errors in the state variable, as shown with 
```{r}
unique(rawdata$STATE)
```

Which returns all 50 states, plus DC, AS - American Samoa, GU - Guam, MH - Marshall Islands, VI - Virgin Islands, and various bodies of water.


The following code block was used to analyse the state codes and in the process three errors were found.

```{r}
grep("ST", rawdata$STATE)
statesubset <- rawdata[grep("ST", rawdata$STATE),]
```

This was repeated for each error. The detailed list of errors, reference numbers, and corrected states is below.

1. 203904 ST: remarks column indicates this mostly took place in Kansas - corrected to KS
2. 773819 XX: remarks column indicates this was a thunderstorm across the St. Lawrence River - corrected to SL
3. 881141 XX: remarks column indicates this was a thunderstorm across the Thousand Islands region of the St. Lawrence River - corrected to SL