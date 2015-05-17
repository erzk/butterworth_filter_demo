# require(signal)

butterHz <- function(signalFile, LowCutOff, HighCutOff, filterOrder){
  # Butterworth band-pass filter function 
  # based on butter_filtfilt.m (eeglab13_4_3b).
  # The function creates a plot of the filtered signal.
  #
  # Args:
  #   signalFile: Vector containing data to filter.
  #   LowCutOff: Numeric value of the low cut-off/high-pass.
  #   HighCutOff: Numeric value of the high cut-off/low-pass.
  #
  # Returns:
  #   The plot showing filtered data.
  #
  recordingFreq <- 16384 # Hz
  NyquistFreq <- recordingFreq/2
  # normalise cut off frequency relative to Nyquist frequency (range 0 to 1)
  LowCutOffNorm <- LowCutOff/NyquistFreq
  HighCutOffNorm <- HighCutOff/NyquistFreq
  # pass band filter values
  cutOff <- c(LowCutOffNorm, HighCutOffNorm)
  # use butter function from signal package
  butterFilt <- butter(filterOrder, cutOff, type="pass")
  # select the file to filter and run Butterworth
  btwFiltSignal <- filtfilt(butterFilt, signalFile)
  # save as ts. specify the value of the FFR epoch.
  btwFiltSignal <- ts(btwFiltSignal, start=c(-0.049, 0.350), # hardcoded epoch values
                      frequency=recordingFreq)
  plot(btwFiltSignal,
       xlab="Time (s)", 
       ylab="Amplitude (mV)",
       ylim=c(-2, 2))
}