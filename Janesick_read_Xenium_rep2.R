library(SpatialExperimentIO)
xePath <- "~/Downloads/BC_data/Xenium_rep2/"
xe <- readXeniumSXE(xePath)

library(SpatialExperiment)
rownames(xe) <- rowData(xe)$Symbol
