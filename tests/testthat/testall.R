context("all")

library(jpeg)

img <- readJPEG(system.file( "pointreyes.jpg", package="hazer"))

b <- getBrightness(img)
d <- getDarkness(img)
c <- getContrast(img)
h <- getHazeFactor(img)

test_that("test brightness, darkness and contrast", {
  expect_equal(floor(mean(b)*1000), 606)
  expect_equal(floor(mean(d)*1000), 364)
  expect_equal(floor(mean(c)*1000), 242)
})

test_that("test  is number of characters", {
  expect_equal(floor(h$haze*1000), 224)
  expect_equal(floor(h$A0*1000), 712)
})
