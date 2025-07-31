target_all = docs/content/_index.html \
	docs/content/30-process/_index.html \
	data/processed/sari_cum_2009_06_14_to_11_22.rds \
	docs/content/30-process/12-sari-filter.html

target_clean = docs/content/_index.html \
	docs/content/30-process/_index.html \
	docs/content/30-process/12-sari-filter.html

all: $(target_all)

docs/content/_index.html: \
	scripts/_index.Rmd

docs/content/30-process/_index.html: \
	scripts/30-process/_index.Rmd

data/processed/sari_cum_2009_06_14_to_11_22.rds docs/content/30-process/12-sari-filter.html: \
	scripts/30-process/12-sari-filter.Rmd \
	data/cleaned/clean_data_srag_epiweek_delay_table_PR.csv

$(target_all):
	@Rscript -e 'blogdown:::build_rmds("$(<D)/$(<F)", "docs", "scripts")'

clean:
	rm -f $(target_clean)

