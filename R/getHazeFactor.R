#' The haze factor for a given RGB array.
#'
#' @param rgbArray RGB array (W x H x 3) where the third dimension contains R, G and B channels, values varying from 0 to 1.
#' @param mu function parameter
#' @param nu function parameter
#' @param sigma function parameter
#' @return a list of two numeric values:haze as haze degree and A0 as the global atmospheric light
#' @seealso \code{\link{getDarkness}}, \code{\link{getBrightness}} and \code{\link{getContrast}}
#' @export
#' @examples
#' library(jpeg)
#'
#' img <- readJPEG(system.file("img", "Rlogo.jpg", package="jpeg"))
#'
#' h <- getHazeFactor(img)
#' d <- getDarkness(img)
#' b <- getBrightness(img)
#' c <- getContrast(img)
#'
#' par(mfcol = c(2, 2), mar = c(0.5, 0.5, 0.5, 0.5))
#'
#' plotRGBArray(img)
#' mtext(text = 'RGB', side = 3, line = -2, adj = 0.05, font = 2, col = 'red')
#' mtext(text = paste0('Hazeness: ', signif(h$haze, 2)), side = 1, line = -2, adj = 0.05)
#' mtext(text = paste0('A0: ', signif(h$A0, 2)), side = 1, line = -1, adj = 0.05)
#'
#' plotRGBArray(d)
#' mtext(text = 'Darkness', side = 3, line = -2, adj = 0.05, font = 2, col = 'red')
#'
#' plotRGBArray(b)
#' mtext(text = 'Brightness', side = 3, line = -2, adj = 0.05, font = 2, col = 'red')
#'
#' plotRGBArray(c)
#' mtext(text = 'Contrast', side = 3, line = -2, adj = 0.05, font = 2, col = 'red')
#'
getHazeFactor <- function(rgbArray, mu = 5.1, nu = 2.9, sigma = .2461){

  dI <- getDarkness(rgbArray)

  bI <- getBrightness(rgbArray)

  cI <- bI-dI

  # d <- apply(dI, 2, mean)
  d <- mean(dI)

  # b <- apply(bI, 2, mean)
  b <- mean(bI)

  c <- b - d

  lambda <- 1/3

  # bmax <- apply(bI, 2, max)
  bmax <- max(bI)

  A0 <- lambda*bmax + (1-lambda)*b

  x1 <- (A0-d)/A0
  x2 <- c/A0

  w <- exp(-.5*(mu*x1 + nu*x2) + sigma)

  w[is.nan(w)] <- NA

  list(haze=w, A0=A0)
}
