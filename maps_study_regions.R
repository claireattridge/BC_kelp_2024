## Creating map of British Columbia study sites
## Project: BC kelp 2024
## Author: Claire Attridge
## Origin: October 2024

## Loading packages
library(tidyverse)
library(MetBrewer)
library(sf)
library(raster)

##### Setting coordinate systems & loading base map ----


## Setting the geom and proj systems
latlon <- st_crs(4326) # For baseline WGS84 geometry
proj <- st_crs(3005) # ESPG code for BC Albers projection


## Loading the shapefile and projecting coordinate system
# Hakai British Columbia shapefile (GeoBC, TRIM)
# "Contains information licensed under the Open Government Licence – Canada."


## Setting the preexisting crs as WGS84
## Reprojecting the geometry into BC/Albers (NAD83)
land <- sf::st_read("./Maps_raw/COAST_TEST2.shp") %>%
  st_as_sf(crs = latlon) %>%
  st_transform(proj)


##### Cropping to save maps for each region -----

####
### British Columbia
####

## Setting the bounds to encompass all study regions in BC
ymax <- 55.00
ymin <- 48.00
xmax <- -122.00
xmin <- -134.00


## Making corners for this extent
corners_bc <- st_multipoint(matrix(c(xmax,xmin,ymax,ymin),ncol=2)) %>% 
  st_sfc(crs=latlon) %>%
  st_sf() %>%
  st_transform(proj) 
plot(corners_bc)


## Cropping the Hakai map to the extent
land_bc <- land %>%
  st_crop(st_bbox(corners_bc))


## Saving this cropped version of the map shapefile
st_write(land_bc, "./Maps_manipulated/Hakai_map_BritishColumbia.shp")



####
### Haida Gwaii
####

## Setting the bounds to encompass study sites in Haida Gwaii
ymax <- 53.5
ymin <- 51.7
xmax <- -133.50
xmin <- -130.50


## Making corners for this extent
corners_hg <- st_multipoint(matrix(c(xmax,xmin,ymax,ymin),ncol=2)) %>% 
  st_sfc(crs=latlon) %>%
  st_sf() %>%
  st_transform(proj) 
plot(corners_hg)


## Cropping the Hakai map to the extent
land_hg <- land %>%
  st_crop(st_bbox(corners_hg))


## Saving this cropped version of the map shapefile
st_write(land_hg, "./Maps_manipulated/Hakai_map_HaidaGwaii.shp", append=F)



####
### Central Coast
####

## Setting the bounds to encompass study sites in Central Coast
ymax <- 53.0
ymin <- 51.5
xmax <- -129.5
xmin <- -127.00


## Making corners for this extent
corners_cc <- st_multipoint(matrix(c(xmax,xmin,ymax,ymin),ncol=2)) %>% 
  st_sfc(crs=latlon) %>%
  st_sf() %>%
  st_transform(proj) 
plot(corners_cc)


## Cropping the Hakai map to the extent
land_cc <- land %>%
  st_crop(st_bbox(corners_cc))


## Saving this cropped version of the map shapefile
st_write(land_cc, "./Maps_manipulated/Hakai_map_CentralCoast.shp", append=F)



####
### Broughton Archipelago
####

## Setting the bounds to encompass study sites in the Broughton Archipelago
ymax <- 50.80
ymin <- 50.45
xmax <- -127.20
xmin <- -126.25


## Making corners for this extent
corners_ba <- st_multipoint(matrix(c(xmax,xmin,ymax,ymin),ncol=2)) %>% 
  st_sfc(crs=latlon) %>%
  st_sf() %>%
  st_transform(proj) 
plot(corners_ba)


## Cropping the Hakai map to the extent
land_ba <- land %>%
  st_crop(st_bbox(corners_ba))


## Saving this cropped version of the map shapefile
st_write(land_ba, "./Maps_manipulated/Hakai_map_BroughtonArchipelago.shp", append=F)



####
### Quadra
####

## Setting the bounds to encompass study sites in Quadra Island
ymax <- 50.40
ymin <- 49.95
xmax <- -125.55
xmin <- -124.95


## Making corners for this extent
corners_qi <- st_multipoint(matrix(c(xmax,xmin,ymax,ymin),ncol=2)) %>% 
  st_sfc(crs=latlon) %>%
  st_sf() %>%
  st_transform(proj) 
plot(corners_qi)


## Cropping the Hakai map to the extent
land_qi <- land %>%
  st_crop(st_bbox(corners_qi))


## Saving this cropped version of the map shapefile
st_write(land_qi, "./Maps_manipulated/Hakai_map_QuadraIsland.shp", append=F)



####
### Nanaimo
####

## Setting the bounds to encompass study sites in Nanaimo
ymax <- 49.36
ymin <- 48.95
xmax <- -124.00
xmin <- -123.50


## Making corners for this extent
corners_n <- st_multipoint(matrix(c(xmax,xmin,ymax,ymin),ncol=2)) %>% 
  st_sfc(crs=latlon) %>%
  st_sf() %>%
  st_transform(proj) 
plot(corners_n)


## Cropping the Hakai map to the extent
land_n <- land %>%
  st_crop(st_bbox(corners_n))


## Saving this cropped version of the map shapefile
st_write(land_n, "./Maps_manipulated/Hakai_map_Nanaimo.shp", append=F)



####
### Sooke
####

## Setting the bounds to encompass study sites in Sooke
ymax <- 48.45
ymin <- 47.95
xmax <- -123.90
xmin <- -123.45


## Making corners for this extent
corners_s <- st_multipoint(matrix(c(xmax,xmin,ymax,ymin),ncol=2)) %>% 
  st_sfc(crs=latlon) %>%
  st_sf() %>%
  st_transform(proj) 
plot(corners_s)


## Cropping the Hakai map to the extent
land_s <- land %>%
  st_crop(st_bbox(corners_s))


## Saving this cropped version of the map shapefile
st_write(land_s, "./Maps_manipulated/Hakai_map_Sooke.shp", append=F)
