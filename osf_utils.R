
#osf <- osf_retrieve_node("https://osf.io/5n4q3")
#(dir <- osf_ls_files(osf, pattern="Janesick")$name)

#' list available spatial transcriptomics resources in OSF
#' @param url character(1) URL for OSF repository
#' @return a tibble
available_spatial_osf = function(url = "https://osf.io/5n4q3") {
  osf = osfr::osf_retrieve_node(id = url)
  osfr::osf_ls_files(osf)
}

#' retrieve a specified zipped experiment from cache, downloading to cache if necessary
#' @param experiment character(1)
retrieve_zipped_spatial_osf = function(experiment = "Visium_HumanColon_Oliveria",
    url = "https://osf.io/5n4q3", cache = BiocFileCache::BiocFileCache()) {
# check name is available
  avail = available_spatial_osf(url = url)
  stopifnot(experiment %in% avail$name)
# check if in cache
  chk = BiocFileCache::bfcquery(cache, experiment)
  ind = 1
  if (nrow(chk)>1) {
   message("multiple hits for selected experiment, using last")
   ind = nrow(chk)
   }
  if (nrow(chk)>0) return(chk$rpath[ind])
# not in cache; retrieve, zip, cache, return path
  node = osfr::osf_retrieve_node(id = url)
  toget = osfr::osf_ls_files(node, pattern=experiment)
  dir.create(tmp <- tempfile())
  osfr::osf_download(toget, tmp, recurse=TRUE)
  curd = getwd()
  setwd(tmp)
  zip(targ <- paste0(experiment, ".zip"), dir())
  pa = BiocFileCache::bfcadd(cache, targ, fpath=file.path(".", targ))
  return(pa)
}
  

