library(VisiumIO)
visfold <- "~/Downloads/CRC_data/VisiumHD/"

vishd <- VisiumIO::TENxVisiumHD(
  spacerangerOut = visfold, images = "lowres", processing = "filtered", 
  bin_size = "016", format = "h5"
) |> import()

library(SpatialExperiment)
rownames(vishd) <- rowData(vishd)$Symbol
rownames(vishd) <- make.unique(rownames(vishd))

counts(vishd) <- as(counts(vishd), "dgCMatrix")
vishd@int_metadata$imgData$data[[1]] <- as(getImg(vishd), "LoadedSpatialImage")


## Sanity check -------------------------------------
counts(vishd)[1:5, 1:5] # dgCMatrix class
imgData(vishd)$data # no absolute path in imgSource()

dim(vishd)
# [1] 18085  545913

table(grepl("HSPA14", rownames(vishd)))
rownames(vishd)[grepl("HSPA14", rownames(vishd))]

table(vishd$in_tissue)
vishd$sum <- colSums(counts(vishd))

library(ggspavis)
plotVisium(vishd, zoom = TRUE)
plotVisium(vishd, zoom = TRUE, annotate = "sum", show_axes = TRUE) + 
  ylim(c(350, 390)) + xlim(c(450, 500))
  
