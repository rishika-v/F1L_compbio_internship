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



# Notes on Kinker et al

#### How did the authors handle the potential caveat of co-culturing cell lines before profiling by scRNA-seq? Why do you think that caveat was or was not adequately addressed?

#### The authors identified discrete subpopulations of cells within a subset of individual cell lines (Fig. 2A-B). What might be the reason why some cell lines have these discrete subpopulations while others do not?

#### What are Recurrent Heterogeneous Programs (RHPs) and how were they defined?

#### How do the identified RHPs relate to in vivo programs of heterogeneity in tumors, and what evidence supports this relationship?

#### Where can you download the scRNA-seq data as shown in Figure 1B?
