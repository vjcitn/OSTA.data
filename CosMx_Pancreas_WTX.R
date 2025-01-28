library(SpatialExperimentIO)

dir = "~/Downloads/Pancreas_CosMx_WTX"
cos <- readCosmxSXE(dirName = dir, 
                    loadFovPos = TRUE,
                    altExps = c(negprobe="^Neg", syscont ="^Sys"),
                    addParquetPaths = TRUE,
                    txPattern = "tx_file.parquet", 
                    polygonPattern = "polygons.parquet")
cos
# class: SpatialExperiment 
# dim: 18946 48944 
# metadata(2): transcripts polygons
# assays(1): counts
# rownames(18946): A1BG A1CF ... ZZEF1 ZZZ3
# rowData names(0):
#   colnames(48944): 1 2 ... 48943 48944
# colData names(44): fov Run_Tissue_name ... Order sample_id
# reducedDimNames(0):
#   mainExpName: NULL
# altExpNames(2): negprobe syscont
# spatialCoords names(2) : CenterX_global_px CenterY_global_px
# imgData names(0):

dim(altExp(cos, "negprobe"))
#     20 48944
dim(altExp(cos, "syscont"))
#     20 48944

metadata(cos)
# $transcripts
# [1] "~/Downloads/Pancreas_CosMx_WTX/tx_file.parquet"
# 
# $polygons
# [1] "~/Downloads/Pancreas_CosMx_WTX/polygons.parquet"


