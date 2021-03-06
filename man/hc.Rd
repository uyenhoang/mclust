\name{hc}
\alias{hc}
\alias{print.hc}

\title{Model-based Hierarchical Clustering}

\description{
  Agglomerative hierarchical clustering based on maximum likelihood criteria 
  for Gaussian mixture models parameterized by eigenvalue decomposition.
}
\usage{
hc(data,
   modelName = mclust.options("hcModelNames")[1],  
   use = mclust.options("hcUse"), \dots)
}
\arguments{
  \item{data}{
    A numeric vector, matrix, or data frame of observations.
    Categorical variables are not allowed.
    If a matrix or data frame, rows correspond to observations and
    columns correspond to variables.
  }
  \item{modelName}{
    A character string indicating the model to be used.\cr
    Possible models are: \cr\cr 
    \code{"E"}: equal variance  (one-dimensional) \cr
    \code{"V"} : spherical, variable variance (one-dimensional) \cr
    \code{"EII"}: spherical, equal volume \cr
    \code{"VII"}: spherical, unequal volume \cr
    \code{"EEE"}: ellipsoidal, equal volume, shape, and orientation \cr
    \code{"VVV"}: ellipsoidal, varying volume, shape, and orientation.\cr\cr
    By default the first model listed in
    \code{mclust.options("hcModelNames")}, i.e. \code{"VVV"}, is used.
  }
  \item{use}{
    A character string specifying what type of data/transformation should be 
    used for model-based hierarchical clustering.\cr
    This is experimental and it is only useful for the initialization of 
    EM algorithm.
    By default it uses the method specified in \code{mclust.options("hcUse")}, 
    which is set to \code{"VARS"}, i.e. the original input variables.
  }
  \item{\dots}{
    Arguments for the method-specific \code{hc} functions. See for example
    \code{\link{hcE}}.
  }
}
\value{
  A numeric two-column matrix in which the \emph{i}th row gives the 
  minimum index for observations in each of the two clusters merged at the
  \emph{i}th stage of agglomerative hierarchical clustering.
}
\details{
  Most models have memory usage of the order of the square of the
  number groups in the initial partition for fast execution.
  Some models, such as equal variance or \code{"EEE"},
  do not admit a fast algorithm under the usual agglomerative
  hierarchical clustering paradigm. 
  These use less memory but are much slower to execute.
}
\note{
  If \code{modelName = "E"} (univariate with equal variances) or
  \code{modelName = "EII"} (multivariate with equal spherical
  covariances), then the method is equivalent to Ward's method for
  hierarchical clustering.
}
\section{References}{
  J. D. Banfield and A. E. Raftery (1993).
  Model-based Gaussian and non-Gaussian Clustering.
  \emph{Biometrics 49:803-821}. 
  
  C. Fraley (1998).
  Algorithms for model-based Gaussian hierarchical clustering.
  \emph{SIAM Journal on Scientific Computing 20:270-281}. 
  
  C. Fraley and A. E. Raftery (2002).
  Model-based clustering, discriminant analysis, and density estimation.
  \emph{Journal of the American Statistical Association 97:611-631}. 

  C. Fraley, A. E. Raftery, T. B. Murphy and L. Scrucca (2012).
  mclust Version 4 for R: Normal Mixture Modeling for Model-Based 
  Clustering, Classification, and Density Estimation. 
  Technical Report No. 597, Department of Statistics, University of Washington.
}
\seealso{
  \code{\link{hcE}},...,
  \code{\link{hcVVV}},
  \code{\link{hclass}},
  \code{\link{mclust.options}}  
}
\examples{
hcTree <- hc(modelName = "VVV", data = iris[,-5])
cl <- hclass(hcTree,c(2,3))

\dontrun{
par(pty = "s", mfrow = c(1,1))
clPairs(iris[,-5],cl=cl[,"2"])
clPairs(iris[,-5],cl=cl[,"3"])

par(mfrow = c(1,2))
dimens <- c(1,2)
coordProj(iris[,-5], dimens = dimens, classification=cl[,"2"])
coordProj(iris[,-5], dimens = dimens, classification=cl[,"3"])
}
}
\keyword{cluster}
