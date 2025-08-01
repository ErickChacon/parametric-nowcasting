# Data processing

## Convert wide dataframe of reports to long format

reporcases_longer <- function (df) {
    df |>
    tidyr::pivot_longer(matches("^delay[0-9]+"), names_to = "delay", values_to = "cases",
        names_transform = function(x) as.numeric(sub("delay", "", x)))
}

