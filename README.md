# Bioc spatial book data

```r
if (!require("BiocManager", quietly=TRUE))
    install.packages("BiocManager")
BiocManager::install("estellad/SpatialBook_DataLoad")
```

```r
.list_data()
# [1] "CosMx1k_MouseBrain1"           "Visium_HumanColon_Oliveria"   
# [3] "Xenium_HumanColon_Oliveria"    "Chromium_HumanBreast_Janesick"
# [5] "Chromium_HumanColon_Oliveria"  "Xenium_HumanBreast1_Janesick" 
# [7] "CosMx1k_MouseBrain2"           "CosMx6k_HumanBrain"           
# [9] "VisiumHD_HumanColon_Oliveria"  "Visium_HumanBreast_Janesick"
```

```r
(spe <- .read_data("Xenium_HumanColon_Oliveria"))
# class: SpatialExperiment 
# dim: 541 340837 
# metadata(3): transcripts cell_boundaries nucleus_boundaries
# assays(1): counts
# rownames(541): ABCC8 ACP5 ... UnassignedCodeword_0330 UnassignedCodeword_0338
# rowData names(3): ID Symbol Type
# colnames(340837): aaaadaba-1 aaaadgga-1 ... oikdmkkf-1 oikeebja-1
# colData names(10): cell_id transcript_counts ... nucleus_area sample_id
# reducedDimNames(0):
# mainExpName: NULL
# altExpNames(0):
# spatialCoords names(2) : x_centroid y_centroid
# imgData names(0):
```
