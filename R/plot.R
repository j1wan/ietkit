#' HistInterval
#'
#' blabla
#' @param intervals a vector of inter-event times
#' @export
#'
HistInterval <- function(intervals, main=''){ # TODO: add log
  intervals[intervals==0] = 1
  hist(
    log(intervals, 2),
    xlim=c(-4, 28), ylim=c(0, 0.3), breaks=0:30, probability=T,
    main=main,
    axes=F,
    border=NA,
    col='gray', xaxs='i' #, yaxs='i'
  )
  axis(2)
  axis(
    1,
    log(c(.1, 1, 10, 60, 600, 3600, 3600*24, 3600*24*7, 3600*24*7*10, 3600*24*7*52),2),
    c('0.1s', '1s', '10s', '1m', '10m', '1h', '1d', '1w', '10w', '1y'))
}




#' @export
.kYears <- 2000:2020

#' @export
.date.iso.str <- as.vector(outer(.kYears, 01:12, function(y, m) paste(y, m, '01', sep = '-')))

#' @export
.date.abb.str <- as.vector(outer(.kYears, 01:12, function(y, m) paste(month.abb[m], sprintf('%02d', y%%1000))))

#' @export
.date.uts <- as.numeric(as.POSIXct(.date.iso.str))

#' @export
.window.label <- parse(text = paste0('italic(W) [', 1:10, ']'))

#' Timestamp plotting
#'
#' Plot timestamps with vertical lines
#' @param UNIX timestamps/epochs of an event series
#' @export
PlotEvent <- function(timestamps, ...) {
  timestamps <- as.POSIXct(timestamps, origin = '1970-01-01')
  plot(NULL,
       xlim = range(timestamps),
       ylim = c(0, 1),
       axes = F,
       ylab = '', ...)
  abline(v = timestamps, col = rgb(0, 0, 0, 1/4))

  axis(1,
       at = axTicks(1),
       labels = as.Date(as.POSIXct(axTicks(1), origin = '1970-01-01')))
  box()

  if (FALSE) {
    text(axTicks(1), par('usr')[3] - 0.15, pos = 3, xpd = TRUE, offset = 0,
         labels = as.Date(as.POSIXct(axTicks(1), origin = '1970-01-01')),
         srt = 30)
  }

}
?text
?axis
# PlotEvent(1000000000 + sample.int(500000000, 500), main = 'AA')
