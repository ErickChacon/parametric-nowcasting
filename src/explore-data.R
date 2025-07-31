my_classic <- function(base_size) {
  theme_classic(base_size) +
    theme(strip.background = element_blank(),
          strip.text = element_text(face = "bold"),
          panel.grid.major = element_line(),
          axis.line.x = element_blank())
}


plot_reported <- function(df, maxdelay = NULL) {
    if (is.null(maxdelay)) maxdelay <- max(df$delay)
    df |>
        ggplot() +
        geom_line(aes(delay, cases, group = date), color = "gray50", linewidth = rel(0.4)) +
        geom_point(aes(delay, cases), color = "gray30", size = rel(0.5)) +
        labs(x = TeX("Delay"), y = TeX("Cumulative reported cases")) +
        facet_wrap(~ date, scales = "free_y", nrow = 4) +
        scale_y_continuous(limits = c(0, NA)) +
        scale_x_continuous(limits = c(0, maxdelay), breaks = seq(0, maxdelay, by = 5)) +
        my_classic(9) +
        annotate("segment", x=-Inf, xend=Inf, y=-Inf, yend=-Inf, linewidth = rel(0.8))
}


