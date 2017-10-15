#' Drawing a graph of a name
#'
#' @param the_name a character
#' @param the_sex a character
#'
#' @import prenoms
#' @import dplyr
#' @import ggplot2
#' @import assertthat
#'
#' @return The graph of the name in question
#' @export
#'
#' @examples
#' draw_a_name("Daniel", "M")
#'

draw_a_name <- function(the_name, the_sex){
  assert_that(the_sex %in% c("M", "F"))
  assert_that(is.string(the_name))

  temp <- prenoms::prenoms %>%
    filter(sex==the_sex, name==the_name) %>%
    group_by(year,sex,name) %>%
    summarize(n=sum(n)) %>%
    ggplot(aes(x=year,y=n)) +
    geom_line() +
    labs(title=the_name)
  return(temp)
}
