library(VisiumIO)
visfold <- "~/Downloads/CRC_data/VisiumHD/"

vishd <- VisiumIO::TENxVisiumHD(
  spacerangerOut = visfold, images = "lowres", bin_size = "008",
  format = "h5"
) |> import()
