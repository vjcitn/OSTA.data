BiocManager::install("BiocIO")
devtools::install_github("https://github.com/waldronlab/VisiumIO")

library(VisiumIO)
visPath <- "~/Downloads/janesick_vis/"
vis <- TENxVisium(
  spacerangerOut = visPath, processing = "filtered", images = "lowres",
  format = "h5"
) |> import()
vis
