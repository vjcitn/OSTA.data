library(SingleCellExperiment)
FlexOutPath <- "~/Downloads/BC_data/Chromium"

sce <- DropletUtils::read10xCounts(file.path(FlexOutPath, "filtered_feature_bc_matrix.h5"), col.names = TRUE)
rownames(sce) <- rowData(sce)$Symbol
rownames(sce) <- make.unique(rownames(sce))

scemeta <- read.csv(file.path(FlexOutPath, "Chrom_annotation.csv"))
CD <- as.data.frame(colData(sce))
CD <- CD |> left_join(scemeta, by = "Barcode") |>
  select(-Sample)
colData(sce) <- as(CD, "DFrame")

sce
dim(sce)