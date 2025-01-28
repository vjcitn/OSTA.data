library(SpatialExperimentIO)

dir = "~/Downloads/HumanFC"
cos <- readCosmxSXE(dirName = dir, 
                    loadFovPos = TRUE,
                    altExps = c(negprobe="^Neg", falsecode="^FalseCode"),
                    addParquetPaths = TRUE,
                    txPattern = "tx_file.parquet", 
                    polygonPattern = "polygons.parquet")
cos
# class: SpatialExperiment 
# dim: 6602 188686 
# metadata(2): transcripts polygons
# assays(1): counts
# rownames(6602): A1BG A2M ... FalseCode98 FalseCode99
# rowData names(0):
#   colnames(188686): 1 2 ... 188685 188686
# colData names(82): fov cell_ID ... Y_mm sample_id
# reducedDimNames(0):
#   mainExpName: NULL
# altExpNames(1): negprobe falsecode
# spatialCoords names(2) : CenterX_global_px CenterY_global_px
# imgData names(0):

dim(altExp(cos, "negprobe"))
#     20 340837
dim(altExp(cos, "falsecode"))
#     324 340837

metadata(cos)
# $transcripts
# [1] "~/Downloads/HumanFC/tx_file.parquet"
# 
# $polygons
# [1] "~/Downloads/HumanFC/polygons.parquet"


