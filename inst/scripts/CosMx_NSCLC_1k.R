library(SpatialExperimentIO)
dir = "~/Downloads/Lung9_Rep1"

cos <- readCosmxSXE(dirName = dir, 
                    loadFovPos = TRUE,
                    altExps = c(negprobe="^Neg"),
                    addParquetPaths = TRUE,
                    loadPolygon = FALSE)
cos
# class: SpatialExperiment 
# dim: 960 91972 
# metadata(1): transcripts
# assays(1): counts
# rownames(960): AATK ABL1 ... YES1 ZFP36
# rowData names(0):
#   colnames(91972): 1 2 ... 91971 91972
# colData names(21): fov cell_ID ... y_global_px sample_id
# reducedDimNames(0):
#   mainExpName: NULL
# altExpNames(1): negprobe
# spatialCoords names(2) : CenterX_global_px CenterY_global_px
# imgData names(0):

dim(altExp(cos, "negprobe"))
#     20 91972

metadata(cos)
# $transcripts
# [1] "~/Downloads/Lung9_Rep1/Lung9_Rep1_tx_file.parquet"


