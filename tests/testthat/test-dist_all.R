context("test-dist_all")

test_that("Errors when one of the four geocoords are non-numeric", {
  x1 <- 90
  x2 <- 90
  y1 <- 80
  y2 <- 80
  expect_error(
    dist_all(lat1 = as.character(x1), lon1 = y1, lat2 = x2, lon2 = y2)
  )
  expect_error(
    dist_all(lat1 = x1, lon1 = as.character(y1), lat2 = x2, lon2 = y2)
  )
  expect_error(
    dist_all(lat1 = x1, lon1 = y1, lat2 = as.character(x2), lon2 = y2)
  )
  expect_error(
    dist_all(lat1 = x1, lon1 = y1, lat2 = x2, lon2 = as.character(y2))
  )
})

test_that("Returns equivalent value for equivalent deg and rad", {
  d1 <- 45
  d2 <- 60
  d3 <- 70
  d4 <- 90
  r1 <- to_rad(d1)
  r2 <- to_rad(d2)
  r3 <- to_rad(d3)
  r4 <- to_rad(d4)
  dist_deg <- dist_all(d1, d2, d3, d4, type = "deg")
  dist_rad <- dist_all(r1, r2, r3, r4, type = "rad")
  expect_equal(dist_deg, dist_rad)
})

test_that("Error when 'type' is neither 'deg' or 'rad'", {
  expect_error(dist_all(90, 70, 80, 80, type = "foo"))
})
