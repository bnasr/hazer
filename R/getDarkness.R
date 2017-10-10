#' The darkness map of an image (0 to 1).
#'
#' @param rgbArray RGB array (W x H x 3) where the third dimension contains R, G and B channels, values varying from 0 to 1.
#' @return a numeric matrix (W x H) giving the darkness for each pixel of the image.
#' @seealso \code{\link{getContrast}}, \code{\link{getBrightness}} and \code{\link{getHazeFactor}}
#' @export
#' @examples
#' library(jpeg)
#'
#' img <- readJPEG(system.file("img", "Rlogo.jpg", package="jpeg"))
#'
#' d <- getDarkness(img)
#'
#' par(mfrow=c(2,1), mar = c(0.5, 1, 0.5, 1))
#'
#' plotRGBArray(img)
#' plotRGBArray(d)

getDarkness <- function(rgbArray){
  dI <- apply(rgbArray, 1:2, min)
  dI
}
