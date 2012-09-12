pkgname <- "RobLox"
source(file.path(R.home("share"), "R", "examples-header.R"))
options(warn = 1)
library('RobLox')

assign(".oldSearch", search(), pos = 'CheckExEnv')
cleanEx()
nameEx("0RobLox-package")
### * 0RobLox-package

flush(stderr()); flush(stdout())

### Name: RobLox-package
### Title: Optimally robust influence curves and estimators for location
###   and scale
### Aliases: RobLox-package RobLox
### Keywords: package

### ** Examples

library(RobLox)
ind <- rbinom(100, size=1, prob=0.05) 
x <- rnorm(100, mean=ind*3, sd=(1-ind) + ind*9)
roblox(x)

res <- roblox(x, eps.lower = 0.01, eps.upper = 0.1, returnIC = TRUE)
estimate(res)
confint(res)
confint(res, method = symmetricBias())
pIC(res)
checkIC(pIC(res))
Risks(pIC(res))
Infos(pIC(res))
plot(pIC(res))
infoPlot(pIC(res))

## row-wise application
ind <- rbinom(200, size=1, prob=0.05) 
X <- matrix(rnorm(200, mean=ind*3, sd=(1-ind) + ind*9), nrow = 2)
rowRoblox(X)



cleanEx()
nameEx("finiteSampleCorrection")
### * finiteSampleCorrection

flush(stderr()); flush(stdout())

### Name: finiteSampleCorrection
### Title: Function to compute finite-sample corrected radii
### Aliases: finiteSampleCorrection
### Keywords: robust

### ** Examples

finiteSampleCorrection(n = 3, r = 0.001, model = "locsc")
finiteSampleCorrection(n = 10, r = 0.02, model = "loc")
finiteSampleCorrection(n = 250, r = 0.15, model = "sc")



cleanEx()
nameEx("rlOptIC")
### * rlOptIC

flush(stderr()); flush(stdout())

### Name: rlOptIC
### Title: Computation of the optimally robust IC for AL estimators
### Aliases: rlOptIC
### Keywords: robust

### ** Examples

IC1 <- rlOptIC(r = 0.1)
distrExOptions("ErelativeTolerance" = 1e-12)
checkIC(IC1)
distrExOptions("ErelativeTolerance" = .Machine$double.eps^0.25) # default
Risks(IC1)
cent(IC1)
clip(IC1)
stand(IC1)
plot(IC1)



cleanEx()
nameEx("rlsOptIC.AL")
### * rlsOptIC.AL

flush(stderr()); flush(stdout())

### Name: rlsOptIC.AL
### Title: Computation of the optimally robust IC for AL estimators
### Aliases: rlsOptIC.AL
### Keywords: robust

### ** Examples

IC1 <- rlsOptIC.AL(r = 0.1, check = TRUE)
distrExOptions("ErelativeTolerance" = 1e-12)
checkIC(IC1)
distrExOptions("ErelativeTolerance" = .Machine$double.eps^0.25) # default
Risks(IC1)
cent(IC1)
clip(IC1)
stand(IC1)
plot(IC1)
infoPlot(IC1)

## k-step estimation
## better use function roblox (see ?roblox)
## 1. data: random sample
ind <- rbinom(100, size=1, prob=0.05) 
x <- rnorm(100, mean=0, sd=(1-ind) + ind*9)
mean(x)
sd(x)
median(x)
mad(x)

## 2. Kolmogorov(-Smirnov) minimum distance estimator (default)
## -> we use it as initial estimate for one-step construction
(est0 <- MDEstimator(x, ParamFamily = NormLocationScaleFamily()))

## 3.1 one-step estimation: radius known
IC1 <- rlsOptIC.AL(r = 0.5, mean = estimate(est0)[1], sd = estimate(est0)[2])
(est1 <- oneStepEstimator(x, IC1, est0))

## 3.2 k-step estimation: radius known
## Choose k = 3
(est2 <- kStepEstimator(x, IC1, est0, steps = 3L))

## 4.1 one-step estimation: radius unknown
## take least favorable radius r = 0.579
## cf. Table 8.1 in Kohl(2005)
IC2 <- rlsOptIC.AL(r = 0.579, mean = estimate(est0)[1], sd = estimate(est0)[2])
(est3 <- oneStepEstimator(x, IC2, est0))

