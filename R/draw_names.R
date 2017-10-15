#' Draw multiple names in a graph
#'
#' @param name_vector
#' @import prenoms
#' @import dplyr
#' @import ggplot2
#' @import ggthemes
#' @import assertthat
#' @return the graph of the two names
#' @export
#'
#' @examples
#' draw_names (c("Daniel", "Pierre"))
#'
draw_names <- function(name_vector){
  assert_that(is.character(name_vector))

  temp <- prenoms::prenoms %>%
    filter(name %in% name_vector) %>%
    group_by(year,name) %>%
    summarize(n=sum(n)) %>%
    ggplot(aes(x=year,y=n, color=name)) +
    geom_line()

  return(temp)
}
