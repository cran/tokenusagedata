\name{token_prices_premium}
\alias{token_prices_premium}
\docType{data}
\title{Premium API Token Prices}
\description{
Four premium API tiers from tokenusage.dev research note 002,
kept separate from its selected historical model lines.
}
\usage{
token_prices_premium
}
\format{
A data frame with four rows and seven columns:
\describe{
  \item{model}{Character. Published premium-model or tier label.}
  \item{lab}{Character. Published model-lab label.}
  \item{date}{Date. The leading YYYY-MM-DD in the source date field,
  parsed with \code{as.Date}; missing if no full date leads the field.
  All four fields contain full dates.}
  \item{input_usd_per_mtok}{Numeric. Published input price in US dollars
  per one million tokens, converted directly from the decimal CSV field.}
  \item{output_usd_per_mtok}{Numeric. Published output price in US dollars
  per one million tokens, converted directly from the decimal CSV field.}
  \item{blended_usd_per_mtok}{Numeric. Published, unrounded 3:1 blended
  price in US dollars per one million tokens, converted directly from
  the decimal CSV field.}
  \item{source_urls}{Character. Published source URLs, separated by
  spaces if there is more than one.}
}
}
\details{
These four tiers were priced above their lab's represented flagship
line in the October 2026 snapshot. They do not form additional lines
in \code{\link{token_prices}} and must not be added to calculations
that use one price per represented line. The source snapshot covers
research through October 12, 2026. These are historical records,
not current price quotations.

Prices are for uncached requests at the lowest prompt-length tier.
Batch and cache discounts, free tiers, credits and negotiated rates
are excluded. The blended price is
\code{(3 * input + output) / 4}; the source uses integer micro-dollars
before weighting, and this table keeps its unrounded result.
List prices do not measure task cost or establish equal model quality.
The GPT-4.5 label retains its preview qualification. No rows are
omitted from the premium source CSV.

The source compilation is credited to tokenusage.dev and was deposited
by Pistachio Technology Inc. It and this derived table are licensed
under Creative Commons Attribution 4.0 International (CC BY 4.0):
\url{https://creativecommons.org/licenses/by/4.0/}.
Reusers must credit tokenusage.dev, link the note and licence, and
identify changes. This package renames columns and converts dates and
decimal prices to R types. Empty fields would become missing values;
there are no empty fields in this source file. Third-party source
material keeps its own rights.
}
\source{
\url{https://tokenusage.dev/publications/oct-26-token-prices}

\doi{10.5281/zenodo.23552904}

Source file: \code{oct-26-token-prices-premium.csv},
version 2026-10 snapshot.
}
\examples{
data("token_prices_premium", package = "tokenusagedata")
token_prices_premium[
  order(token_prices_premium$blended_usd_per_mtok),
  c("model", "date", "blended_usd_per_mtok")
]
}
\keyword{datasets}
