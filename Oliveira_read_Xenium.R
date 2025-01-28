library(SpatialExperimentIO)
xePath <- "~/Downloads/CRC_data/Xenium/"
xe <- readXeniumSXE(xePath, 
                    addExperimentXenium = TRUE, 
                    addParquetPaths = TRUE,
                    altExps = c(negprobe="^NegControlProbe", unassigned = "^UnassignedCodeword", 
                                negcode="^NegControlCodeword"))

xe
# class: SpatialExperiment 
# dim: 422 340837 
# metadata(4): experiment.xenium transcripts cell_boundaries nucleus_boundaries
# assays(1): counts
# rownames(422): ABCC8 ACP5 ... WFDC2 XCL2
# rowData names(3): ID Symbol Type
# colnames(340837): aaaadaba-1 aaaadgga-1 ... oikdmkkf-1 oikeebja-1
# colData names(10): cell_id transcript_counts ... nucleus_area sample_id
# reducedDimNames(0):
#   mainExpName: NULL
# altExpNames(3): negprobe unassigned negcode
# spatialCoords names(2) : x_centroid y_centroid
# imgData names(0):

dim(altExp(xe, "negprobe"))
#     20 340837
dim(altExp(xe, "unassigned"))
#     58 340837
dim(altExp(xe, "negcode"))
#     41 340837

metadata(xe)
# $experiment.xenium
# # A tibble: 1 × 33
# major_version minor_version patch_version run_name          run_start_time      region_name preservation_method num_cells transcripts_per_cell transcripts_per_100um
# <int>         <int>         <int> <chr>             <dttm>              <chr>       <chr>                   <int>                <int>                 <dbl>
#   1             4             0             0 Human_Colon_Canc… 2024-01-02 20:07:23 Human_Colo… FFPE                   340837                   94                  236.
# # ℹ 23 more variables: cassette_name <chr>, slide_id <chr>, panel_design_id <chr>, panel_predesigned_id <chr>, panel_name <chr>, panel_organism <chr>,
# #   panel_tissue_type <chr>, panel_num_targets_predesigned <int>, panel_num_targets_custom <int>, pixel_size <dbl>, instrument_sn <chr>, instrument_sw_version <chr>,
# #   analysis_sw_version <chr>, analysis_uuid <chr>, experiment_uuid <chr>, cassette_uuid <chr>, roi_uuid <chr>, z_step_size <dbl>, well_uuid <chr>,
# #   calibration_uuid <chr>, images <tibble[,2]>, xenium_explorer_files <tibble[,5]>, segmentation_stain <chr>
# 
# $transcripts
# [1] "~/Downloads/CRC_data/Xenium//transcripts.parquet"
# 
# $cell_boundaries
# [1] "~/Downloads/CRC_data/Xenium//cell_boundaries.parquet"
# 
# $nucleus_boundaries
# [1] "~/Downloads/CRC_data/Xenium//nucleus_boundaries.parquet"


