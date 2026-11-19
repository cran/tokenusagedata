expected_rows <- c(
  token_prices = 88L,
  token_prices_premium = 4L,
  context_windows = 25L,
  model_sizes = 28L,
  model_size_estimates = 9L
)

expected_columns <- list(
  token_prices = c(
    "line", "lab", "date", "model", "change",
    "input_usd_per_mtok", "output_usd_per_mtok",
    "blended_usd_per_mtok", "context", "caveats", "note", "source_urls"
  ),
  token_prices_premium = c(
    "model", "lab", "date", "input_usd_per_mtok",
    "output_usd_per_mtok", "blended_usd_per_mtok", "source_urls"
  ),
  context_windows = c(
    "date_text", "date", "model", "lab", "window_text", "window_tokens",
    "access", "availability", "qualification", "source_labels", "source_urls"
  ),
  model_sizes = c(
    "date_text", "date", "model", "lab", "total_text", "total_params",
    "active_text", "active_params", "status", "source_labels", "source_urls"
  ),
  model_size_estimates = c(
    "date_text", "date", "model", "total_text", "total_params",
    "active_text", "active_params", "evidence", "source_labels", "source_urls"
  )
)

expected_na_counts <- list(
  token_prices = c(0L, 0L, 0L, 0L, 0L, 0L, 0L, 0L, 76L, 65L, 60L, 0L),
  token_prices_premium = c(0L, 0L, 0L, 0L, 0L, 0L, 0L),
  context_windows = c(0L, 1L, 0L, 0L, 0L, 0L, 0L, 0L, 0L, 0L, 0L),
  model_sizes = c(0L, 0L, 0L, 0L, 0L, 0L, 0L, 1L, 0L, 0L, 0L),
  model_size_estimates = c(0L, 0L, 0L, 0L, 0L, 0L, 8L, 0L, 0L, 0L)
)

