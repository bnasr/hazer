if(!require("devtools")) {install.packages("devtools"); library(devtools)}
if(!require("roxygen2")) {devtools::install_github("klutometis/roxygen"); library(roxygen2)}

# create('~/Projects/hazer/')
# rm(list = ls())
document('.')
install('.')

