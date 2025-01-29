library(SingleCellExperiment)
FlexOutPath <- "~/Downloads/CRC_data/Chromium"

sce <- DropletUtils::read10xCounts(file.path(FlexOutPath, "filtered_feature_bc_matrix.h5"), col.names = TRUE)
rownames(sce) <- rowData(sce)$Symbol
rownames(sce) <- make.unique(rownames(sce))

scemeta <- read.csv(file.path(FlexOutPath, "SingleCell_MetaData.csv"))
CD <- as.data.frame(colData(sce))
CD <- merge(CD, scemeta, by = "Barcode")
CD <- CD[, names(CD) != "Sample"]
colData(sce) <- as(CD, "DFrame")

sce
dim(sce)
# [1]  18082 279609

table(sce$Patient)
# P1CRC P2CRC P2NAT P3CRC P3NAT P4CRC P5CRC P5NAT
# 20491 41933 32801 50652 41237 31007 24615 36873

table(sce$BC)
# BC1   BC2   BC3   BC4
# 62424 81659 61488 74038

table(sce$QCFilter)
#   Keep Remove
# 260506  19103

table(sce$Level1)
# B cells           Endothelial            Fibroblast     Intestinal Epithelial           Myeloid
# 33611                  7969                 28653                   22763                 25105
# Neuronal           QC_Filtered         Smooth Muscle               T cells                 Tumor
# 4199                     19103              43308                   29272                 65626

table(sce$Level2)
#             Adipocyte                         CAF              CD4 T cell    CD8 Cytotoxic T cell             Endothelial
#               83                            12437                   18396                   10938                    6940
#         Enteric Glial                  Enterocyte              Epithelial              Fibroblast                  Goblet
#             3680                            1739                    7432                   12214                   20956
# Lymphatic Endothelial                  Macrophage                    Mast                Mature B                  mRegDC
#             1095                           19442                    1925                    8318                     404
#         Myofibroblast              Neuroendocrine              Neutrophil                     pDC               Pericytes
#              972                             529                    3138                     119                    3046
#             Plasma        Proliferating Immune II             QC_Filtered      SM Stress Response           Smooth Muscle
#             23991                           2560                   19103                   12812                   14663
#              Tuft                        Tumor I                Tumor II               Tumor III                 Tumor V
#              101                           34844                    8292                   13146                    7893
# Unknown III (SM)                            vSM
#              1784                           6617
