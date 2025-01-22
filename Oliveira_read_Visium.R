library(VisiumIO)
visPath <- "~/Downloads/CRC_data/Visium/"
vis <- TENxVisium(
  spacerangerOut = visPath, processing = "filtered", images = "lowres",
  format = "h5"
) |> import()
vis

library(SpatialExperiment)
rownames(vis) <- rowData(vis)$Symbol
rownames(vis) <- make.unique(rownames(vis))

counts(vis) <- as(counts(vis), "dgCMatrix")
vis@int_metadata$imgData$data[[1]] <- as(getImg(vis), "LoadedSpatialImage")


## Sanity check -------------------------------------
counts(vis)[1:5, 1:5] # dgCMatrix class
imgData(vis)$data # no absolute path in imgSource()

dim(vis)
# [1] 18085  4269

table(grepl("HSPA14", rownames(vis)))
rownames(vis)[grepl("HSPA14", rownames(vis))]

table(vis$in_tissue)

imgData(vis)$data

library(ggspavis)
plotVisium(vis, zoom = TRUE)





