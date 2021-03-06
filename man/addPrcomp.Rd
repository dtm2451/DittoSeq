% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/addDimReduction.R
\name{addPrcomp}
\alias{addPrcomp}
\title{Add a prcomp pca calculation to a SingleCellExperiment object containing bulk or single-cell data}
\usage{
addPrcomp(object, prcomp, name = "pca", key = "PC")
}
\arguments{
\item{object}{the \code{\linkS4class{SingleCellExperiment}} object.}

\item{prcomp}{a prcomp output which will be added to the \code{object}}

\item{name}{String name for the reduction slot.
Normally, this will be "pca", but you can hold any number of PCA calculations so long as a unique \code{name} is given to each.
This will become the name of the slot and what should be provided to the \code{reduction.use} input when making a \code{\link{dittoDimPlot}}.
When the name given is the same as that of a slot that already exists inside the \code{object}, the previous slot is replaced with the newly provided data.}

\item{key}{String, like "PC", which sets the default axes-label prefix when this reduction is used for making a \code{\link{dittoDimPlot}}}
}
\value{
Outputs an \code{\linkS4class{SingleCellExperiment}} object with an added or replaced pca reduction slot.
}
\description{
Add a prcomp pca calculation to a SingleCellExperiment object containing bulk or single-cell data
}
\examples{

example("importDittoBulk", echo = FALSE)

# Calculate PCA with prcomp
#   NOTE: This is typically not done with all genes in a dataset.
#   The inclusion of this example code is not an endorsement of a particular
#   method of PCA. Consult yourself, a bioinformatician, or literature for
#   tips on proper techniques.
calc <- prcomp(t(logcounts(myRNA)), center = TRUE, scale = TRUE)

myRNA <- addPrcomp(
    object = myRNA,
    prcomp = calc)

# Now we can visualize conditions metadata on a PCA plot
dittoDimPlot(myRNA, "conditions", reduction.use = "pca", size = 3)
}
\seealso{
\code{\link{addDimReduction}} for adding other types of dimensionality reductions

\code{\link{importDittoBulk}} for initial import of bulk RNAseq data into dittoSeq as a \code{\linkS4class{SingleCellExperiment}}.

\code{\link{dittoDimPlot}} for visualizing how samples group within added dimensionality reduction spaces
}
\author{
Daniel Bunis
}