expected <- list(
  token_prices = list(
    date = c(
      "2023-03-14", "2023-11-06", "2024-05-13", "2024-08-06",
      "2025-08-07", "2025-11-13", "2025-12-11", "2026-03-05",
      "2026-04-24", "2026-07-09", "2026-08-21", "2026-09-22",
      "2026-09-29", "2022-01-01", "2022-09-01", "2022-11-28",
      "2023-03-01", "2023-06-13", "2023-11-06", "2024-02-01",
      "2024-07-18", "2025-08-07", "2026-03-17", "2026-07-09",
      "2026-07-30", "2026-09-22", "2023-03-14", "2023-07-11",
      "2023-11-21", "2024-03-04", "2025-05-22", "2025-08-05",
      "2025-11-24", "2026-02-05", "2026-04-16", "2026-05-28",
      "2026-07-24", "2026-09-22", "2024-03-04", "2024-06-20",
      "2024-10-22", "2025-02-24", "2025-05-22", "2025-09-29",
      "2026-02-17", "2026-06-30", "2026-09-28", "2023-12-13",
      "2024-03-10", "2024-05-14", "2024-10-01", "2025-04-04",
      "2025-11-18", "2026-02-19", "2024-05-14", "2024-08-12",
      "2025-02-05", "2025-04-17", "2025-06-17", "2025-12-17",
      "2026-05-19", "2026-07-21", "2026-08-13", "2026-09-02",
      "2024-05-06", "2024-09-05", "2024-12-26", "2025-01-20",
      "2025-09-05", "2025-09-29", "2025-12-01", "2026-04-24",
      "2026-08-16", "2026-09-10", "2023-08-11", "2023-10-17",
      "2023-11-13", "2024-04-18", "2024-07-18", "2024-07-23",
      "2024-12-06", "2025-04-09", "2025-07-09", "2026-03-10",
      "2026-05-06", "2026-07-08", "2026-08-12", "2026-09-21"
    ),
    input_usd_per_mtok = c(
      30, 10, 5, 2.5, 1.25, 1.25, 1.75, 2.5, 5, 5, 4, 2, 2,
      60, 20, 20, 2, 1.5, 1, 0.5, 0.15, 0.25, 0.75, 1, 0.2, 0.1,
      11.02, 11.02, 8, 15, 15, 15, 5, 5, 5, 5, 5, 4,
      3, 3, 3, 3, 3, 3, 3, 2, 2,
      1, 0.5, 3.5, 1.25, 1.25, 2, 2,
      0.35, 0.075, 0.1, 0.15, 0.3, 0.5, 1.5, 1.5, 0.75, 0.75,
      0.14, 0.14, 0.14, 0.55, 0.56, 0.28, 0.28, 0.14, 0.44, 0.3,
      3, 1, 0.9, 0.9, 0.88, 0.88, 0.88,
      3, 3, 2, 1.25, 2, 2, 2
    ),
    output_usd_per_mtok = c(
      60, 30, 15, 10, 10, 10, 14, 15, 30, 30, 20, 10, 10,
      60, 20, 20, 2, 2, 2, 1.5, 0.6, 2, 4.5, 6, 1.2, 0.5,
      32.68, 32.68, 24, 75, 75, 75, 25, 25, 25, 25, 25, 20,
      15, 15, 15, 15, 15, 15, 15, 10, 10,
      2, 1.5, 10.5, 5, 10, 12, 12,
      1.05, 0.3, 0.4, 0.6, 2.5, 3, 9, 7.5, 3.75, 3.75,
      0.28, 0.28, 0.28, 2.19, 1.68, 0.42, 0.42, 0.28, 1.32, 1.2,
      3, 1, 0.9, 0.9, 0.88, 0.88, 0.88,
      15, 15, 6, 2.5, 6, 6, 6
    ),
    blended_usd_per_mtok = c(
      37.5, 15, 7.5, 4.375, 3.4375, 3.4375, 4.8125, 5.625,
      11.25, 11.25, 8, 4, 4,
      60, 20, 20, 2, 1.625, 1.25, 0.75, 0.2625, 0.6875,
      1.6875, 2.25, 0.45, 0.2,
      16.435, 16.435, 12, 30, 30, 30, 10, 10, 10, 10, 10, 8,
      6, 6, 6, 6, 6, 6, 6, 4, 4,
      1.25, 0.75, 5.25, 2.1875, 3.4375, 4.5, 4.5,
      0.525, 0.13125, 0.175, 0.2625, 0.85, 1.125, 3.375, 3, 1.5, 1.5,
      0.175, 0.175, 0.175, 0.96, 0.84, 0.315, 0.315, 0.175, 0.66, 0.525,
      3, 1, 0.9, 0.9, 0.88, 0.88, 0.88,
      6, 6, 3, 1.5625, 3, 3, 3
    )
  ),
  token_prices_premium = list(
    date = c("2025-02-27", "2025-03-19", "2026-06-09", "2026-09-03"),
    input_usd_per_mtok = c(75, 150, 10, 10),
    output_usd_per_mtok = c(150, 600, 50, 50),
    blended_usd_per_mtok = c(93.75, 262.5, 20, 20)
  ),
  context_windows = list(
    date = c(
      "2018-06-11", "2019-02-14", "2020-05-28", "2023-03-14",
      NA_character_, "2023-05-11", "2023-11-05", "2023-11-06",
      "2023-11-21", "2024-04-09", "2024-05-21", "2024-06-27",
      "2025-04-05", "2025-04-14", "2025-08-07", "2025-08-12",
      "2025-09-19", "2026-03-10", "2026-03-13", "2026-04-24",
      "2026-07-08", "2026-07-16", "2026-09-02", "2026-09-29",
      "2026-10-07"
    ),
    lab = c(
      "OpenAI", "OpenAI", "OpenAI", "OpenAI", "MosaicML",
      "Anthropic", "01.AI", "OpenAI", "Anthropic", "Google",
      "Alibaba", "Google", "Meta", "OpenAI", "OpenAI",
      "Anthropic", "xAI", "xAI", "Anthropic", "DeepSeek",
      "xAI", "Moonshot", "Google", "OpenAI", "Anthropic"
    ),
    window_tokens = c(
      512, 1024, 2048, 32768, 65000, 100000, 200000, 128000, 200000,
      1048576, 10000000, 2097152, 10000000, 1047576, 400000,
      1000000, 2000000, 2000000, 1000000, 1000000, 500000,
      1048576, 1048576, 1050000, 1000000
    ),
    availability = c(
      "Served", "Served", "Limited", "Limited", "Served",
      "Served", "Served", "Served", "Served", "Served",
      "On paper", "Served", "On paper", "Served", "Served",
      "Limited", "Served", "Served", "Served", "Served",
      "Served", "Served", "Served", "Served", "Served"
    )
  ),
  model_sizes = list(
    date = c(
      "2018-06-11", "2018-10-11", "2019-02-14", "2019-08-13",
      "2019-10-23", "2020-02-13", "2020-05-28", "2021-01-11",
      "2021-04-26", "2021-10-11", "2021-12-08", "2021-12-09",
      "2022-03-29", "2022-04-04", "2022-05-02", "2022-07-11",
      "2023-11-04", "2024-04-24", "2024-07-23", "2024-12-26",
      "2025-07-11", "2025-08-05", "2026-01-20", "2026-04-24",
      "2026-07-15", "2026-07-16", "2026-07-19", "2026-10-06"
    ),
    model = c(
      "GPT-1", "BERT-Large", "GPT-2", "Megatron-LM", "T5-11B",
      "Turing-NLG", "GPT-3", "Switch-C", "PanGu-Alpha", "MT-NLG",
      "Gopher", "GLaM", "Chinchilla", "PaLM", "OPT-175B", "BLOOM",
      "Grok-1", "Snowflake Arctic", "Llama 3.1 405B", "DeepSeek-V3",
      "Kimi K2", "gpt-oss-120b", "Yuan3.0 Ultra", "DeepSeek-V4-Pro",
      "Inkling", "Kimi K3", "Qwen3.8", "Mistral Large 4"
    ),
    lab = c(
      "OpenAI", "Google", "OpenAI", "NVIDIA", "Google", "Microsoft",
      "OpenAI", "Google", "Huawei", "Microsoft and NVIDIA",
      "DeepMind", "Google", "DeepMind", "Google", "Meta", "BigScience",
      "xAI", "Snowflake", "Meta", "DeepSeek", "Moonshot AI", "OpenAI",
      "YuanLab.ai", "DeepSeek", "Thinking Machines Lab", "Moonshot AI",
      "Alibaba", "Mistral AI"
    ),
    total_params = c(
      117000000, 340000000, 1500000000, 8300000000, 11000000000,
      17000000000, 175000000000, 1600000000000, 200000000000,
      530000000000, 280000000000, 1200000000000, 70000000000,
      540000000000, 175000000000, 176000000000, 314000000000,
      480000000000, 405000000000, 671000000000, 1000000000000,
      117000000000, 1010000000000, 1600000000000, 975000000000,
      2800000000000, 2400000000000, 1000000000000
    ),
    active_params = c(
      117000000, 340000000, 1500000000, 8300000000, 11000000000,
      17000000000, 175000000000, NA_real_, 200000000000,
      530000000000, 280000000000, 96600000000, 70000000000,
      540000000000, 175000000000, 176000000000, 78500000000,
      17000000000, 405000000000, 37000000000, 32000000000,
      5100000000, 68800000000, 49000000000, 41000000000,
      104000000000, 95000000000, 52000000000
    )
  ),
  model_size_estimates = list(
    date = c(
      "2023-05-10", "2024-05-13", "2024-06-20", "2025-02-17",
      "2025-03-25", "2025-08-07", "2026-04-23", "2026-06-09",
      "2026-06-09"
    ),
    total_params = c(
      340000000000, 200000000000, 400000000000, 3000000000000,
      3000000000000, 2000000000000, 4700000000000,
      8000000000000, 5000000000000
    ),
    active_params = c(
      340000000000, NA_real_, NA_real_, NA_real_, NA_real_,
      NA_real_, NA_real_, NA_real_, NA_real_
    )
  )
)

assert_data <- function(tables) {
  stopifnot(identical(names(tables), names(expected_rows)))

  for (nm in names(expected_rows)) {
    x <- tables[[nm]]
    stopifnot(
      identical(class(x), "data.frame"),
      identical(nrow(x), expected_rows[[nm]]),
      identical(names(x), expected_columns[[nm]]),
      identical(.row_names_info(x, 1L), -nrow(x)),
      identical(
        unname(vapply(x, function(v) sum(is.na(v)), integer(1))),
        expected_na_counts[[nm]]
      )
    )

    numeric_names <- names(expected[[nm]])[
      vapply(expected[[nm]], is.double, logical(1))
    ]

    for (column in names(x)) {
      value <- x[[column]]
      if (column == "date") {
        stopifnot(identical(class(value), "Date"))
      } else if (column %in% numeric_names) {
        stopifnot(is.double(value))
      } else {
        stopifnot(is.character(value))
        stopifnot(!any(value == "", na.rm = TRUE))
      }
    }

    for (column in names(expected[[nm]])) {
      value <- x[[column]]
      if (column == "date") {
        value <- as.character(value)
      }
      stopifnot(identical(value, expected[[nm]][[column]]))
    }
  }

  invisible(TRUE)
}