## 4.2 k-step estimation: radius unknown
## take least favorable radius r = 0.579
## cf. Table 8.1 in Kohl(2005)
## choose k = 3
(est4 <- kStepEstimator(x, IC2, est0, steps = 3L))



cleanEx()
nameEx("rlsOptIC.An1")
### * rlsOptIC.An1

flush(stderr()); flush(stdout())

### Name: rlsOptIC.An1
### Title: Computation of the optimally robust IC for An1 estimators
### Aliases: rlsOptIC.An1
### Keywords: robust

### ** Examples

IC1 <- rlsOptIC.An1(r = 0.1)
checkIC(IC1)
Risks(IC1)
Infos(IC1)
plot(IC1)
infoPlot(IC1)



cleanEx()
nameEx("rlsOptIC.An2")
### * rlsOptIC.An2

flush(stderr()); flush(stdout())

### Name: rlsOptIC.An2
### Title: Computation of the optimally robust IC for An2 estimators
### Aliases: rlsOptIC.An2
### Keywords: robust

### ** Examples

IC1 <- rlsOptIC.An2(r = 0.1)
checkIC(IC1)
Risks(IC1)
Infos(IC1)
plot(IC1)
infoPlot(IC1)



cleanEx()
nameEx("rlsOptIC.AnMad")
### * rlsOptIC.AnMad

flush(stderr()); flush(stdout())

### Name: rlsOptIC.AnMad
### Title: Computation of the optimally robust IC for AnMad estimators
### Aliases: rlsOptIC.AnMad
### Keywords: robust

### ** Examples

IC1 <- rlsOptIC.AnMad(r = 0.1)
checkIC(IC1)
Risks(IC1)
Infos(IC1)
plot(IC1)
infoPlot(IC1)



cleanEx()
nameEx("rlsOptIC.BM")
### * rlsOptIC.BM

flush(stderr()); flush(stdout())

### Name: rlsOptIC.BM
### Title: Computation of the optimally robust IC for BM estimators
### Aliases: rlsOptIC.BM
### Keywords: robust

### ** Examples

IC1 <- rlsOptIC.BM(r = 0.1)
checkIC(IC1)
Risks(IC1)
Infos(IC1)
plot(IC1)
infoPlot(IC1)



cleanEx()
nameEx("rlsOptIC.Ha3")
### * rlsOptIC.Ha3

flush(stderr()); flush(stdout())

### Name: rlsOptIC.Ha3
### Title: Computation of the optimally robust IC for Ha3 estimators
### Aliases: rlsOptIC.Ha3
### Keywords: robust

### ** Examples

IC1 <- rlsOptIC.Ha3(r = 0.1)
checkIC(IC1)
Risks(IC1)
Infos(IC1)
plot(IC1)
infoPlot(IC1)



cleanEx()
nameEx("rlsOptIC.Ha4")
### * rlsOptIC.Ha4

flush(stderr()); flush(stdout())

### Name: rlsOptIC.Ha4
### Title: Computation of the optimally robust IC for Ha4 estimators
### Aliases: rlsOptIC.Ha4
### Keywords: robust

### ** Examples

IC1 <- rlsOptIC.Ha4(r = 0.1)
checkIC(IC1)
Risks(IC1)
Infos(IC1)
plot(IC1)
infoPlot(IC1)



cleanEx()
nameEx("rlsOptIC.HaMad")
### * rlsOptIC.HaMad

flush(stderr()); flush(stdout())

### Name: rlsOptIC.HaMad
### Title: Computation of the optimally robust IC for HuMad estimators
### Aliases: rlsOptIC.HaMad
### Keywords: robust

### ** Examples

IC1 <- rlsOptIC.HaMad(r = 0.1)
checkIC(IC1)
Risks(IC1)
Infos(IC1)
plot(IC1)
infoPlot(IC1)



cleanEx()
nameEx("rlsOptIC.Hu1")
### * rlsOptIC.Hu1

flush(stderr()); flush(stdout())

### Name: rlsOptIC.Hu1
### Title: Computation of the optimally robust IC for Hu1 estimators
### Aliases: rlsOptIC.Hu1
### Keywords: robust

### ** Examples

IC1 <- rlsOptIC.Hu1(r = 0.1)
checkIC(IC1)
Risks(IC1)
Infos(IC1)
plot(IC1)
infoPlot(IC1)



cleanEx()
nameEx("rlsOptIC.Hu2")
### * rlsOptIC.Hu2

