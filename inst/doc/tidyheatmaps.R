## ----include = FALSE----------------------------------------------------------
knitr::opts_chunk$set(
collapse = TRUE,
comment = "#>"
)

## ----include=FALSE------------------------------------------------------------
library(dplyr)
library(tidyr)
library(tibble)
library(tidyheatmaps)

## ----eval=FALSE---------------------------------------------------------------
#  library(tidyverse)
#  library(tidyheatmaps)

## -----------------------------------------------------------------------------
glimpse(data_exprs)

## -----------------------------------------------------------------------------
tidyheatmap(data_exprs,
            rows = external_gene_name,
            columns = sample,
            values = expression
)

## -----------------------------------------------------------------------------
tidyheatmap(data_exprs,
            rows = external_gene_name,
            columns = sample,
            values = expression,
            scale = "row"
)

## -----------------------------------------------------------------------------
data_exprs %>% 
  arrange(external_gene_name, sample) %>% 
  tidyheatmap(rows = external_gene_name,
              columns = sample,
              values = expression,
              scale = "row"
  )

## -----------------------------------------------------------------------------
tidyheatmap(data_exprs,
            rows = external_gene_name,
            columns = sample,
            values = expression,
            scale = "row",
            color_legend_n = 5
)

## -----------------------------------------------------------------------------
tidyheatmap(data_exprs,
            rows = external_gene_name,
            columns = sample,
            values = expression,
            scale = "row",
            color_legend_min = -1,
            color_legend_max = 1
)

## -----------------------------------------------------------------------------
tidyheatmap(data_exprs,
            rows = external_gene_name,
            columns = sample,
            values = expression,
            scale = "row",
            colors = c("#145afc","#ffffff","#ee4445")
)

## -----------------------------------------------------------------------------
tidyheatmap(data_exprs,
            rows = external_gene_name,
            columns = sample,
            values = expression,
            scale = "row",
            annotation_col = c(sample_type, condition, group),
            annotation_row = c(is_immune_gene, direction)
)

## -----------------------------------------------------------------------------
ann_colors <- list(
  condition = c(EAE = "#BD79B4", healthy = "#F5CEF2"),
  group = c(Ein = "#C14236", Eip = "#E28946", Hin = "#4978AB", Hip = "#98BB85"),
  sample_type = c(input = "#BDBDBD", IP = "#7D7D7D"),
  direction = c(down = "#5071DC", up = "#C34B6B"),
  is_immune_gene = c(yes = "#B69340", no = "#FFFFFF")
)

tidyheatmap(data_exprs,
            rows = external_gene_name,
            columns = sample,
            values = expression,
            scale = "row",
            annotation_col = c(sample_type, condition, group),
            annotation_row = c(is_immune_gene, direction),
            annotation_colors = ann_colors
)

## -----------------------------------------------------------------------------
tidyheatmap(data_exprs,
            rows = external_gene_name,
            columns = sample,
            values = expression,
            scale = "row",
            annotation_col = c(sample_type, condition, group),
            annotation_row = c(is_immune_gene, direction),
            annotation_colors = ann_colors,
            gaps_row = direction,
            gaps_col = group
)

## ----fig.asp=0.8--------------------------------------------------------------
tidyheatmap(data_exprs,
            rows = external_gene_name,
            columns = sample,
            values = expression,
            scale = "row",
            annotation_col = c(sample_type, condition, group),
            annotation_row = c(is_immune_gene, direction),
            annotation_colors = ann_colors,
            gaps_row = direction,
            gaps_col = group,
            cellwidth = 7,
            cellheight = 7
)

## ----fig.asp=0.8--------------------------------------------------------------
tidyheatmap(data_exprs,
            rows = external_gene_name,
            columns = sample,
            values = expression,
            scale = "row",
            annotation_col = c(sample_type, condition, group),
            annotation_row = c(is_immune_gene, direction),
            annotation_colors = ann_colors,
            gaps_row = direction,
            gaps_col = group,
            cellwidth = 7,
            cellheight = 7,
            show_selected_row_labels = c("Apol6","Bsn","Vgf","Fam96b","Bag1","Aip"),
)

## ----fig.asp=0.8, eval=FALSE--------------------------------------------------
#  tidyheatmap(data_exprs,
#              rows = external_gene_name,
#              columns = sample,
#              values = expression,
#              filename = "my_heatmap.pdf"
#  )

## ----fig.asp=0.9--------------------------------------------------------------
tidyheatmap(data_exprs,
            rows = external_gene_name,
            columns = sample,
            values = expression,
            scale = "row",
            cluster_rows = TRUE,
            cluster_cols = TRUE,
            display_numbers = TRUE
)

