\name{model_sizes}
\alias{model_sizes}
\docType{data}
\title{Published AI Model Parameter Counts}
\description{
Selected published total and active-per-token parameter counts from
tokenusage.dev research note 004, with status and qualifications.
}
\usage{
model_sizes
}
\format{
A data frame with 28 rows and 11 columns:
\describe{
  \item{date_text}{Character. Verbatim model-date field, including any
  qualification.}
  \item{date}{Date. The leading YYYY-MM-DD in \code{date_text},
  parsed with \code{as.Date}; missing if no full date leads the field.}
  \item{model}{Character. Model portion before the spaced em dash in
  the source Model / lab field.}
  \item{lab}{Character. Lab portion after the spaced em dash in the
  source Model / lab field. Joining \code{model} and \code{lab} with
  that separator reconstructs the source field exactly.}
  \item{total_text}{Character. Verbatim published total-parameter label.}
  \item{total_params}{Numeric. Total parameters extracted from the first
  figure in \code{total_text}. Commas and a leading tilde are removed;
  suffixes k, M, B and T mean powers 3, 6, 9 and 12 of ten.
  A label with no figure gives a missing value.}
  \item{active_text}{Character. Verbatim active-per-token label.}
  \item{active_params}{Numeric. Parameters active per token, extracted
  from \code{active_text} using the same first-figure rule.
  \code{Unknown} becomes a missing value.}
  \item{status}{Character. Verbatim Status and qualifications field,
  including architecture, confidence and discrepancies.}
  \item{source_labels}{Character. Published source labels in order,
  separated by \code{ | }.}
  \item{source_urls}{Character. Published source URLs in order,
  separated by spaces.}
}
}
\details{
These 28 rows are the published-model selection in the October 2026
snapshot, researched through October 12. They are not the complete
118-model research appendix. No rows are omitted from this source CSV.
Third-party closed-model estimates are separate in
\code{\link{model_size_estimates}}.

Dates normally identify the earliest announcement naming a model.
Later size disclosures, public weights and general availability remain
separate qualifications. Weight status is fixed at the snapshot cutoff;
an open-weight description can include a restrictive licence.

Totals retain lab headline figures. The numeric extraction does not
resolve the differences recorded for DeepSeek-V3's MTP module, Kimi K2's
later backbone count, Inkling's stored-weight count or Mistral Large 4's
conflicting reports. Grok-1's active count remains qualified as a
calculation from the published percentage. Unknown active counts remain
missing. Read the numeric columns with their text labels and status.

The note's chart uses a disclosed dense-model record and five selected
mixture-of-experts (MoE) examples with both total and active counts.
Those MoE examples are not a size-record series. Switch-C is a
qualified encoder-decoder research comparison outside the decoder-model
sequence. Mistral Large 4 remains an API preview with weights pending.
Parameter comparisons do not establish equivalent capability, measured
inference speed or measured task cost.

The source compilation is credited to tokenusage.dev and was deposited
by Pistachio Technology Inc. It and this derived table are licensed
under Creative Commons Attribution 4.0 International (CC BY 4.0):
\url{https://creativecommons.org/licenses/by/4.0/}.
Reusers must credit tokenusage.dev, link the note and licence, and
identify changes. This package renames columns, splits the model/lab
field losslessly, adds typed dates and nominal numeric counts, and
converts empty fields to missing values. Original labels, qualifications
and source fields are retained.

Third-party source material keeps its own rights. Epoch AI's results
retain their own CC BY 4.0 licence and credit to Epoch AI and the
authors it names. The Switch-C weight-status qualification cites
Epoch AI; retain that credit and its source URL when reusing it.
}
\source{
\url{https://tokenusage.dev/publications/oct-26-model-sizes}

\doi{10.5281/zenodo.23553072}

Source file: \code{oct-26-model-sizes.csv},
version 2026-10 snapshot.
}
\examples{
data("model_sizes", package = "tokenusagedata")
known <- subset(model_sizes, !is.na(active_params))
head(data.frame(
  model = known$model,
  active_fraction = known$active_params / known$total_params
))
}
\keyword{datasets}
