\name{rlsOptIC.An1}
\alias{rlsOptIC.An1}
\title{Computation of the optimally robust IC for An1 estimators}
\description{
  The function \code{rlsOptIC.An1} computes the optimally robust IC for 
  An1 estimators in case of normal location with unknown scale and 
  (convex) contamination neighborhoods. The definition of 
  these estimators can be found in Subsection 8.5.3 of Kohl (2005).
}
\usage{
rlsOptIC.An1(r, aUp = 2.5, delta = 1e-06)
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
  Andrews, D.F., Bickel, P.J., Hampel, F.R., Huber, P.J.,
  Rogers, W.H. and Tukey, J.W. (1972) \emph{Robust estimates of location}. 
  Princeton University Press.

  M. Kohl (2005). Numerical Contributions to the Asymptotic Theory of Robustness.
  Dissertation. University of Bayreuth. \url{https://epub.uni-bayreuth.de/id/eprint/839/2/DissMKohl.pdf}.
}
\author{Matthias Kohl \email{Matthias.Kohl@stamats.de}}
%\note{}
\seealso{\code{\link[RobAStBase]{IC-class}}}
\examples{
IC1 <- rlsOptIC.An1(r = 0.1)
checkIC(IC1)
Risks(IC1)
Infos(IC1)
## don't run to reduce check time on CRAN
\dontrun{
plot(IC1)
infoPlot(IC1)
}
}
\concept{normal location and scale}
\concept{influence curve}
\keyword{robust}
