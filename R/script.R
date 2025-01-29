#' @importFrom osfr osf_retrieve_node osf_ls_files
#' @export
.list_data <- \(url="https://osf.io/5n4q3") {
    osf <- osf_retrieve_node(url)
    sort(osf_ls_files(osf)$name)
}

#' @importFrom utils zip
#' @importFrom BiocFileCache BiocFileCache bfcquery bfcadd
#' @importFrom osfr osf_retrieve_node osf_ls_files osf_download
#' @export
.load_data <- \(id, ca=BiocFileCache()) {
    # verify 'id' with informative error if not
    id <- match.arg(id, .list_data())
    # check if already cached
    q <- bfcquery(ca, id)
    n <- nrow(q)
    i <- 1
    if (n > 1) {
        message("multiple 'id' hits; using last")
        i <- n
    } else if (n > 0) {
        return(q$rpath[i])
    }
    # retrieve, zip, cache & return path
    no <- osf_retrieve_node(url)
    df <- osf_ls_files(no, id)
    dir.create(td <- tempfile())
    osf_download(df, td, recurse=TRUE)
    wd <- getwd()
    setwd(td)
    zip(zp <- paste0(id, ".zip"), dir())
    bfcadd(ca, zp, fpath=file.path(".", zp))
}

#' @importFrom utils unzip
#' @importFrom VisiumIO TENxVisium TENxVisiumHD import
#' @importFrom SpatialExperimentIO readCosmxSXE readXeniumSXE
#' @export
.read_data <- \(id) {
    # load & unpack
    pa <- .load_data(id)
    td <- tempfile()
    dir.create(td)
    unzip(pa, exdir=td)
    # infer platform from dataset identifier
    pt <- c("Visium", "VisiumHD", "CosMx", "Xenium")
    pt <- names(which(vapply(pt, \(.) grepl(., id), logical(1))))
    stopifnot("couldn't detect platform"=length(pt) > 0)
    if (length(pt) == 2) pt <- pt[2] # Visium HD
    # read into 'SpatialExperiment'
    switch(pt,
        CosMx=readCosmxSXE(td, addParquetPaths=TRUE),
        Xenium=readXeniumSXE(td, addParquetPaths=TRUE),
        { # Visium(HD):
            fun <- get(paste0("TENx", pt))
            fun(spacerangerOut=td,
                images="lowres",
                format="h5") |>
                import()
        })
}