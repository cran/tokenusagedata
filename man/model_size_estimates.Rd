\name{model_size_estimates}
\alias{model_size_estimates}
\docType{data}
\title{Attributed AI Model Parameter Estimates}
\description{
Attributed third-party estimates and claims for closed models from
tokenusage.dev research note 004. These are estimates, not lab
disclosures.
}
\usage{
model_size_estimates
}
\format{
A data frame with nine rows and ten columns:
\describe{
  \item{date_text}{Character. Verbatim model-date field, including grouped
  dates or other qualifications.}
  \item{date}{Date. The leading YYYY-MM-DD in \code{date_text},
  parsed with \code{as.Date}; missing if no full date leads the field.
  A field with two dates contributes only its leading date.}
  \item{model}{Character. Verbatim model label, including grouped models.}
  \item{total_text}{Character. Verbatim claimed or inferred total label,
  retaining approximation and evidence-type text.}
  \item{total_params}{Numeric. Nominal total parameters extracted from
  the first figure in \code{total_text}. Commas and a leading tilde are
  removed; suffixes k, M, B and T mean powers 3, 6, 9 and 12 of ten.
  A label with no figure gives a missing value.}
  \item{active_text}{Character. Verbatim active-per-token label,
  retaining any assumption.}
  \item{active_params}{Numeric. Parameters active per token, extracted
  from \code{active_text} using the same first-figure rule.
  \code{Unknown} becomes a missing value.}
  \item{evidence}{Character. Verbatim evidence and uncertainty,
  including confidence, prediction bands and alternative estimates.}
  \item{source_labels}{Character. Published source labels in order,
  separated by \code{ | }.}
  \item{source_urls}{Character. Published source URLs in order,
  separated by spaces.}
}
}
\details{
This is the closed-model selection in the October 2026 snapshot,
researched through October 12. The source CSV omits the GPT-4 estimate
derived from SemiAnalysis. It must not be restored from the note,
another source or a chart.

The numeric columns are label extractions, not measurements or
confidence bounds. The PaLM 2 active count assumes a dense model.
Serving-economics estimates, knowledge-probe estimates, industry
estimates and a CEO claim retain their different evidence types.
The Grok conference transcription remains unverified. Its grouped
row is not split into separately dated observations.

The source research also omits the withdrawn gpt-3.5-turbo figure,
an unchecked o1 relay, unreleased Olympus and MAI-1 training targets,
snippet-only GPT-5.6 Sol and GPT-6 Astra estimates, and models without
usable totals. These estimates are not part of the note's disclosed
model-size chart. They do not establish equivalent capability,
measured inference speed or measured task cost.

The source compilation is credited to tokenusage.dev and was deposited
by Pistachio Technology Inc. It and this derived table are licensed
under Creative Commons Attribution 4.0 International (CC BY 4.0):
\url{https://creativecommons.org/licenses/by/4.0/}.
Reusers must credit tokenusage.dev, link the note and licence, and
identify changes. This package renames columns, adds typed dates and
nominal numeric counts, and converts empty fields to missing values.
Original labels, uncertainty and source fields are retained.

Third-party source material keeps its own rights. Epoch AI's results
retain their own CC BY 4.0 licence and credit to Epoch AI and the
authors it names. In particular, credit Epoch AI and Ege Erdil for
the GPT-4o and Claude 3.5 Sonnet serving-economics estimates, and
retain their source URL. Removing a tilde for numeric extraction
does not remove the estimate's uncertainty.
}
\source{
\url{https://tokenusage.dev/publications/oct-26-model-sizes}

\doi{10.5281/zenodo.23553072}

Source file: \code{oct-26-model-sizes-estimates.csv},
version 2026-10 snapshot.
}
\examples{
data("model_size_estimates", package = "tokenusagedata")
model_size_estimates[c("model", "total_text", "active_text")]
}
\keyword{datasets}
