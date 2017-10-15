#' Function which will save a data frame to a csv file
#'
#' @param df dataframe
#' @param file_name name of the saved file
#' @import assertthat
#'
#'
#' @return
#' @export
#'
#' @examples
#' save_as_csv(iris, "data.iris")
save_as_csv <- function(df, file_name){
  assert_that(is.dir(dirname(file_name)))
  assert_that(is.writeable(dirname(file_name)))
  assert_that(is.data.frame(df))

  if(!grepl("*\\.csv$",file_name))
    file_name <- paste(file_name,".csv",sep="")
    write.csv(df, file=file_name, row.names = F)
  return()
}
