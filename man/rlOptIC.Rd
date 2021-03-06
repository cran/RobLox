\name{rlOptIC}
\alias{rlOptIC}
\title{Computation of the optimally robust IC for AL estimators}
\description{
  The function \code{rlOptIC} computes the optimally robust IC for 
  AL estimators in case of normal location and (convex) contamination 
  neighborhoods. The definition of these estimators can be found 
  in Rieder (1994) or Kohl (2005), respectively.
}
\usage{
rlOptIC(r, mean = 0, sd = 1, bUp = 1000, computeIC = TRUE)
}
\arguments{
  \item{r}{ non-negative real: neighborhood radius. }
  \item{mean}{ specified mean.}
  \item{sd}{ specified standard deviation.}
  \item{bUp}{ positive real: the upper end point of the 
    interval to be searched for the clipping bound b. }
  \item{computeIC}{ logical: should IC be computed. See details below. }
}
\details{
  If 'computeIC' is 'FALSE' only the Lagrange multipliers 'A', 'a', and
  'b' contained in the optimally robust IC are computed.
}
\value{
  If 'computeIC' is 'TRUE' an object of class \code{"ContIC"} is returned, 
  otherwise a list of Lagrange multipliers
  \item{A}{ standardizing constant }
  \item{a}{ centering constant; always '= 0' is this symmetric setup }
  \item{b}{ optimal clipping bound }
}
\references{ 
  Rieder, H. (1994) \emph{Robust Asymptotic Statistics}. New York: Springer.

  Kohl, M. (2005) \emph{Numerical Contributions to the Asymptotic Theory of Robustness}. 
  Bayreuth: Dissertation.
}
\author{Matthias Kohl \email{Matthias.Kohl@stamats.de}}
%\note{}
\seealso{\code{\link[RobAStBase]{ContIC-class}}, \code{\link{roblox}}}
\examples{
IC1 <- rlOptIC(r = 0.1)
distrExOptions("ErelativeTolerance" = 1e-12)
checkIC(IC1)
distrExOptions("ErelativeTolerance" = .Machine$double.eps^0.25) # default
Risks(IC1)
cent(IC1)
clip(IC1)
stand(IC1)
plot(IC1)
}
\concept{normal location}
\concept{influence curve}
\keyword{robust}
