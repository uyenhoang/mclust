\name{me}
\alias{me}
\title{
  EM algorithm starting with M-step for parameterized MVN mixture models.
}
\description{
  Implements the EM algorithm for MVN mixture models parameterized by
  eignevalue decomposition, starting with the maximization step.
}
\usage{
me(modelName, data, z, prior = NULL, control = emControl(), 
   Vinv = NULL, warn = NULL, \dots)

}
\arguments{
  \item{modelName}{
    A character string indicating the model. The help file for
    \code{\link{mclustModelNames}} describes the available models.
  }
  \item{data}{
    A numeric vector, matrix, or data frame of observations.
    Categorical variables are not allowed.
    If a matrix or data frame, rows correspond to observations and
    columns correspond to variables.
  }
  \item{z}{
    A matrix whose \code{[i,k]}th entry is an initial estimate of the
    conditional probability of the ith observation belonging to
    the \emph{k}th component of the mixture.  
  }
 \item{prior}{
    Specification of a conjugate prior on the means and variances.
    See the help file for \code{priorControl} for further information.
    The default assumes no prior.                                              
   }
  \item{control}{
    A list of control parameters for EM. The defaults are set by the call
    \code{emControl()}.
  }                                                             
  \item{Vinv}{
    If the model is to include a noise term, \code{Vinv} is an estimate of the 
    reciprocal hypervolume of the data region. If set to a negative value
    or 0, the model will include a noise term with the reciprocal hypervolume
    estimated by the function \code{hypvol}.
    The default is not to assume a noise term in the model through the
    setting \code{Vinv=NULL}.
  }
 \item{warn}{
    A logical value indicating whether or not certain warnings 
    (usually related to singularity) should be issued when the
    estimation fails. The default is set in \code{mclust.options("warn")}.
  }
 \item{\dots }{
     Catches unused arguments in indirect or list calls via \code{do.call}.
  }
}
\value{
A list including the following components: 
  \item{modelName}{
    A character string identifying the model (same as the input argument).
  }
  \item{n}{
    The number of observations in the data.
  }
  \item{d}{
    The dimension of the data.
  }
  \item{G}{
    The number of mixture components.
  }  
  \item{z}{
    A matrix whose \code{[i,k]}th entry is the
    conditional probability of the \emph{i}th observation belonging to
    the \emph{k}th component of the mixture.  
  }
  \item{parameters}{
     \describe{
        \item{\code{pro}}{
              A vector whose \emph{k}th component is the mixing proportion for 
              the \emph{k}th component of the mixture model.
              If the model includes a Poisson term for noise, there 
              should be one more mixing proportion than the number 
              of Gaussian components.
        }
        \item{\code{mean}}{
              The mean for each component. If there is more than one component,
              this is a matrix whose kth column is the mean of the \emph{k}th 
              component of the mixture model. 
        }
        \item{\code{variance}}{
              A list of variance parameters for the model.
              The components of this list depend on the model
              specification. See the help file for \code{\link{mclustVariance}} 
              for details.  
        }
        \item{\code{Vinv}}{
              The estimate of the reciprocal hypervolume of the data region
              used in the computation when the input indicates the
              addition of a noise component to the model.
        }
      }
  }
  \item{loglik}{
    The log likelihood for the data in the mixture model. 
  }
  \item{control}{
     The list of control parameters for EM used.
  }
  \item{prior}{
     The specification of a conjugate prior on the means and variances used,
     \code{NULL} if no prior is used.
  }        
  \item{Attributes:}{
      \code{"info"} Information on the iteration.\cr
      \code{"WARNING"} An appropriate warning if problems are encountered 
      in the computations.
  }
}
\section{References}{
  C. Fraley and A. E. Raftery (2002).
  Model-based clustering, discriminant analysis, and density estimation.
  \emph{Journal of the American Statistical Association 97:611-631}.

  C. Fraley and A. E. Raftery (2005).
  Bayesian regularization for normal mixture estimation and model-based
  clustering.
  Technical Report, Department of Statistics, University of Washington.

  C. Fraley and A. E. Raftery (2007).
  Bayesian regularization for normal mixture estimation and model-based
  clustering. \emph{Journal of Classification 24:155-181}.
  
  C. Fraley, A. E. Raftery, T. B. Murphy and L. Scrucca (2012).
  mclust Version 4 for R: Normal Mixture Modeling for Model-Based 
  Clustering, Classification, and Density Estimation. 
  Technical Report No. 597, Department of Statistics, University of Washington.
}
\seealso{
  \code{\link{meE}},...,
  \code{\link{meVVV}},
  \code{\link{em}},
  \code{\link{mstep}},
  \code{\link{estep}},
  \code{\link{priorControl}},
  \code{\link{mclustModelNames}},
  \code{\link{mclustVariance}},
  \code{\link{mclust.options}}
}
\examples{
me(modelName = "VVV", data = iris[,-5], z = unmap(iris[,5]))
}
\keyword{cluster}
% docclass is function
% Converted by Sd2Rd version 1.21.

