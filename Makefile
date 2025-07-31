target_all = docs/content/_index.html \
	docs/content/30-process/_index.html \
	data/processed/sari_cum_2009_06_14_to_11_22.rds \
	docs/content/30-process/12-sari-filter.html \
	data/processed/huso104_cum_2011_05_12_to_06_06.rds \
	docs/content/30-process/14-huso104-filter.html \
	docs/content/40-explore/_index.html \
	data/figures/sari_reported_cases.png \
	docs/content/40-explore/12-sari-reported-cases.html

target_clean = docs/content/_index.html \
	docs/content/30-process/_index.html \
	docs/content/30-process/12-sari-filter.html \
	docs/content/30-process/14-huso104-filter.html \
	docs/content/40-explore/_index.html \
	docs/content/40-explore/12-sari-reported-cases.html

all: $(target_all)

docs/content/_index.html: \
	scripts/_index.Rmd

docs/content/30-process/_index.html: \
	scripts/30-process/_index.Rmd

data/processed/sari_cum_2009_06_14_to_11_22.rds docs/content/30-process/12-sari-filter.html: \
	scripts/30-process/12-sari-filter.Rmd \
	data/cleaned/clean_data_srag_epiweek_delay_table_PR.csv

data/processed/huso104_cum_2011_05_12_to_06_06.rds docs/content/30-process/14-huso104-filter.html: \
	scripts/30-process/14-huso104-filter.Rmd \
	data/cleaned/husO104_tri_cumu.csv

docs/content/40-explore/_index.html: \
	scripts/40-explore/_index.Rmd

data/figures/sari_reported_cases.png docs/content/40-explore/12-sari-reported-cases.html: \
	scripts/40-explore/12-sari-reported-cases.Rmd \
	data/processed/sari_cum_2009_06_14_to_11_22.rds

$(target_all):
	@Rscript -e 'blogdown:::build_rmds("$(<D)/$(<F)", "docs", "scripts")'

clean:
	rm -f $(target_clean)

