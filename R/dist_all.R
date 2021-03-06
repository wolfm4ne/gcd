#' Calculates distance between geocoordinates: all methods
#'
#' \code{dist_all} takes inputs of two sets of coordinates
#' in (degree values), one set fo reach location, and a boolean indicator of
#' whether or not to return the results as kilometers (\code{km = TRUE}) or
#' miles (\code{km = FALSE}). The output is three distances using the methods
#' of Spherical Law of Cosines, Haversine formula, and Vincenty inverse formula
#' for ellipsoids.
#' @param lat1 the latitude as radians of the first point
#' @param lon1 the longitude as radians of the first point
#' @param lat2 the latitude as radians of the second point
#' @param lon2 the longitude as radians of the second point
#' @param type defaults to "deg", can also be "rad"
#' @param km boolean argument for whether to return results as km (TRUE) or
#'   miles (FALSE)
#' @examples
#' # Input list of degree values
#' # Longitude values range between 0 and +-180 degrees
#' deg.lon <- runif(2, -180, 180)
#' # Latitude values range between 0 and +-90 degrees
#' deg.lat <- runif(2, -90, 90)
#'
#' # Obtain measures of distance
#' gcd.mi <- dist_all(lon1 = deg.lon[1], lat1 = deg.lat[1]
#'   , lon2 = deg.lon[2], lat2 = deg.lat[2], km = FALSE)
#' @export
dist_all <- function(lat1, lon1, lat2, lon2, type = "deg", km = TRUE) {
  if (type == "deg") {
    lon1 <- gcd::to_rad(lon1)
    lon2 <- gcd::to_rad(lon2)
    lat1 <- gcd::to_rad(lat1)
    lat2 <- gcd::to_rad(lat2)
  } else if (type == "rad") {
    lon1 <- lon1
    lon2 <- lon2
    lat1 <- lat1
    lat2 <- lat2
  } else {
    stop("Error: argument 'type' must have value of 'deg' or 'rad'.\n")
  }
  list(
    sphere = gcd::dist_slc(
      lon1 = lon1
      , lat1 = lat1
      , lon2 = lon2
      , lat2 = lat2
      , type = "rad"
      , km = km
      )
    , haversine = gcd::dist_haversine(
      lon1 = lon1
      , lat1 = lat1
      , lon2 = lon2
      , lat2 = lat2
      , type = "rad"
      , km = km
      )
    , vincenty = gcd::dist_vincenty(
      lon1 = lon1
      , lat1 = lat1
      , lon2 = lon2
      , lat2 = lat2
      , type = "rad"
      , km = km
      )
  )
}