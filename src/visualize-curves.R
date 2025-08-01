
plot_compare_curves <- function(df_train, df_fit,
    mylabs = c("exp" = "(a) Exponential", "gomp" = "(b) Gompertz")) {
    ggplot(df_train) +
        geom_line(aes(delay, q, group = date, alpha = "Empirical"), color = "gray80",
            linewidth = rel(0.3)) +
        geom_point(aes(delay, q, group = date, color = "Empirical"), color = "gray30",
            size = rel(0.5)) +
        geom_line(aes(delay, q, alpha = "Theoretical"), color = "red", df_fit,
            linewidth = rel(0.7), linetype = "dashed") +
        labs(title = NULL, y = TeX("$q(d)$"), x = TeX("$d$"), alpha = NULL) +
        facet_wrap(~ model, scales = "free", labeller = as_labeller(mylabs)) +
        theme_classic(9) +
        # scale_colour_manual(values = c("gray30", "red")) +
        scale_alpha_manual(values = c(1, 1)) +
        theme(
            legend.position = c(0.9, 0.15),
            legend.key.width = unit(0.8, "cm"),
            strip.background = element_blank(),
            strip.text = element_text(face = "bold")
        )
}