flush(stderr()); flush(stdout())

### Name: rlsOptIC.Hu2
### Title: Computation of the optimally robust IC for Hu2 estimators
### Aliases: rlsOptIC.Hu2
### Keywords: robust

### ** Examples

IC1 <- rlsOptIC.Hu2(r = 0.1)
checkIC(IC1)
Risks(IC1)
Infos(IC1)
plot(IC1)
infoPlot(IC1)



cleanEx()
nameEx("rlsOptIC.Hu2a")
### * rlsOptIC.Hu2a

flush(stderr()); flush(stdout())

### Name: rlsOptIC.Hu2a
### Title: Computation of the optimally robust IC for Hu2a estimators
### Aliases: rlsOptIC.Hu2a
### Keywords: robust

### ** Examples

IC1 <- rlsOptIC.Hu2a(r = 0.1)
checkIC(IC1)
Risks(IC1)
Infos(IC1)
plot(IC1)
infoPlot(IC1)



cleanEx()
nameEx("rlsOptIC.Hu3")
### * rlsOptIC.Hu3

flush(stderr()); flush(stdout())

### Name: rlsOptIC.Hu3
### Title: Computation of the optimally robust IC for Hu3 estimators
### Aliases: rlsOptIC.Hu3
### Keywords: robust

### ** Examples

IC1 <- rlsOptIC.Hu3(r = 0.1)
checkIC(IC1)
Risks(IC1)
Infos(IC1)
plot(IC1)
infoPlot(IC1)



cleanEx()
nameEx("rlsOptIC.HuMad")
### * rlsOptIC.HuMad

flush(stderr()); flush(stdout())

### Name: rlsOptIC.HuMad
### Title: Computation of the optimally robust IC for HuMad estimators
### Aliases: rlsOptIC.HuMad
### Keywords: robust

### ** Examples

IC1 <- rlsOptIC.HuMad(r = 0.1)
checkIC(IC1)
Risks(IC1)
Infos(IC1)
plot(IC1)
infoPlot(IC1)



cleanEx()
nameEx("rlsOptIC.M")
### * rlsOptIC.M

flush(stderr()); flush(stdout())

### Name: rlsOptIC.M
### Title: Computation of the optimally robust IC for M estimators
### Aliases: rlsOptIC.M
### Keywords: robust

### ** Examples

IC1 <- rlsOptIC.M(r = 0.1, check = TRUE)
distrExOptions("ErelativeTolerance" = 1e-12)
checkIC(IC1, NormLocationScaleFamily())
distrExOptions("ErelativeTolerance" = .Machine$double.eps^0.25)
Risks(IC1)
Infos(IC1)
plot(IC1)
infoPlot(IC1)



cleanEx()
nameEx("rlsOptIC.MM2")
### * rlsOptIC.MM2

flush(stderr()); flush(stdout())

### Name: rlsOptIC.MM2
### Title: Computation of the optimally robust IC for MM2 estimators
### Aliases: rlsOptIC.MM2
### Keywords: robust

### ** Examples

IC1 <- rlsOptIC.MM2(r = 0.1)
checkIC(IC1)
Risks(IC1)
Infos(IC1)
plot(IC1)
infoPlot(IC1)



cleanEx()
nameEx("rlsOptIC.Tu1")
### * rlsOptIC.Tu1

flush(stderr()); flush(stdout())

### Name: rlsOptIC.Tu1
### Title: Computation of the optimally robust IC for Tu1 estimators
### Aliases: rlsOptIC.Tu1
### Keywords: robust

### ** Examples

IC1 <- rlsOptIC.Tu1(r = 0.1)
checkIC(IC1)
Risks(IC1)
Infos(IC1)
plot(IC1)
infoPlot(IC1)



cleanEx()
nameEx("rlsOptIC.Tu2")
### * rlsOptIC.Tu2

flush(stderr()); flush(stdout())

### Name: rlsOptIC.Tu2
### Title: Computation of the optimally robust IC for Tu2 estimators
### Aliases: rlsOptIC.Tu2
### Keywords: robust

### ** Examples

IC1 <- rlsOptIC.Tu2(r = 0.1)
checkIC(IC1)
Risks(IC1)
Infos(IC1)
plot(IC1)
infoPlot(IC1)



cleanEx()
nameEx("rlsOptIC.TuMad")
### * rlsOptIC.TuMad

flush(stderr()); flush(stdout())

