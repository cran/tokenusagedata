library(tokenusagedata)
source(file.path("fixtures", "expected.R"), local = TRUE)

tables <- setNames(
  lapply(names(expected_rows), function(nm) {
    environment <- new.env(parent = baseenv())
    utils::data(list = nm, package = "tokenusagedata", envir = environment)
    stopifnot(exists(nm, envir = environment, inherits = FALSE))
    get(nm, envir = environment, inherits = FALSE)
  }),
  names(expected_rows)
)

assert_data(tables)

attached <- as.environment("package:tokenusagedata")
for (nm in names(tables)) {
  stopifnot(identical(
    get(nm, envir = attached, inherits = FALSE),
    tables[[nm]]
  ))
}

p <- tables$token_prices
stopifnot(
  anyDuplicated(paste(p$line, p$date, sep = "\r")) == 0L,
  identical(
    unique(p$line),
    c(
      "OpenAI flagship", "OpenAI low-cost", "Claude Opus", "Claude Sonnet",
      "Gemini Pro", "Gemini Flash", "DeepSeek",
      "Llama 70B at Together AI", "Grok"
    )
  ),
  identical(
    as.integer(table(factor(p$line, levels = unique(p$line)))),
    c(13L, 13L, 12L, 9L, 7L, 10L, 10L, 7L, 7L)
  ),
  identical(
    as.integer(table(factor(
      p$change, levels = c("start", "step", "relabel")
    ))),
    c(44L, 15L, 29L)
  ),
  length(unique(p$lab)) == 6L,
  identical(as.character(range(p$date)), c("2022-01-01", "2026-09-29"))
)

check_blend <- function(x) {
  input <- round(x$input_usd_per_mtok * 1000000)
  output <- round(x$output_usd_per_mtok * 1000000)
  blended <- round(x$blended_usd_per_mtok * 1000000)
  stopifnot(all(3 * input + output == 4 * blended))
}
check_blend(tables$token_prices)
check_blend(tables$token_prices_premium)

stopifnot(
  identical(
    as.integer(table(factor(
      tables$context_windows$availability,
      levels = c("Served", "Limited", "On paper")
    ))),
    c(20L, 3L, 2L)
  ),
  identical(which(is.na(tables$context_windows$date)), 5L),
  identical(which(is.na(tables$model_sizes$active_params)), 8L),
  identical(which(is.na(tables$model_size_estimates$active_params)), 2:9)
)

latest_prices <- function(day) {
  cutoff <- as.Date(day)
  eligible <- which(p$date <= cutoff)
  groups <- split(eligible, p$line[eligible])
  indices <- vapply(
    groups,
    function(i) i[which.max(p$date[i])],
    integer(1)
  )
  selected <- p[unname(indices), , drop = FALSE]
  if (cutoff >= as.Date("2025-04-05")) {
    selected <- selected[
      selected$line != "Llama 70B at Together AI", , drop = FALSE
    ]
  }
  selected
}

days <- c("2025-01-01", "2026-01-01", "2026-10-12")
expected_sorted_blends <- list(
  c(0.13125, 0.175, 0.2625, 0.88, 2.1875, 4.375, 6, 30),
  c(0.315, 0.6875, 1.125, 4.5, 4.8125, 6, 6, 10),
  c(0.2, 0.525, 1.5, 3, 4, 4, 4.5, 8)
)
expected_medians <- c(1.53375, 4.65625, 3.5)

for (i in seq_along(days)) {
  selected <- latest_prices(days[i])
  values <- sort(selected$blended_usd_per_mtok)
  stopifnot(
    nrow(selected) == 8L,
    identical(values, expected_sorted_blends[[i]]),
    isTRUE(all.equal(
      sum(values[4L:5L]) / 2,
      expected_medians[i],
      tolerance = 1e-12
    ))
  )
}
