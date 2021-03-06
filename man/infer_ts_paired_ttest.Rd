% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/ifr-ts-paired-ttest.R
\name{infer_ts_paired_ttest}
\alias{infer_ts_paired_ttest}
\title{Paired t test}
\usage{
infer_ts_paired_ttest(
  data,
  x,
  y,
  confint = 0.95,
  alternative = c("both", "less", "greater", "all")
)
}
\arguments{
\item{data}{a \code{data.frame} or \code{tibble}}

\item{x}{numeric; column in \code{data}}

\item{y}{numeric; column in \code{data}}

\item{confint}{confidence level}

\item{alternative}{a character string specifying the alternative hypothesis, must be
one of "both" (default), "greater", "less" or "all". You can specify just the
initial letter.}
}
\value{
\code{infer_ts_paired_ttest} returns an object of class \code{"infer_ts_paired_ttest"}.
An object of class \code{"infer_ts_paired_ttest"} is a list containing the
following components:

\item{Obs}{number of observations}
\item{b}{mean, standard deviation and standard error of \code{x}, \code{y}
and their difference}
\item{tstat}{t statistic}
\item{p_lower}{lower one-sided p-value}
\item{p_upper}{upper one-sided p-value}
\item{p_two_tail}{two sided p-value}
\item{corr}{Correlation of \code{x} and \code{y}}
\item{corsig}{p-value of correlation test}
\item{conf_int1}{confidence interval for mean of \code{x}}
\item{conf_int2}{confidence interval for mean of \code{y}}
\item{conf_int_diff}{confidence interval for mean of difference of \code{x}
and \code{y}}
\item{df}{degrees of freedom}
\item{confint}{confidence level}
\item{alternative}{alternative hypothesis}
\item{var_names}{names of \code{x} and \code{y}}
\item{xy}{string used in printing results of the test}
}
\description{
\code{infer_ts_paired_ttest} tests that two samples have the
same mean, assuming paired data.
}
\section{Deprecated Function}{

\code{paired_ttest()} has been deprecated. Instead use
\code{infer_ts_paired_ttest()}.
}

\examples{
# lower tail
infer_ts_paired_ttest(hsb, read, write, alternative = 'less')

# upper tail
infer_ts_paired_ttest(hsb, read, write, alternative = 'greater')

# both tails
infer_ts_paired_ttest(hsb, read, write, alternative = 'both')

# all tails
infer_ts_paired_ttest(hsb, read, write, alternative = 'all')
}
\references{
Sheskin, D. J. 2007. Handbook of Parametric and Nonparametric
Statistical Procedures, 4th edition. : Chapman & Hall/CRC.
}
\seealso{
\code{\link[stats]{t.test}}
}