### Name: rlsOptIC.TuMad
### Title: Computation of the optimally robust IC for TuMad estimators
### Aliases: rlsOptIC.TuMad
### Keywords: robust

### ** Examples

IC1 <- rlsOptIC.TuMad(r = 0.1)
checkIC(IC1)
Risks(IC1)
Infos(IC1)
plot(IC1)
infoPlot(IC1)



cleanEx()
nameEx("roblox")
### * roblox

flush(stderr()); flush(stdout())

### Name: roblox
### Title: Optimally robust estimator for location and/or scale
### Aliases: roblox
### Keywords: robust

### ** Examples

ind <- rbinom(100, size=1, prob=0.05) 
x <- rnorm(100, mean=ind*3, sd=(1-ind) + ind*9)

## amount of gross errors known
res1 <- roblox(x, eps = 0.05, returnIC = TRUE)
estimate(res1)
confint(res1)
confint(res1, method = symmetricBias())
pIC(res1)
checkIC(pIC(res1))
Risks(pIC(res1))
Infos(pIC(res1))
plot(pIC(res1))
infoPlot(pIC(res1))

## amount of gross errors unknown
res2 <- roblox(x, eps.lower = 0.01, eps.upper = 0.1, returnIC = TRUE)
estimate(res2)
confint(res2)
confint(res2, method = symmetricBias())
pIC(res2)
checkIC(pIC(res2))
Risks(pIC(res2))
Infos(pIC(res2))
plot(pIC(res2))
infoPlot(pIC(res2))

## estimator comparison
# classical optimal (non-robust)
c(mean(x), sd(x))

# most robust
c(median(x), mad(x))

# optimally robust (amount of gross errors known)
estimate(res1)

# optimally robust (amount of gross errors unknown)
estimate(res2)

# Kolmogorov(-Smirnov) minimum distance estimator (robust)
(ks.est <- MDEstimator(x, ParamFamily = NormLocationScaleFamily()))

# optimally robust (amount of gross errors known)
roblox(x, eps = 0.05, initial.est = estimate(ks.est))

# Cramer von Mises minimum distance estimator (robust)
(CvM.est <- MDEstimator(x, ParamFamily = NormLocationScaleFamily(), distance = CvMDist))

# optimally robust (amount of gross errors known)
roblox(x, eps = 0.05, initial.est = estimate(CvM.est))



cleanEx()
nameEx("rowRoblox")
### * rowRoblox

flush(stderr()); flush(stdout())

### Name: rowRoblox and colRoblox
### Title: Optimally robust estimation for location and/or scale
### Aliases: rowRoblox colRoblox
### Keywords: robust

### ** Examples

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



cleanEx()
nameEx("rsOptIC")
### * rsOptIC

flush(stderr()); flush(stdout())

### Name: rsOptIC
### Title: Computation of the optimally robust IC for AL estimators
### Aliases: rsOptIC
### Keywords: robust

### ** Examples

IC1 <- rsOptIC(r = 0.1)
distrExOptions("ErelativeTolerance" = 1e-12)
checkIC(IC1)
distrExOptions("ErelativeTolerance" = .Machine$double.eps^0.25) # default
Risks(IC1)
cent(IC1)
clip(IC1)
stand(IC1)
plot(IC1)



cleanEx()
nameEx("showdown")
### * showdown

flush(stderr()); flush(stdout())

### Name: showdown
### Title: Estimator Showdown by Monte-Carlo Study.
### Aliases: showdown
### Keywords: robust

### ** Examples

library(MASS)
## compare with Huber's Proposal 2
showdown(n = 20, M = 100, eps = 0.02, contD = Norm(mean = 3, sd = 3), 
         estfun = function(x){ unlist(hubers(x)) },
         plot1 = TRUE, plot2 = TRUE, plot3 = TRUE)

## compare with Huber M estimator with MAD scale
showdown(n = 20, M = 100, eps = 0.02, contD = Norm(mean = 3, sd = 3), 
         estfun = function(x){ unlist(huber(x)) },
         plot1 = TRUE, plot2 = TRUE, plot3 = TRUE)



### * <FOOTER>
###
cat("Time elapsed: ", proc.time() - get("ptime", pos = 'CheckExEnv'),"\n")
grDevices::dev.off()
###
### Local variables: ***
### mode: outline-minor ***
### outline-regexp: "\\(> \\)?### [*]+" ***
### End: ***
quit('no')
