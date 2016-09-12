#' Kernel Density Estimation for Inter-event Times
#'
#' This function receives
#' @param intervals a vector of inter-event times in seconds
#' @export
#' @examples
#' intervals = c(1,5,2,3,15,2,354374,124135,352,234,14,5331)
#' KDE.int(intervals)
#'
KDE.int <- function(intervals) {
  intervals[intervals == 0] <- 1
  x <- log2(intervals) # log(intervals, 2)
  h <- bw.nrd0(x)

  if (h < 0.5) {
    h <- 0.5
  } else if (h > 1) {
    h <- 1
  }

  w <- 1/pnorm(0, mean = x, sd = h, lower.tail = F)
  # P <- density(x, from = .param.int$from, to = .param.int$to, n = .param.int$n, bw = h, weights = w/length(x), kernel = 'g')
  P <- density(x, from = .param.int$from, to = .param.int$to, n = .param.int$n, bw = h, kernel = 'g')
  P$y[P$x < 0] <- 0
  return(P$y)
}
