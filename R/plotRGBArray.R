#' Plotting an RGB array on the graphics.
#'
#' @param rgbArray RGB array (W x H x 3) where the third dimension contains R, G and B channels, values varying from 0 to 1.
#' @param xlim range of the x axis.
#' @param ylim range of the y axis.
#' @param bty bty value to pass to the graphics
#' @return a rasterImage output plotted on the base R graphics.
#' @seealso \code{\link{plotRGBArray}} wraps the \code{graphics::rasterImage} function
#' @importFrom graphics rasterImage plot
#' @export
#' @examples
#' library(jpeg)
#' img <- readJPEG(system.file("img", "Rlogo.jpg", package="jpeg"))
#' plotRGBArray(img)
plotRGBArray <- function(rgbArray, xlim = c(0,1), ylim = c(0,1),  bty = 'o'){

  plot(NA,
       xlim = xlim, ylim = ylim,
       xaxt = 'n', yaxt = 'n',
       xlab='', ylab='',
       bty = bty)

  rasterImage(rgbArray,
              xlim[1], ylim[1],
              xlim[2], ylim[2])
}
