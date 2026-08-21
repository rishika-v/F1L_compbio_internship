# Data

This project uses the processed scRNA-seq data from:

> Kinker, G.S., Greenwald, A.C., Tal, R. et al. Pan-cancer single-cell RNA-seq identifies recurring programs of cellular heterogeneity. *Nat Genet* 52, 1208–1218 (2020).

The data is hosted on the Broad Institute Single Cell Portal, study **SCP542** ("Pan-cancer cell line heterogeneity"):
https://singlecell.broadinstitute.org/single_cell/study/SCP542/pan-cancer-cell-line-heterogeneity

The portal requires a free account (Google sign-in) to download — it is not paywalled, just gated behind login, so this has to be done manually rather than scripted.

## Files needed

Download these two files from the study's "Download" tab and place them here (`data/`):

- `Metadata.txt` — per-cell metadata: cell line, cancer type (`Cancer_type`), pool ID, precomputed heterogeneity program scores (EMT, cell cycle, IFN response, etc.), discrete cluster assignments.
- `UMIcount_data.txt` — raw UMI count matrix (genes x cells, tab-separated, first 3 rows are `CellID`/`CellLine`/`Pool` header rows).

Both are plain text and load directly with the code in `01_build_anndata.ipynb`.
