# Summarise results

## Convert delay matrix to long data.frame

matdelay_df <- function(X, dates, varname = "cases") {
    X |>
        data.frame() |>
        mutate(date = dates) |>
        tidyr::pivot_longer(
            starts_with("X"), names_to = "delay", values_to = varname,
            names_transform = function(x) as.numeric(sub("X", "", x)) - 1
        )
}

## Obtrain predicted mean

predmean_nonparam <- function(model) {
    q_draws <- model$draws("q")
    q_means <- apply(as.array(q_draws), 3, mean)
    lambda_draws <- model$draws("lambda")
    lambda_means <- apply(as.array(lambda_draws), 3, mean)
    matrix(lambda_means) %*% q_means
}

predmean_param <- function(model, delays, qmodel = "exponential") {
    b_draws <- model$draws("b")
    b_means <- apply(as.array(b_draws), 3, mean)
    phi_draws <- model$draws("phi")
    phi_means <- apply(as.array(phi_draws), 3, mean)
    if (qmodel == "exponential") {
        q_means <- 1 - (1 - phi_means) * exp(-matrix(b_means) %*% delays)
    } else if (qmodel == "gompertz") {
        q_means <- exp(log(phi_means) * exp(-matrix(b_means) %*% delays))
    }
    lambda_draws <- model$draws("lambda")
    lambda_means <- apply(as.array(lambda_draws), 3, mean)
    if (dim(q_means)[1] == 1) {
        return(matrix(lambda_means) %*% q_means)
    } else {
        return(lambda_means * q_means)
    }
}

predmean_df <- function(models, delays, dates, qmodel = "exponential") {
    nonparam_fit <- predmean_nonparam(models$q_constant) |>
        matdelay_df(dates)
    param_fit <- predmean_param(models$b_constant, delays, qmodel) |>
        matdelay_df(dates)
    param_rw_fit <- predmean_param(models$b_rw, delays, qmodel) |>
        matdelay_df(dates)
    param_ou_fit <- predmean_param(models$b_ou, delays, qmodel) |>
        matdelay_df(dates)

    model_labels <- c("nonparam", "param", "param_rw", "param_ou")
    list(nonparam_fit, param_fit, param_rw_fit, param_ou_fit) |>
        setNames(model_labels) |>
        bind_rows(.id = "method") |>
        mutate(method = factor(method, levels = ))
}


