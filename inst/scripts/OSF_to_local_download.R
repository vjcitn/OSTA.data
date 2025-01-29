library(osfr)
osf <- osf_retrieve_node("https://osf.io/5n4q3")
(dir <- osf_ls_files(osf, pattern="Janesick")$name)

# retrieve Xenium dataset
ids <- grep("Xen", dir, value=TRUE)
sub <- osf_ls_files(osf, ids)
dir.create(tmp <- tempfile())
osf_download(sub, tmp, recurse=TRUE)

# read into 'SpatialExperiment'
library(SpatialExperimentIO)
(xen <- readXeniumSXE(tmp))