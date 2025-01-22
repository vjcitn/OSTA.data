library(readxl)
Cell_Barcode_Type_Matrices.xlsx <- "https://cdn.10xgenomics.com/raw/upload/v1695234604/Xenium%20Preview%20Data/Cell_Barcode_Type_Matrices.xlsx"
xe1_unsup <- read_excel("~/Downloads/Cell_Barcode_Type_Matrices.xlsx", sheet = "Xenium R1 Fig 3 (unsupervised)")
xe1_sup <- read_excel("~/Downloads/Cell_Barcode_Type_Matrices.xlsx", sheet = "Xenium R1 Fig1-5 (supervised)")

colnames(xe1_unsup) <- c("Barcode", "Annotation_unsupervised")
colnames(xe1_sup) <- c("Barcode", "Annotation_supervised")

library(dplyr)

xe1_anno <- xe1_unsup %>%
  full_join(xe1_sup, by = "Barcode") %>%
  arrange(Barcode)

write.csv(xe1_anno, "~/Downloads/Annotations/10x_Xenium_rep1_Annotation.csv")