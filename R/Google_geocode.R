#' Get geocoding information using Google Geocode API
#'
#' \code{Google_geocode} is designed to take an address
#'   string, and user app key. The function queries the Google Geocode
#'   API
#' \code{
#'   (https://developers.google.com/maps/documentation/geocoding/start)
#'   }
#'   and returns the various components from the JSON output code. This
#'   geocoding information from the JSON is originally returned as a vector.
#' @param address a string; the address to be queried for geocoded information.
#' @param key a string; the user's Google API key
#' @param verbose a boolean; \code{TRUE} to display json webaddress,
#'   \code{FALSE} to not display json webaddress
#' @return location information for the entered address string:
#'   original_address, latitude, longitude, formatted_address, street_number
#'   , route, locality (city), administrative_area_3 (district)
#'   , administrative_area_2 (county), administrative_area_1 (state)
#'   , country, postal_code
#' @importFrom jsonlite fromJSON
#' @importFrom RCurl curlEscape curlUnescape
#' @export
Google_geocode <- function(address = NULL, key = NULL, verbose = FALSE) {
  base <- "https://maps.googleapis.com/maps/api/geocode/json?"
  address <- paste0("address=", RCurl::curlEscape(address))
  key <- paste0("&key=", RCurl::curlEscape(key))
  request_url <- paste0(base, address, key)
  if (verbose == TRUE) {
    message(request_url)
  }
  json <- jsonlite::fromJSON(request_url, flatten = FALSE)
  types <- unlist(lapply(json$results$address_components[[1]]$types, `[[`, 1))
  names <- unlist(
    lapply(json$results$address_components[[1]]$long_name, `[[`, 1)
    )
  if (json$status == "OK") {
    return(unlist(c(
      "original_address" =  substr(
        RCurl::curlUnescape(address)
        , 9
        , nchar(RCurl::curlUnescape(address))
        )
      , "latitude" = json$results$geometry$location$lat
      , "longitude" = json$results$geometry$location$lng
      , "formatted_address" = json$results$formatted_address
      , "street_number" = ifelse(
        !is.na(match("street_number", types))
        , names[which(types == "street_number")]
        , NA
        )
      , "route" = ifelse(
        !is.na(match("route", types))
        , names[which(types == "route")]
        , NA
      )
      , "neighborhood" = ifelse(
        !is.na(match("neighborhood", types))
        , names[which(types == "neighborhood")]
        , NA
      )
      , "sublocality" = ifelse(
        !is.na(match("political", types))
        , names[which(types == "political")]
        , NA
      )
      , "city" = ifelse(
        !is.na(match("locality", types))
        , names[which(types == "locality")]
        , NA
      )
      , "district" = ifelse(
        !is.na(match("administrative_area_level_3", types))
        , names[which(types == "administrative_area_level_3")]
        , NA
      )
      , "county" = ifelse(
        !is.na(match("administrative_area_level_2", types))
        , names[which(types == "administrative_area_level_2")]
        , NA
      )
      , "state" = ifelse(
        !is.na(match("administrative_area_level_1", types))
        , names[which(types == "administrative_area_level_1")]
        , NA
      )
      , "country" = ifelse(
        !is.na(match("country", types))
        , names[which(types == "country")]
        , NA
      )
      , "postal_code" = ifelse(
        !is.na(match("postal_code", types))
        , names[which(types == "postal_code")]
        , NA
      )
      )
    ))
  } else {
    stop(
      paste0(
        "\nQuery returned status "
        , json$status
        , ".\n"
        )
    )
  }
}
