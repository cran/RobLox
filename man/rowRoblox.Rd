\name{rowRoblox and colRoblox}
\alias{rowRoblox}
\alias{colRoblox}
\title{Optimally robust estimation for location and/or scale}
\description{
  The functions \code{rowRoblox} and \code{colRoblox} compute 
  optimally robust estimates for normal location und/or scale and 
  (convex) contamination neighborhoods. The definition of 
  these estimators can be found in Rieder (1994) or Kohl (2005),
  respectively.
}
\usage{
rowRoblox(x, mean, sd, eps, eps.lower, eps.upper, initial.est, k = 1L,
          fsCor = TRUE, mad0 = 1e-4, na.rm = TRUE)
colRoblox(x, mean, sd, eps, eps.lower, eps.upper, initial.est, k = 1L,
          fsCor = TRUE, mad0 = 1e-4, na.rm = TRUE)
}
\arguments{
  \item{x}{ matrix or data.frame of (numeric) data values. }
  \item{mean}{ specified mean. See details below. }
  \item{sd}{ specified standard deviation which has to be positive. 
             See also details below. }
  \item{eps}{ positive real (0 < \code{eps} <= 0.5): amount of gross errors. 
        See details below. }
  \item{eps.lower}{ positive real (0 <= \code{eps.lower} <= \code{eps.upper}): 
        lower bound for the amount of gross errors. See details below. }
  \item{eps.upper}{ positive real (\code{eps.lower} <= \code{eps.upper} <= 0.5): 
        upper bound for the amount of gross errors. See details below. }
  \item{initial.est}{ initial estimate for \code{mean} and/or \code{sd}. If missing 
        median and/or MAD are used. }
  \item{k}{ positive integer. k-step is used to compute the optimally robust estimator.}
  \item{fsCor}{ logical: perform finite-sample correction. See function \code{\link{finiteSampleCorrection}}. }
  \item{mad0}{ scale estimate used if computed MAD is equal to zero}
  \item{na.rm}{logical: if  \code{TRUE}, the estimator is evaluated at \code{complete.cases(x)}.}
}
\details{
  Computes the optimally robust estimator for location with scale specified,
  scale with location specified, or both if neither is specified. The computation
  uses a k-step construction with an appropriate initial estimate for location
  or scale or location and scale, respectively. Valid candidates are e.g. 
  median and/or MAD (default) as well as Kolmogorov(-Smirnov) or Cram\'er von 
  Mises minimum distance estimators; cf. Rieder (1994) and Kohl (2005). In case 
  package Biobase from Bioconductor is installed as is suggested, 
  median and/or MAD are computed using function \code{rowMedians}.

  These functions are optimized for the situation where one has a matrix 
  and wants to compute the optimally robust estimator for every row, 
  respectively column of this matrix. In particular, the amount of cross
  errors is assumed to be constant for all rows, respectively columns.

  If the amount of gross errors (contamination) is known, it can be 
  specified by \code{eps}. The radius of the corresponding infinitesimal 
  contamination neighborhood is obtained by multiplying \code{eps} 
  by the square root of the sample size.

  If the amount of gross errors (contamination) is unknown, try to find a 
  rough estimate for the amount of gross errors, such that it lies 
  between \code{eps.lower} and \code{eps.upper}.

  In case \code{eps.lower} is specified and \code{eps.upper} is missing, 
  \code{eps.upper} is set to 0.5. In case \code{eps.upper} is specified and
  \code{eps.lower} is missing, \code{eps.lower} is set to 0.

  If neither \code{eps} nor \code{eps.lower} and/or \code{eps.upper} is 
  specified, \code{eps.lower} and \code{eps.upper} are set to 0 and 0.5, 
  respectively.

  If \code{eps} is missing, the radius-minimax estimator in sense of 
  Rieder et al. (2008), respectively Section 2.2 of Kohl (2005) is returned.

  In case of location, respectively scale one additionally has to specify
  \code{sd}, respectively \code{mean} where \code{sd} and \code{mean} can
  be a single number, i.e., identical for all rows, respectively columns,
  or a vector with length identical to the number of rows, respectively 
  columns.

  For sample size <= 2, median and/or MAD are used for estimation.
  
  If \code{eps = 0}, mean and/or sd are computed.
}
\value{Object of class \code{"kStepEstimate"}. }
\references{
  M. Kohl (2005). Numerical Contributions to the Asymptotic Theory of Robustness.
  Dissertation. University of Bayreuth. \url{https://epub.uni-bayreuth.de/id/eprint/839/2/DissMKohl.pdf}.
  
  H. Rieder (1994): Robust Asymptotic Statistics. Springer. \doi{10.1007/978-1-4684-0624-5}
  
  H. Rieder, M. Kohl, and P. Ruckdeschel (2008). The Costs of Not Knowing the Radius.
  Statistical Methods and Applications  \emph{17}(1): 13-40. \doi{10.1007/s10260-007-0047-7}

  M. Kohl, P. Ruckdeschel, and H. Rieder (2010). Infinitesimally Robust Estimation in 
  General Smoothly Parametrized Models. Statistical Methods and Applications \emph{19}(3): 333-354.
  \doi{10.1007/s10260-010-0133-0}.
  
  M. Kohl and H.P. Deigner (2010). Preprocessing of gene expression data by 
  optimally robust estimators. BMC Bioinformatics \emph{11}, 583.
  \doi{10.1186/1471-2105-11-583}.
}
\author{Matthias Kohl \email{Matthias.Kohl@stamats.de}}
%\note{}
\seealso{\code{\link{roblox}}, \code{\link[RobAStBase]{kStepEstimate-class}} }
\examples{
ind <- rbinom(200, size=1, prob=0.05) 
X <- matrix(rnorm(200, mean=ind*3, sd=(1-ind) + ind*9), nrow = 2)
rowRoblox(X)
rowRoblox(X, k = 3)
rowRoblox(X, eps = 0.05)
rowRoblox(X, eps = 0.05, k = 3)

X1 <- t(X)
colRoblox(X1)
colRoblox(X1, k = 3)
colRoblox(X1, eps = 0.05)
colRoblox(X1, eps = 0.05, k = 3)

X2 <- rbind(rnorm(100, mean = -2, sd = 3), rnorm(100, mean = -1, sd = 4))
rowRoblox(X2, sd = c(3, 4))
rowRoblox(X2, eps = 0.03, sd = c(3, 4))
rowRoblox(X2, sd = c(3, 4), k = 4)
rowRoblox(X2, eps = 0.03, sd = c(3, 4), k = 4)

X3 <- cbind(rnorm(100, mean = -2, sd = 3), rnorm(100, mean = 1, sd = 2))
colRoblox(X3, mean = c(-2, 1))
colRoblox(X3, eps = 0.02, mean = c(-2, 1))
colRoblox(X3, mean = c(-2, 1), k = 4)
colRoblox(X3, eps = 0.02, mean = c(-2, 1), k = 4)
}
\concept{normal location}
\concept{normal scale}
\concept{normal location and scale}
\concept{influence curve}
\keyword{robust}
