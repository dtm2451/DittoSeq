% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/Demuxlet_Tools.R
\name{demux.SNP.summary}
\alias{demux.SNP.summary}
\title{Plots the number of SNPs sequenced per droplet}
\usage{
demux.SNP.summary(
  object,
  group.by = "Lane",
  color.by = group.by,
  plots = c("jitter", "boxplot"),
  boxplot.color = "grey30",
  add.line = 50,
  min = 0,
  ...
)
}
\arguments{
\item{object}{A Seurat or SingleCellExperiment object}

\item{group.by}{String "name" of a metadata to use for grouping values.
Default is "Lane".}

\item{color.by}{String "name" of a metadata to use for coloring.
Default is whatever was provided to \code{group.by}.}

\item{plots}{String vector which sets the types of plots to include: possibilities = "jitter", "boxplot", "vlnplot", "ridgeplot".
NOTE: The order matters, so use c("back","middle","front") when inputing multiple to put them in the order you want.}

\item{boxplot.color}{The color of the lines of the boxplot.}

\item{add.line}{numeric value(s) where a dashed horizontal line should go.
Default = 50, a high confidence minimum number of SNPs per cell for highly accurate demuxlet sample deconvolution.}

\item{min}{numeric value which sets the minimum value shown on the y-axis.}

\item{...}{extra arguments passed to \code{\link{dittoPlot}}}
}
\value{
A ggplot, made with \code{\link{dittoPlot}} showing a summary of how many SNPs were available to Demuxlet for each cell of a dataset.

Alternatively, a plotly object if \code{data.hover = TRUE} is provided.

Alternatively, list containing a ggplot and the underlying data as a dataframe if \code{data.out = TRUE} is provided.
}
\description{
Plots the number of SNPs sequenced per droplet
}
\details{
This function is a wrapper that essentially runs \code{\link{dittoPlot}}\code{("demux.N.SNP")} with a few modified defaults.
The altered defaults:
\itemize{
\item Data is grouped and colored by the "Lane" metadata (unless \code{group.by} or \code{color.by} are adjusted otherwise).
\item Data is displayed as boxplots with gray lines on top of dots for individual cells (unless \code{plots} or \code{boxplot.color} are adjusted otherwise).
\item The plot is set to have minimum y axis value of zero (unless \code{min} is adjusted otherwise).
\item A dashed line is added at the value 50, a very conservative minimum number of SNPs for high confidence sample calls (unless \code{add.line} is adjusted otherwise).
}
}
\examples{
example(importDemux, echo = FALSE)
demux.SNP.summary(myRNA)

#Function wraps dittoPlot. See dittoPlot docs for more examples

}
\seealso{
\code{\link{demux.calls.summary}} for plotting the number of sample annotations assigned within each lane.
This is the other Demuxlet-associated QC visualization included with dittoSeq.

\code{\link{dittoPlot}}, as \code{demux.SNP.summary} is essentially just a \code{dittoPlot} wrapper.

\code{\link{importDemux}}, for how to import relevant demuxlet information as metadata.

Kang et al. Nature Biotechnology, 2018 \url{https://www.nature.com/articles/nbt.4042} for more information about the demuxlet cell-sample deconvolution method.
}
\author{
Daniel Bunis
}
