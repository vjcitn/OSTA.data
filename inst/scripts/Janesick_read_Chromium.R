library(SingleCellExperiment)
FlexOutPath <- "~/Downloads/BC_data/Chromium"

sce <- DropletUtils::read10xCounts(file.path(FlexOutPath, "raw_feature_bc_matrix.h5"), col.names = TRUE)
rownames(sce) <- rowData(sce)$Symbol
rownames(sce) <- make.unique(rownames(sce))

scemeta <- read.csv(file.path(FlexOutPath, "10x_Chrom_Annotation.csv"))
CD <- as.data.frame(colData(sce))
CD <- merge(CD, scemeta, by = "Barcode", all.x = TRUE)
CD <- CD[, names(CD) != "Sample"]
colData(sce) <- as(CD, "DFrame")

sce
dim(sce)
