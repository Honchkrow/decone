% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/plot_muliple.R
\name{plot_multiple}
\alias{plot_multiple}
\title{Plotting function for comparison multiple deconvolution method.}
\usage{
plot_multiple(
  actual,
  predicted,
  label = NULL,
  method = NULL,
  method2 = NULL,
  type = "sample",
  figure = "boxplot",
  errbar = "SE",
  nrow = 3
)
}
\arguments{
\item{actual}{The groundtruth proportion of cell types in matrix.
row: cell types, column: samples. Also can be a csv matrix with row and
column names.}

\item{predicted}{a vector contains all the files with the predicted proportions
from different methods. Must be in csv file with row and column names.
row: cell types, column: samples.
For example, c("method1.csv", "method2.csv", "method3.csv").}

\item{label}{a vector contains the label corresponding to the predicted
proportion file. Default: base file name in parameter 'predicted'.
For example, c("method1", "method2", "method3").}

\item{method}{One of the c("mae", "rmse", "mape", "kendall", "pearson", "spearman").
Note: for mape, cell types with real proportion 0 will be ignored.
Note: for scatter plot, method must in c("kendall", "pearson", "spearman").}

\item{method2}{One of the c("mae", "rmse", "mape", "kendall", "pearson", "spearman").
Generating the second metric in cheatmap.
Note: should be different from parameter method.}

\item{type}{One of the c("sample", "celltpye", "all").
For "sample", generate metric for each sample. Scatter plot will assign different shape and color for each sample.
For "celltype", generate metric for each cell type. Scatter plot will assign different shape and color for each celltype.
For "all", generate metric for all data, which means flattening all data into an vector. Scatter plot will remove shape and color.
Note: Parameter 'type' cannot be set to 'all' when plotting boxplot, heatmap and cheatmap.}

\item{figure}{One of the c("boxplot", "barplot", "scatterplot", "heatmap", "cheatmap")
Note: Parameter type cannot be set to 'all' when plotting boxplot, heatmap and cheatmap.
Note: for scatter plot, method must in c("kendall", "pearson", "spearman").}

\item{errbar}{error bar type for barplot. One of the c("SD", "SE"), default: SE.
SD: Standard Deviation
SE: Standard Error}

\item{nrow}{Only used in scatterplot. Control the layout of output figure.}
}
\value{
The computed metrics and plot data.
}
\description{
Generating plots for multiple deconvolution method. This method
is designed for comparing the results from different methods under a certain
scenario or one method under different scenario. For example, comparing the
deconvolution effect of different methods from a specific noise level data, or
comparing the deconvolution effect of one method from different noise level.
Of course, there can be many samples in this certain scenario.
But for comparing the results from data with different noise
level, please use \code{\link{plot_multiple2}}.
Note: Function \code{\link{plot_multiple}} can reveal the deconvolution effect
for celltypes as well as samples directly. Function \code{\link{plot_multiple2}} reveals
the overall deconvolution results for different scenarios. The celltype or sample
specific effect can not be illustrated. Users should choose the appropriate
function. Of course, users can adopt the results from each function to
perform customized analysis.
}
