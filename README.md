# Memo: Breaking down the Key Scientific Question (KSQ)

## The KSQ: 
Using available scRNA-seq data from cancer cell lines, how would you explore the use of the following FDA-approved antibody therapies in additional cancers?
Trastuzumab: Targets HER2 and is used in the treatment of HER2-positive breast and gastric cancers.
Bevacizumab: Targets VEGF and is used for a variety of cancers, including colorectal, lung, glioblastoma, breast, liver, and kidney cancer.

## My understanding of the KSQ (paraphrasing in simple terms):
This analysis aims to explore how single-cell RNA sequencing data from cancer cell lines can be utilized to assess how well we can apply two FDA-approved antibody therapies with specific cancer-type applications (Trastuzumab and Bevacizumab) to treat additional types of cancers. 

## Components of the KSQ:
### scRNA-seq data:
single-cell RNA sequencing is a method used to detect and quantify RNA sequences in a given cell sample- one cell at a time. The data from a scRNA-sequencing experiment provides a snapshot of the transcriptome of a cell (which genes were being transcribed) when the cells were sequenced. 
Within our context- we can use scRNA-seq data to identify specific cell populations within different cancer cell lines that express the target proteins for the therapies, which could help us assess the applicability of these therapies to treat additional types of cancers.

#### Advantages of scRNA over bulk RNA sequencing in this context:
Unlike scRNA's "single cell" level information, bulk RNA-seq data is the average gene expression across a mixed population of cells from the taken sample. Because of this difference, using scRNA data to address cancer cell response to treatment is advantageous:
Using cell-population level data reveals between various cell types within the tumor microenvironment- how cancer cells react with immune cells, etc. Hence, we can look at specific effects of therapeutic targets within particular cell types or subpopulations within our sample.

#### Resources:
Haque, A., Engel, J., Teichmann, S.A. et al. A practical guide to single-cell RNA-sequencing for biomedical research and clinical applications. Genome Med 9, 75 (2017). https://doi.org/10.1186/s13073-017-0467-4
(2020). Top Benefits of Using the Technique of Single Cell RNA-Seq. 2024, https://www.rna-seqblog.com/top-benefits-of-using-the-technique-of-single-cell-rna-seq/#:~:text=Single%2Dcell%20RNA%20sequencing%20helps,immune%20system%20without%20any%20limitation. 
Yu X, Abbas-Aghababazadeh F, Chen YA, Fridley BL. Statistical and Bioinformatics Analysis of Data from Bulk and Single-Cell RNA Sequencing Experiments. Methods Mol Biol. 2021;2194:143-175. doi: 10.1007/978-1-0716-0849-4_9. PMID: 32926366; PMCID: PMC7771369.

### cancer cell lines:
Cancer cell lines are cultured cells derived from various tumors that are grown in vitro. These cell lines are used in research as models of cancer tumors to understand cancer progression, test various therapies and combinations of drugs, etc.
Limitations: Cancer cell lines in no way capture the actual complexity of tumors and tumor growth in real patients, since they are missing crucial factors like the microenvironment and interactions with different cells and systems in the body.
In our context- since we are addressing the applicability of therapies to a variety of cancers, it is important for the cancer cell line selection in our experiments to be representative of all the different cancer types and potential genetic backgrounds possible. The confidence in our conclusions are dependent on how comprehensive the cell lines chosen for the study are.

#### Resources:
Cancer cell line encyclopedia (CCLE), Broad Institute, https://sites.broadinstitute.org/ccle/#:~:text=Cancer%20cell%20lines%20are%20the,and%20for%20defining%20drug%20efficacy.

### antibody therapies: Trastuzumab and Bevacizumab
#### Trastuzumab:
Target: Human Epidermal Growth Factor Receptor 2 (HER2).
Mechanism: a Monoclonal Antibody- binds to HER2 receptors on cancer cells, which inhibits their growth, and also inhibits survival.
Current Use: Treatment of HER2-positive breast and gastric cancers.

#### Bevacizumab:
Target: Vascular Endothelial Growth Factor (VEGF).
Mechanism: Inhibits angiogenesis (formation of new blood vessels) by binding to VEGF, which essentially starves tumors of nutrients and oxygen so they can't grow.
Current Use: Treatment of various cancers including colorectal, lung, glioblastoma, breast, liver, and kidney cancers.

#### Resources:
Trastuzumab, Cancer Research UK, https://www.cancerresearchuk.org/about-cancer/treatment/drugs/trastuzumab#:~:text=Trastuzumab%20is%20a%20type%20of,factor%20receptor%202%20(HER2).
Bevacizumab (Avastin), Cancer Research UK, https://www.cancerresearchuk.org/about-cancer/treatment/drugs/bevacizumab#:~:text=Bevacizumab%20is%20a%20type%20of,in%20combination%20with%20another%20drug.
