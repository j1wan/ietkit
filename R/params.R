######################################
### PARAMETERS FOR KDE + KLD + JSD ###
######################################
#.param.int <- list(from = 0, to = 28, n = 512, x = seq(0, 28, length.out = 512), dx = 28/511)

#' @export
.param.int <- list(from = -4, to = 28, n = 512, x = seq(-4, 28, length.out = 512), dx = 32/511)

#.param.tod <- list(from = circular(5/2*pi), to = circular(pi/2), n = 256, x = seq(0, 24, length.out = 256), dx = 24/255, bw = 24 * 2)
#.param.tow <- list(from = circular(5/2*pi), to = circular(pi/2), n = 256, x = seq(0, 07, length.out = 256), dx = 7/255, bw = 24 * 2 * 7)
#rm(.param.tod, .param.tow)


### DENSITY X ###
#' @export
coor.int <- function(y) return(cbind(.param.int$x, y))
# coor.tod <- function(y) return(cbind(.param.tod$x, y))
# coor.tow <- function(y) return(cbind(.param.tow$x, y))
