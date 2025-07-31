target_all = docs/content/_index.html

target_clean = docs/content/_index.html

all: $(target_all)

docs/content/_index.html: \
	scripts/_index.Rmd

$(target_all):
	@Rscript -e 'blogdown:::build_rmds("$(<D)/$(<F)", "docs", "scripts")'

clean:
	rm -f $(target_clean)

