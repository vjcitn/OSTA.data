library(SpatialExperimentIO)
xePath <- "~/Downloads/BC_data/Xenium_rep2/"
xe <- readXeniumSXE(xePath, 
                    addExperimentXenium = TRUE, 
                    addParquetPaths = TRUE,
                    altExps = c(negprobe="^NegControlProbe", antisense = "^antisense", 
                                negcode="^NegControlCodeword", blank = "^BLANK"))

xe
# class: SpatialExperiment 
# dim: 313 118752 
# metadata(4): experiment.xenium transcripts cell_boundaries nucleus_boundaries
# assays(1): counts
# rownames(313): ABCC11 ACTA2 ... ZEB2 ZNF562
# rowData names(3): ID Symbol Type
# colnames(118752): 1 2 ... 118751 118752
# colData names(8): cell_id transcript_counts ... nucleus_area sample_id
# reducedDimNames(0):
#   mainExpName: NULL
# altExpNames(4): negprobe antisense negcode blank
# spatialCoords names(2) : x_centroid y_centroid
# imgData names(0):

dim(altExp(xe, "negprobe"))
#     20 118752
dim(altExp(xe, "antisense"))
#      8 118752
dim(altExp(xe, "negcode"))
#     41 118752
dim(altExp(xe, "blank"))
#    159 118752

metadata(xe)
# $experiment.xenium
# # A tibble: 1 × 26
# run_name       run_start_time region_name preservation_method num_cells transcripts_per_cell transcripts_per_100um cassette_name slide_id panel_design_id panel_name
# <chr>          <chr>          <chr>       <chr>                   <int>                <dbl>                 <dbl> <chr>         <chr>    <chr>           <chr>     
#   1 PREVIEW: Huma… ""             Replicate 2 ffpe                   118752                  164                  97.2 human_breast… 0001880  PD_260          hBreast_3…
# # ℹ 15 more variables: panel_organism <chr>, panel_tissue_type <chr>, panel_num_targets_predesigned <int>, panel_num_targets_custom <int>, pixel_size <dbl>,
# #   instrument_sn <chr>, instrument_sw_version <chr>, analysis_sw_version <chr>, experiment_uuid <chr>, cassette_uuid <chr>, roi_uuid <chr>, z_step_size <dbl>,
# #   well_uuid <chr>, images <tibble[,3]>, xenium_explorer_files <tibble[,5]>
# 
# $transcripts
# [1] "~/Downloads/BC_data/Xenium_rep2//transcripts.parquet"
# 
# $cell_boundaries
# [1] "~/Downloads/BC_data/Xenium_rep2//cell_boundaries.parquet"
# 
# $nucleus_boundaries
# [1] "~/Downloads/BC_data/Xenium_rep2//nucleus_boundaries.parquet"


