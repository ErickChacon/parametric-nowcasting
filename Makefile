target_all = docs/content/_index.html \
	docs/content/30-process/_index.html \
	data/processed/sari_41002_20090614_20091122.rds \
	docs/content/30-process/12-sari-filter.html \
	data/processed/huso104_20110512_20110606.rds \
	docs/content/30-process/14-huso104-filter.html \
	docs/content/40-explore/_index.html \
	data/figures/sari_reported_cases.png \
	docs/content/40-explore/12-sari-reported-cases.html \
	data/figures/huso104_reported_cases.png \
	docs/content/40-explore/14-huso104-reported-cases.html \
	data/figures/sari_qd_comparison.png \
	docs/content/40-explore/22-sari-compare-curves.html \
	data/figures/huso104_qd_comparison.png \
	docs/content/40-explore/24-husO104-compare-curves.html \
	data/figures/qd_example_sari_huso104.png \
	docs/content/40-explore/28-example-reporting-probability.html \
	docs/content/50-simulate/_index.html \
	docs/content/50-simulate/11-test-nonparam.html \
	docs/content/50-simulate/12-test-param-exp.html \
	docs/content/50-simulate/13-test-param-exp-rw1.html \
	docs/content/50-simulate/14-test-param-exp-ou.html \
	docs/content/60-model/_index.html \
	docs/content/70-summarise/_index.html

target_clean = docs/content/_index.html \
	docs/content/30-process/_index.html \
	docs/content/30-process/12-sari-filter.html \
	docs/content/30-process/14-huso104-filter.html \
	docs/content/40-explore/_index.html \
	docs/content/40-explore/12-sari-reported-cases.html \
	docs/content/40-explore/14-huso104-reported-cases.html \
	docs/content/40-explore/22-sari-compare-curves.html \
	docs/content/40-explore/24-husO104-compare-curves.html \
	docs/content/40-explore/28-example-reporting-probability.html \
	docs/content/50-simulate/_index.html \
	docs/content/50-simulate/11-test-nonparam.html \
	docs/content/50-simulate/12-test-param-exp.html \
	docs/content/50-simulate/13-test-param-exp-rw1.html \
	docs/content/50-simulate/14-test-param-exp-ou.html \
	docs/content/60-model/_index.html \
	docs/content/70-summarise/_index.html

all: $(target_all)

docs/content/_index.html: \
	scripts/_index.Rmd

docs/content/30-process/_index.html: \
	scripts/30-process/_index.Rmd

data/processed/sari_41002_20090614_20091122.rds docs/content/30-process/12-sari-filter.html: \
	scripts/30-process/12-sari-filter.Rmd \
	data/cleaned/clean_data_srag_epiweek_delay_table_PR.csv

data/processed/huso104_20110512_20110606.rds docs/content/30-process/14-huso104-filter.html: \
	scripts/30-process/14-huso104-filter.Rmd \
	data/cleaned/husO104_tri_cumu.csv

docs/content/40-explore/_index.html: \
	scripts/40-explore/_index.Rmd

data/figures/sari_reported_cases.png docs/content/40-explore/12-sari-reported-cases.html: \
	scripts/40-explore/12-sari-reported-cases.Rmd \
	data/processed/sari_41002_20090614_20091122.rds

data/figures/huso104_reported_cases.png docs/content/40-explore/14-huso104-reported-cases.html: \
	scripts/40-explore/14-huso104-reported-cases.Rmd \
	data/processed/huso104_20110512_20110606.rds

data/figures/sari_qd_comparison.png docs/content/40-explore/22-sari-compare-curves.html: \
	scripts/40-explore/22-sari-compare-curves.Rmd \
	data/processed/sari_41002_20090614_20091122.rds

data/figures/huso104_qd_comparison.png docs/content/40-explore/24-husO104-compare-curves.html: \
	scripts/40-explore/24-husO104-compare-curves.Rmd \
	data/processed/huso104_20110512_20110606.rds

data/figures/qd_example_sari_huso104.png docs/content/40-explore/28-example-reporting-probability.html: \
	scripts/40-explore/28-example-reporting-probability.Rmd \
	data/processed/huso104_20110512_20110606.rds \
	data/processed/sari_41002_20090614_20091122.rds

docs/content/50-simulate/_index.html: \
	scripts/50-simulate/_index.Rmd

docs/content/50-simulate/11-test-nonparam.html: \
	scripts/50-simulate/11-test-nonparam.Rmd

docs/content/50-simulate/12-test-param-exp.html: \
	scripts/50-simulate/12-test-param-exp.Rmd

docs/content/50-simulate/13-test-param-exp-rw1.html: \
	scripts/50-simulate/13-test-param-exp-rw1.Rmd

docs/content/50-simulate/14-test-param-exp-ou.html: \
	scripts/50-simulate/14-test-param-exp-ou.Rmd

docs/content/60-model/_index.html: \
	scripts/60-model/_index.Rmd

docs/content/70-summarise/_index.html: \
	scripts/70-summarise/_index.Rmd

$(target_all):
	@Rscript -e 'blogdown:::build_rmds("$(<D)/$(<F)", "docs", "scripts")'

clean:
	rm -f $(target_clean)

