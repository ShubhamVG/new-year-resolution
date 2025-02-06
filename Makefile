source_files := $(wildcard web/*)
build_files := $(wildcard build/*)

$(build_files): $(source_files)
	webdev build --release

build/:
	mkdir -p build/

.PHONY: github_push
github_push: build/ $(build_files) $(source_files)
	rm -rf docs/ && \
	mv build/ docs/ && \
	git add . && \
	git commit -m "Another build" && \
	git push