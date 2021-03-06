# gcd
[![Travis-CI Build Status](https://travis-ci.org/mike-decarlo/gcd.svg?branch=master)](https://travis-ci.org/mike-decarlo/gcd) [![AppVeyor Build Status](https://ci.appveyor.com/api/projects/status/github/mike-decarlo/gcd?branch=master&svg=true)](https://ci.appveyor.com/project/mike-decarlo/gcd) [![codecov](https://codecov.io/gh/mike-decarlo/gcd/branch/master/graph/badge.svg)](https://codecov.io/gh/mike-decarlo/gcd)

The {gcd} package for R contains several tools for working with latitude and longitude values and obtaining estimated distances between points. The name of the package comes from the term "great circle distance" used to describe distances on the surface of the "Great Circle" (Earth). There are a few different methods for estimating the distance with varying trade-offs of efficiency vs. accuracy.
- Spherical Law of Cosines (slc): assumes spherical shape; sensitive to very close distances
- Haversine formula (haversine): assumes spherical shape; more robust to close distances
- Vincenty inverse formula for ellipsoids (vincenty): uses ellipsoid shape with Earth's polar radius and equatorial radius
Using these methods, the {gcd} package allows users to make easy measurements from place to place on the Earth's surface in km or miles.

Also in this package are functions to take advantage of the Google and HERE APIs that perform geocoding and routing analysis. From this geocoded cooordinates and a standard set of location components can be returned from a single address string. Additionally, the drive time (both) and distance (Google only) between two points can be retrieved.

## Getting Started


### Prerequisites

Some prerequisites to getting this product up and running in R:
- Install R (https://www.r-project.org/)
- Install RStudio (recommended) (https://www.rstudio.com/)
- Download and install the {devtools} package from CRAN
  - From R/RStudio console enter: <code>install.packages("devtools")</code>

If planning to use Google's geocoding API services
- https://developers.google.com/maps/documentation/

If planning to use HERE"s geocoding API services
- https://developer.here.com/documentation

### Installing

Now that R is setup (with or without RStudio) and the {devtools} package is installed, it's possible to start downloading and installing R packages directly from Github. To download, install, and start using the {gcd} package follow the steps:
- Download and install the {gcd} package from Github
  - From R/RStudio console enter: <code>remotes::install_github("mike-decarlo/gcd")</code>
- Load the {gcd} package library
  - From R/RStudio console enter: <code>library(gcd)</code>

## Authors

* **Mike DeCarlo** - *Author, Maintainer* - [mike-decarlo](https://github.com/mike-decarlo)

## License

This project is licensed under the GPL-3 License - see the [LICENSE](LICENSE) file for details

## Acknowledgments

* [Mario Pineda-Krch](http://pineda-krch.com/)
* The reasoning behind this product is to supply an easy solution for geocoding and geodesic distance calculation for a client
