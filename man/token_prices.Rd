\name{token_prices}
\alias{token_prices}
\docType{data}
\title{Historical API Token Prices}
\description{
Selected historical application programming interface (API) list prices
from tokenusage.dev research note 002, in its October 2026 snapshot.
}
\usage{
token_prices
}
\format{
A data frame with 88 rows and 12 columns:
\describe{
  \item{line}{Character. Selected model-line label, copied from the CSV.}
  \item{lab}{Character. Model lab, copied from the CSV.}
  \item{date}{Date. The leading YYYY-MM-DD in the source date field,
  parsed with \code{as.Date}; missing if no full date leads the field.
  All dates in this table have a full leading date.}
  \item{model}{Character. Model represented by the line from this date,
  copied from the CSV.}
  \item{change}{Character. Published event label: \code{start},
  \code{step} or \code{relabel}.}
  \item{input_usd_per_mtok}{Numeric. Published input price in US dollars
  per one million tokens, converted directly from its decimal CSV field.}
  \item{output_usd_per_mtok}{Numeric. Published output price in US dollars
  per one million tokens, converted directly from its decimal CSV field.}
  \item{blended_usd_per_mtok}{Numeric. Published, unrounded 3:1 blended
  price in US dollars per one million tokens, converted directly from
  its decimal CSV field.}
  \item{context}{Character. Applicable context or prompt-length tier,
  copied verbatim; an empty field becomes \code{NA_character_}.}
  \item{caveats}{Character. Published qualifications, copied verbatim;
  an empty field becomes \code{NA_character_}.}
  \item{note}{Character. Published explanatory note, copied verbatim;
  an empty field becomes \code{NA_character_}.}
  \item{source_urls}{Character. Source URLs in their published order,
  separated by spaces. Archive targets and timestamps are preserved.}
}
}
\details{
The snapshot covers research through October 12, 2026. It contains nine
selected model lines from six labs, not every model or the cheapest
available API on each day. A successor replaces the represented model
within a line even when the previous model remains available.
The records are ordered by line and then date.

There are 44 starts, 15 price steps and 29 relabels. A relabel records
a different model at the same rate. The opening davinci record on
January 1, 2022 is an opening state for an already available model,
not a launch event.

Prices are for uncached requests at the lowest prompt-length tier.
Batch and cache discounts, free tiers, credits and negotiated rates are
excluded. The selected DeepSeek peak prices exclude off-peak discounts.
Labelled introductory and promotional prices count on their recorded
dates. Some historical per-character prices were converted to tokens;
their conversion assumptions remain in the caveats and notes.

The blended price is \code{(3 * input + output) / 4}.
The published calculation uses integer micro-dollars before weighting.
This table preserves the unrounded result, rather than the article's
displayed cents. These are list-price comparisons, not measured task
costs or comparisons at equal model quality.

The Meta line uses Together AI's hosted Llama 70B prices. Its July 2024
step also changes the default endpoint from Reference (FP16) to Turbo
(FP8). The represented line ends on April 5, 2025, exclusively; the CSV
contains no end-marker row. Exclude it from cross-line calculations on
or after that date. This boundary is not a retirement date for Llama
3.3 API access. Grok enters on April 9, 2025.

Inferred dates, inferred prices, preview status, secondary sources and
endpoint-specific prices remain qualified in the text. An archive
capture date is not necessarily a verified effective date. GPT-4.1 is
outside the selected OpenAI flagship sequence. Premium tiers are in
\code{\link{token_prices_premium}}. No rows are omitted from this source
CSV; narrative comparisons and article figures are not additional
package data.

The source compilation is credited to tokenusage.dev and was deposited
by Pistachio Technology Inc. It and this derived table are licensed
under Creative Commons Attribution 4.0 International (CC BY 4.0):
\url{https://creativecommons.org/licenses/by/4.0/}.
Reusers must credit tokenusage.dev, link the note and licence, and
identify changes. This package renames columns, converts dates and
decimal prices to R types, and converts empty fields to missing values;
it retains the published text and values. Third-party source material
keeps its own rights.
}
\source{
\url{https://tokenusage.dev/publications/oct-26-token-prices}

\doi{10.5281/zenodo.23552904}

Source file: \code{oct-26-token-prices.csv}, version 2026-10 snapshot.
}
\examples{
data("token_prices", package = "tokenusagedata")
table(token_prices$change)
subset(token_prices, line == "OpenAI low-cost",
       select = c(date, model, blended_usd_per_mtok))
}
\keyword{datasets}
