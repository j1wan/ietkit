#' Strip and Split
#'
#' strip the first and last elements, then split the rest
#' @param l a vector
#' @param n.split the number of bins to split into
#' @param n.strip the number (or proportion) of elements to strip at each end
#' @export
#'
StripAndSplit <- function(l, n.split = 10, n.strip = 0) {
  if (n.strip < 1)
    n.strip <- floor(length(l) * n.strip)
  l <- l[(n.strip + 1):(length(l) - n.strip)]
  n <- length(l)
  m <- floor(n/n.split)
  return(lapply(1:n.split, function(i) l[((i-1)*m+1):(i*m)]))
}
