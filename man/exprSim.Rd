% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/exprSim.R
\name{exprSim}
\alias{exprSim}
\title{Generate in silico mixture expression matrix}
\usage{
exprSim(
  n_sample = 50,
  p = 2/3,
  type = "coarse",
  transform = "TPM",
  outputPath = NULL,
  mix_name = "coarse_gene_expr.csv",
  ref_name = "coarse_ref.csv",
  prop_name = "coarse_prop.csv",
  refVar_name = NULL,
  train_name = NULL
)
}
\arguments{
\item{n_sample}{Sample number to be generated, default: 50.}

\item{p}{Proportion of sample in train set, default: 2/3.}

\item{type}{"coarse" or "fine".
"coarse" means the simulation will be performed in a coarse level.
Only 8 cell types will be used, including ("B.cells", "CD4.T.cells",
"CD8.T.cells", "endothelial.cells", "macrophages", "monocytes","neutrophils", "NK.cells").
"fine" means the simulation will be performed in a fine level.
14 cell types will be used, including ("memory.B.cells", "naive.B.cells", "memory.CD4.T.cells",
"naive.CD4.T.cells", "regulatory.T.cells", "memory.CD8.T.cells", "naive.CD8.T.cells", "NK.cells",
"neutrophils", "monocytes", "myeloid.dendritic.cells", "macrophages", "fibroblasts", "endothelial.cells")}

\item{transform}{"TPM", "CPM" or "NO". Transform the data into TPM, CPM or in counts.}

\item{outputPath}{output file save path.}

\item{mix_name}{mixture output file name.}

\item{ref_name}{reference output file name in csv.}

\item{prop_name}{simulated proportion file name in csv.}

\item{refVar_name}{reference variance file name in csv.}

\item{train_name}{file name for all data in train set in csv.
This data can be used for differential gene analysis.}
}
\value{
All the information will be written in the output path.
}
\description{
Generate in silico mixture expression matrix based on the
internal RNA-seq database. The internal RNA-seq database is collected from
multiple studies. All the samples are passed the quality filter. This
function is different from \code{\link{pseudoExpr}}. Counts in
\code{\link{pseudoExpr}} is randomly generated from uniform distribution.
This function use the real cell type specific expression data to generate
mixture data. We provide two types of simulation called "coarse" and "fine".
This idea is from DREAM Challenge Tumor Deconvolution problem.
\url{https://www.synapse.org/#!Synapse:syn15589870/wiki/}.
}
\examples{
exprSim()

}
