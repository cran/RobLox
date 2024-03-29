\name{rlsOptIC.Tu1}
\alias{rlsOptIC.Tu1}
\title{Computation of the optimally robust IC for Tu1 estimators}
\description{
  The function \code{rlsOptIC.Tu1} computes the optimally robust IC for 
  Tu1 estimators in case of normal location with unknown scale and 
  (convex) contamination neighborhoods. The definition of 
  these estimators can be found in Subsection 8.5.4 of Kohl (2005).
}
\usage{
rlsOptIC.Tu1(r, aUp = 10, delta = 1e-06)
}
\arguments{
  \item{r}{ non-negative real: neighborhood radius. }
  \item{aUp}{ positive real: the upper end point of the interval 
    to be searched for a. }
  \item{delta}{ the desired accuracy (convergence tolerance). }
}
\details{The optimal value of the tuning constant a can be read off 
  from the slot \code{Infos} of the resulting IC.}
\value{Object of class \code{"IC"}}
\references{ 
  Beaton, A.E. and Tukey, J.W. (1974) The fitting of power series,
  meaning polynomials, illustrated on band-spectroscopic data.
  Discussions. Technometrics \bold{16}: 147--185.

  M. Kohl (2005). Numerical Contributions to the Asymptotic Theory of Robustness.
  Dissertation. University of Bayreuth. \url{https://epub.uni-bayreuth.de/id/eprint/839/2/DissMKohl.pdf}.
}
\author{Matthias Kohl \email{Matthias.Kohl@stamats.de}}
%\note{}
\seealso{\code{\link[RobAStBase]{IC-class}}}
\examples{
IC1 <- rlsOptIC.Tu1(r = 0.1)
checkIC(IC1)
Risks(IC1)
Infos(IC1)
plot(IC1)
infoPlot(IC1)
}
\concept{normal location and scale}
\concept{influence curve}
\keyword{robust}
