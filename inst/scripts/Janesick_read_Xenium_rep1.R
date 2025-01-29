library(SpatialExperimentIO)
xePath <- "~/Downloads/BC_data/Xenium_rep1/"
xe <- readXeniumSXE(xePath, 
                    addExperimentXenium = TRUE, 
                    addParquetPaths = TRUE,
                    altExps = c(negprobe="^NegControlProbe", antisense = "^antisense", 
                                negcode="^NegControlCodeword", blank = "^BLANK"))

xe
# class: SpatialExperiment 
# dim: 313 167780 
# metadata(4): experiment.xenium transcripts cell_boundaries nucleus_boundaries
# assays(1): counts
# rownames(313): ABCC11 ACTA2 ... ZEB2 ZNF562
# rowData names(3): ID Symbol Type
# colnames(167780): 1 2 ... 167779 167780
# colData names(8): cell_id transcript_counts ... nucleus_area sample_id
# reducedDimNames(0):
#   mainExpName: NULL
# altExpNames(4): negprobe antisense negcode blank
# spatialCoords names(2) : x_centroid y_centroid
# imgData names(0):

dim(altExp(xe, "negprobe"))
#     20 167780
dim(altExp(xe, "antisense"))
#      8 167780
dim(altExp(xe, "negcode"))
#     41 167780
dim(altExp(xe, "blank"))
#    159 167780

metadata(xe)
# $experiment.xenium
# # A tibble: 1 × 26
# run_name        run_start_time region_name preservation_method num_cells transcripts_per_cell transcripts_per_100um cassette_name
# <chr>           <chr>          <chr>       <chr>                   <int>                <dbl>                 <dbl> <chr>        
#   1 PREVIEW: Human… ""             Replicate 1 ffpe                   167780                  166                  106. human_breast…
# # ℹ 18 more variables: slide_id <chr>, panel_design_id <chr>, panel_name <chr>, panel_organism <chr>, panel_tissue_type <chr>,
# #   panel_num_targets_predesigned <int>, panel_num_targets_custom <int>, pixel_size <dbl>, instrument_sn <chr>,
# #   instrument_sw_version <chr>, analysis_sw_version <chr>, experiment_uuid <chr>, cassette_uuid <chr>, roi_uuid <chr>,
# #   z_step_size <dbl>, well_uuid <chr>, images <tibble[,3]>, xenium_explorer_files <tibble[,5]>
# 
# $transcripts
# [1] "~/Downloads/BC_data/Xenium_rep1//transcripts.parquet"
# 
# $cell_boundaries
# [1] "~/Downloads/BC_data/Xenium_rep1//cell_boundaries.parquet"
# 
# $nucleus_boundaries
# [1] "~/Downloads/BC_data/Xenium_rep1//nucleus_boundaries.parquet"    
     
     