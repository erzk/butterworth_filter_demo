# load the epoch and turn into time series
ABRfile <- ts(scan("signal.txt", sep=""), start=c(-0.049, 0.350), frequency=16384)