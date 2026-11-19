\name{tokenusagedata-package}
\alias{tokenusagedata-package}
\alias{tokenusagedata}
\docType{package}
\title{AI Token Prices, Context Windows and Model Sizes}
\description{
Five documented historical data frames from tokenusage.dev research
notes 002, 003 and 004, with source text, qualifications, typed dates
and nominal numeric quantities.
}
\details{
The package contains \code{\link{token_prices}},
\code{\link{token_prices_premium}}, \code{\link{context_windows}},
\code{\link{model_sizes}} and \code{\link{model_size_estimates}}.
They derive from five CSV files in three fixed Zenodo version records.
The October 2026 snapshots are selected historical records, not a
complete market census or a live service.

Data are available offline. All tables are base R data frames with
automatic row names. Empty CSV fields become missing character values.
Original text retains its UTF-8 characters.

Dates use a leading YYYY-MM-DD when present; partial dates remain
missing, and date qualifications are retained in the tables that have
qualified date fields. Nominal context and parameter counts come from
the first figure in the corresponding text label. Commas and an
optional leading tilde are removed; k, M, B and T denote powers
3, 6, 9 and 12 of ten. This extraction does not reconcile conflicts,
measure effective context, or establish the accuracy of an estimate.

Prices are US dollars per one million tokens. Published unrounded
blends weight input and output 3:1. Context units and access conditions
differ across models. Published parameter counts and attributed
closed-model estimates remain separate. Consult each table's help
before making comparisons.

Only the five identified CSV files are included. Excluded source rows,
other downloads, article text, charts and images are not package data.

The compilation is credited to tokenusage.dev and was deposited by
Pistachio Technology Inc. The data and this package are licensed under
Creative Commons Attribution 4.0 International (CC BY 4.0):
\url{https://creativecommons.org/licenses/by/4.0/}.
Reusers must credit tokenusage.dev, link the relevant note and licence,
and identify changes. This package renames columns, converts dates and
prices, adds documented nominal numeric and lab fields, and converts
empty fields to missing values while preserving the source text.

Third-party source material keeps its own rights. Epoch AI's results
retain their own CC BY 4.0 licence and credit to Epoch AI and the
authors it names. The model-size help pages identify the relevant
credits. Use \code{citation("tokenusagedata")} for the data records.
}
\source{
\url{https://tokenusage.dev/publications}

\doi{10.5281/zenodo.23552904}

\doi{10.5281/zenodo.23552975}

\doi{10.5281/zenodo.23553072}
}
\author{
Jack He, package author and maintainer.

Pistachio Technology Inc., data-record creator and compilation
copyright holder.
}
\examples{
data("token_prices", package = "tokenusagedata")
c(records = nrow(token_prices),
  model_lines = length(unique(token_prices$line)))
}
\keyword{package}
\keyword{datasets}
