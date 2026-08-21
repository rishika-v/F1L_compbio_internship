# scRNA-onco-analysis

A [Figure One Lab (F1L)](https://github.com/deanslee/FigureOneLab) project: re-enacting Figure 1 of **Kinker et al. 2020**, *Pan-cancer single-cell RNA-seq identifies recurring programs of cellular heterogeneity* ([DOI: 10.1038/s41588-020-00726-6](https://doi.org/10.1038/s41588-020-00726-6)), then extending the analysis to ask whether the paper's cell-line scRNA-seq data supports expanding Trastuzumab (anti-HER2/ERBB2) or Bevacizumab (anti-VEGF) to cancer types beyond their current approvals.

## Repository structure
- `01_build_anndata.ipynb` — parses the raw Kinker metadata + UMI count files into an AnnData object.
- `02_qc_clustering.ipynb` — QC, normalization, clustering, and the Figure 1-style embedding colored by cancer type / cell line.
- `03_erbb2_vegfa_exploration.ipynb` — the KSQ analysis: ERBB2/VEGFA/VEGFB expression across cancer types and cell lines, and follow-up questions raised by the data.

## Setup

```bash
python3 -m venv .venv
source .venv/bin/activate
pip install scanpy leidenalg python-igraph pandas seaborn matplotlib statsmodels jupyter ipykernel
```

Then fetch the data per `data/README.md`, and run the notebooks in order (01 → 02 → 03).

## Findings

Ran against the real Kinker et al. data (53,513 cells, 198 cell lines, 22 cancer types — matches the paper's reported numbers exactly; QC metrics also matched closely: mean 19,685 UMIs/cell and 3,757 genes/cell here vs. the paper's reported 19,264 and 3,802).

**Figure 1 reproduced:** cells cluster by cell line of origin, not cancer type — median 99.95% of each Leiden cluster comes from a single cell line, confirming the paper's central point that cell-line identity dominates the transcriptome.

**ERBB2 (Trastuzumab):** No cancer type shows significantly elevated ERBB2 when compared as a pooled group (even Breast/Gastric are mostly ERBB2-low at the single-cell level — the therapy targets a molecular subset, not a whole indication). But drilling into individual cell lines finds it anyway: **NCIH2170_LUNG**, a lung cancer line, has 95.8% of its cells in the global top decile for ERBB2 — a near-uniform HER2-high subpopulation invisible at the pooled cancer-type level. Notably, HER2-altered NSCLC is now a real FDA-approved target (trastuzumab deruxtecan/Enhertu, 2022) — independent validation that this class of signal is clinically real, even though it took single-cell, per-cell-line resolution to find it here.

**VEGFA (Bevacizumab):** Thyroid Cancer cell lines show significantly elevated VEGFA vs. the pooled currently-approved indications (FDR = 8.3e-10), at a magnitude comparable to some already-approved indications (Thyroid mean 0.22, 38.6% VEGFA+ vs. Breast mean 0.10, 19.4%+) — plausible given existing clinical interest in anti-angiogenic therapy for thyroid cancer. (Non-malignant fibroblast lines were also significantly elevated, which is an expected sanity check — fibroblasts are a canonical stromal VEGFA source — not a therapeutic lead.)

Full analysis, numbers, and caveats: see the Summary section of `03_erbb2_vegfa_exploration.ipynb`.

---

# Memo: Breaking down the Key Scientific Question (KSQ)

## The KSQ
Using available scRNA-seq data from cancer cell lines, how would you explore the use of the following FDA-approved antibody therapies in additional cancers?
- **Trastuzumab:** Targets HER2 and is used in the treatment of HER2-positive breast and gastric cancers.
- **Bevacizumab:** Targets VEGF and is used for a variety of cancers, including colorectal, lung, glioblastoma, breast, liver, and kidney cancer.

## My understanding of the KSQ (paraphrasing in simple terms)
This analysis aims to explore how single-cell RNA sequencing data from cancer cell lines can be utilized to assess the potential application of two FDA-approved antibody therapies, Trastuzumab and Bevacizumab, in treating additional types of cancers.

## Components of the KSQ

### scRNA-seq data
Single-cell RNA sequencing is a method used to detect and quantify RNA sequences in a given cell sample, one cell at a time. The data from an scRNA-sequencing experiment provides a snapshot of the transcriptome of a cell (which genes were being transcribed) when the cells were sequenced.

Within our context, we can use scRNA-seq data to identify specific cell populations within different cancer cell lines that express the target proteins for the therapies, which could help us assess the applicability of these therapies to treat additional types of cancers.

#### Advantages of scRNA over bulk RNA sequencing in this context
Unlike scRNA's "single cell" level information, bulk RNA-seq data is the average gene expression across a mixed population of cells from the taken sample. Because of this difference, using scRNA data to address cancer cell response to treatment is advantageous:
- Using cell-population level data reveals how various cell types within the tumor microenvironment, such as cancer cells and immune cells, react.
- We can examine the specific effects of therapeutic targets within particular cell types or subpopulations within our sample.

#### Resources
- Haque, A., Engel, J., Teichmann, S.A. et al. A practical guide to single-cell RNA-sequencing for biomedical research and clinical applications. Genome Med 9, 75 (2017). [BMC Article](https://doi.org/10.1186/s13073-017-0467-4)
- (2020). Top Benefits of Using the Technique of Single Cell RNA-Seq. [RNA-seq blog](https://www.rna-seqblog.com/top-benefits-of-using-the-technique-of-single-cell-rna-seq/#:~:text=Single%2Dcell%20RNA%20sequencing%20helps,immune%20system%20without%20any%20limitation)
- Yu X, Abbas-Aghababazadeh F, Chen YA, Fridley BL. Statistical and Bioinformatics Analysis of Data from Bulk and Single-Cell RNA Sequencing Experiments. Methods Mol Biol. 2021 [Pubmed Article](https://pubmed.ncbi.nlm.nih.gov/32926366/)

### Cancer cell lines
Cancer cell lines are cultured cells derived from various tumors that are grown in vitro. These cell lines are used in research as models of cancer tumors to understand cancer progression, test various therapies, and combinations of drugs.

#### Limitations
Cancer cell lines do not capture the actual complexity of tumors and tumor growth in real patients, as they lack crucial factors like the microenvironment and interactions with different cells and systems in the body.

In our context, since we are addressing the applicability of therapies to a variety of cancers, it is important for the cancer cell line selection in our experiments to be representative of all the different cancer types and potential genetic backgrounds possible. The confidence in our conclusions depends on how comprehensive the cell lines chosen for the study are.

#### Resources
- Cancer cell line encyclopedia (CCLE), Broad Institute, [Page Link](https://sites.broadinstitute.org/ccle/#:~:text=Cancer%20cell%20lines%20are%20the,and%20for%20defining%20drug%20efficacy)

### Antibody therapies: Trastuzumab and Bevacizumab

#### Trastuzumab
- **Target:** Human Epidermal Growth Factor Receptor 2 (HER2).
- **Mechanism:** A monoclonal antibody that binds to HER2 receptors on cancer cells, inhibiting their growth and survival.
- **Current Use:** Treatment of HER2-positive breast and gastric cancers.

#### Bevacizumab
- **Target:** Vascular Endothelial Growth Factor (VEGF).
- **Mechanism:** Inhibits angiogenesis (formation of new blood vessels) by binding to VEGF, essentially starving tumors of nutrients and oxygen so they can't grow.
- **Current Use:** Treatment of various cancers including colorectal, lung, glioblastoma, breast, liver, and kidney cancers.

#### Resources
- Trastuzumab, Cancer Research UK, [Page Link](https://www.cancerresearchuk.org/about-cancer/treatment/drugs/trastuzumab#:~:text=Trastuzumab%20is%20a%20type%20of,factor%20receptor%202%20(HER2))
- Bevacizumab (Avastin), Cancer Research UK, [Page Link](https://www.cancerresearchuk.org/about-cancer/treatment/drugs/bevacizumab#:~:text=Bevacizumab%20is%20a%20type%20of,in%20combination%20with%20another%20drug)



# Notes on Kinker et al.

> Kinker, G.S., Greenwald, A.C., Tal, R. et al. Pan-cancer single-cell RNA-seq identifies recurring programs of cellular heterogeneity. *Nat Genet* 52, 1208–1218 (2020). [DOI: 10.1038/s41588-020-00726-6](https://doi.org/10.1038/s41588-020-00726-6)

#### How did the authors handle the potential caveat of co-culturing cell lines before profiling by scRNA-seq? Why do you think that caveat was or was not adequately addressed?

Most of the profiled pools (the CCLE pools) were co-cultured together for 3 days before scRNA-seq, but the custom HNSCC pool was not — raising the concern that co-culturing could alter expression, or that patterns attributed to a cell line could really be pool/co-culture artifacts. The authors address this two ways: (1) they show that heterogeneity patterns are just as similar between cell lines drawn from the *same* pool as between cell lines from *different* pools, arguing against a strong pool-of-origin effect; (2) they ran a direct control — profiling six cell lines with and without 3-day co-culture — and found co-culturing had only a modest effect on each line's average expression, while the *patterns of heterogeneity within a line* were highly consistent between conditions.

This reasonably supports their central claims, since the paper's focus is on within-line heterogeneity (RHPs), not absolute expression levels, and that's specifically what the control experiment held constant. It's less airtight as blanket reassurance, though — the direct control used only 6 of 198 lines, so it's a spot check rather than proof the effect is negligible everywhere, and lines with unusual paracrine sensitivity could still respond more than the average.

#### The authors identified discrete subpopulations of cells within a subset of individual cell lines (Fig. 2A-B). What might be the reason why some cell lines have these discrete subpopulations while others do not?

Discrete (t-SNE + DBSCAN-defined) subpopulations appeared in only ~11% of cell lines. The authors found a likely explanation by comparing these discrete clusters to inferred copy-number alteration (CNA) subclones: 39% of discrete expression-based clusters significantly matched a genetic (CNA) subclone, versus only 8% of the *continuous* NMF-derived programs. Discrete subpopulations, in other words, are more likely to have a genetic basis — a cell line that has evolved distinct karyotypic subclones in culture will show discrete expression clusters, while a more clonal line will instead vary continuously (or not at all) along non-genetic axes of plasticity.

#### What are Recurrent Heterogeneous Programs (RHPs) and how were they defined?

RHPs are continuous gene-expression programs that recur as variably-expressed across *many different* cell lines, as opposed to a program that's just uniform within a line or unique to a single line. They were defined by running non-negative matrix factorization (NMF) separately within each cell line (across several parameter settings, keeping only programs that were robust to those settings), representing each program by its top 50 genes. This yielded 1,445 candidate programs across all lines; after filtering out programs that were low-similarity to everything else or driven by technical/quality confounders, 800 remained. Hierarchical clustering of these 800 programs by shared genes revealed 12 programs that recurred in multiple cell lines (≥8 lines from ≥4 different pools each) — 2 tied to the cell cycle (G1/S, G2/M) and 10 others (three EMT-like programs, interferon response, a general stress response, protein maturation, protein degradation, "classical" p53-dependent senescence, an epithelial senescence program (EpiSen), and skin pigmentation).

#### How do the identified RHPs relate to in vivo programs of heterogeneity in tumors, and what evidence supports this relationship?

7 of the 10 non-cell-cycle RHPs closely matched heterogeneity programs previously described directly in patient tumor scRNA-seq (HNSCC, melanoma, glioblastoma, ovarian cancer). Evidence: significant overlap between each RHP's signature genes and the corresponding tumor program's signature genes (hypergeometric test, FDR-adjusted p < 10⁻ˣ), and high correlation between per-cell RHP scores and per-cell tumor-program scores. In combined analyses that projected cell-line and tumor cells into the same space (e.g., melanoma EMT-I/pigmentation, HNSCC EpiSen/EMT-II), cell-line and tumor cells occupied overlapping ranges of the same principal components — i.e., the axis of variation a cell line shows in a dish is the same axis a real tumor varies along. Only the protein maturation and protein degradation RHPs lacked a known tumor counterpart, which the authors note may just reflect how little tumor scRNA-seq data existed to detect them in, rather than a real absence in vivo.

#### Where can you download the scRNA-seq data as shown in Figure 1B?

Broad Institute Single Cell Portal, study **SCP542** ("Pan-cancer cell line heterogeneity"): https://singlecell.broadinstitute.org/single_cell/study/SCP542/pan-cancer-cell-line-heterogeneity — free account (Google sign-in) required to download. See [`data/README.md`](data/README.md) for the specific files this project uses.
