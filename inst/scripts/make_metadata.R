url <- "https://www.10xgenomics.com/products/visium-hd-spatial-gene-expression/dataset-human-crc"

oli <- data.frame(
    BiocVersion="3.21",
    Genome=NA,
    SourceType="Zip",
    SourceUrl=url,
    SourceVersion=NA_character_,
    Species="Homo sapiens",
    TaxonomyId=NA_character_,
    Coordinate_1_based=TRUE,
    DataProvider="10x Genomics",
    Maintainer="Estella Dong <estelladong729@gmail.com>",
    RDataClass=NA_character_,
    DispatchClass="Zip",
    RDataPath="OSTA.data")

oli_vis <- data.frame(oli,
    Tags="Oliveria:Visium",
    Title="Visium_HumanColon_Oliveria",
    Description="10x Genomics Visium data on human colorecal cancer")

oli_vhd <- data.frame(oli,
    Tags="Oliveria:VisiumHD",
    Title="VisiumHD_HumanColon_Oliveria",
    Description="10x Genomics VisiumHD data on human colorecal cancer")

(df <- rbind(oli_vis, oli_vhd))

write.csv(df, file.path("inst", "extdata", "metadata.csv"))
md <- ExperimentHubData::makeExperimentHubMetadata(".")
