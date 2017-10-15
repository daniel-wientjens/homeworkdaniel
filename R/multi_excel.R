#' This is the function to read multiple excel sheets into a dataframe
#'
#' @param file_name
#' @import readxl
#' @import assertthat
#'
#' @return the list of dataframes coming from the excel tabs
#' @export
#'
#' @examples
#' multi_excel("/Users/Daniel/Documents/Courses X/R/data stuff/excell data stuff/verrekening SKi pikken.xlsx")
#'
multi_excel <- function(file_name){
  assert_that(is.dir(dirname(file_name)))
  assert_that(is.readable(file_name))
  assert_that(has_extension(file_name,"xlsx"))

  sheets <- lapply(excel_sheets(file_name), read_excel, path=file_name)
  return(sheets)
}
