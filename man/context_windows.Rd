\name{context_windows}
\alias{context_windows}
\docType{data}
\title{Published AI Context Windows}
\description{
Selected published context-window records from tokenusage.dev research
note 003, retaining access restrictions, units and qualifications.
}
\usage{
context_windows
}
\format{
A data frame with 25 rows and 11 columns:
\describe{
  \item{date_text}{Character. Verbatim date or observation field,
  including any date qualification.}
  \item{date}{Date. The leading YYYY-MM-DD in \code{date_text},
  parsed with \code{as.Date}; missing when the field does not start
  with a full date. The month-only MPT record is missing.}
  \item{model}{Character. Verbatim model field, including the lab in
  parentheses.}
  \item{lab}{Character. Text inside the last parenthesised group of
  \code{model}, without the parentheses. No lab names are normalized.}
  \item{window_text}{Character. Verbatim published window label.}
  \item{window_tokens}{Numeric. Nominal token count extracted from the
  first figure in \code{window_text}. Commas and a leading tilde are
  removed; suffixes k, M, B and T mean powers 3, 6, 9 and 12 of ten.
  A label with no figure would give a missing value.}
  \item{access}{Character. Verbatim access description.}
  \item{availability}{Character. Text before the first spaced middle
  dot in \code{access}: \code{Served}, \code{Limited} or
  \code{On paper}.}
  \item{qualification}{Character. Verbatim explanation of the unit,
  access or other limitation.}
  \item{source_labels}{Character. Published source labels in order,
  separated by \code{ | }.}
  \item{source_urls}{Character. Published source URLs in order,
  separated by spaces; archive targets and timestamps are retained.}
}
}
\details{
The source is the October 2026 snapshot, researched through October 13.
This is a selection of published records, not a continuous daily
maximum. Training sequence lengths, input limits and input-plus-output
totals remain different quantities. Tokenizers also differ, so equal
token counts do not establish equal text capacity or effective recall.
A served label includes public service or trained open weights; it does
not assert unrestricted access to every hosted endpoint.

The numeric column is a reproducible extraction from the CSV label,
not an independently measured effective limit. In particular,
\code{65k} becomes 65000; Scout's \code{10M} becomes 10000000 rather
than its configuration integer 10485760; and DeepSeek's \code{1M}
becomes 1000000 rather than 1048576. A label describing a reduction
from 2000000 to 1000000 gives 2000000, its first figure. Always read
\code{window_text}, \code{access} and \code{qualification} alongside it.

Dates retain their published basis. GPT-3's derived date is its paper
date, not its later API date. No day is invented for MPT. Grok 4.20's
reduction is bounded by archive observations, and Grok 4.5's date
retains its API-date qualification.

The CSV excludes the OpenRouter hosted listing for Llama 4 Scout and
the LWM-Text-1M row containing a RULER result. The RULER comparison
table is not included. The source selection also excludes research-only
10M and 100M claims, Pokee-Isaac's unreproduced claim, Mistral Large 4's
unresolved window and early Kimi figures stated in Chinese characters.
Excluded records are not reconstructed from the article or chart.

The source compilation is credited to tokenusage.dev and was deposited
by Pistachio Technology Inc. It and this derived table are licensed
under Creative Commons Attribution 4.0 International (CC BY 4.0):
\url{https://creativecommons.org/licenses/by/4.0/}.
Reusers must credit tokenusage.dev, link the note and licence, and
identify changes. This package renames columns, adds the derived date,
lab, nominal token count and availability, and converts empty fields
to missing values. The original text is retained. Third-party source
material keeps its own rights.
}
\source{
\url{https://tokenusage.dev/publications/oct-26-context-windows}

\doi{10.5281/zenodo.23552975}

Source file: \code{oct-26-context-windows.csv},
version 2026-10 snapshot.
}
\examples{
data("context_windows", package = "tokenusagedata")
table(context_windows$availability)
subset(context_windows, is.na(date),
       select = c(model, date_text, window_text))
}
\keyword{datasets}
