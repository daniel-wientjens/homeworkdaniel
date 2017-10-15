#' read the csv files in a certain folder
#'
#' @param x path to folder
#'
#' @return a list of csv files
#' @export
#'
#' @import assertthat
#'
#'
#' @examples
#' \don't run{
#'
#' my_csv_reader("../path/to/folder")
#'
#' }
#'
my_csv_reader <- function(dir_path=getwd()){
  assert_that(is.dir(dirname(dir_path)))
  assert_that(is.readable(dirname(dir_path)))

  csvs <- list.files(path=dir_path, pattern="*\\.csv$",full.names = TRUE)
  csv_list <- lapply(csvs, read.csv)
  return(csv_list)
}
