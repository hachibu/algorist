.PHONY: phony

MARKDOWN_FILES = $(shell find book -name '*.md' | sort)

PANDOC_FLAGS =                       \
  --pdf-engine=pdflatex              \
  --from=markdown                    \
  --resource-path=book               \
  --file-scope                       \
  --table-of-contents                \
  --number-sections                  \
  --indented-code-classes=typescript \
  --highlight-style=monochrome       \
  -V mainfont="Palatino"             \
  -V documentclass=report            \
  -V papersize=A5                    \
  -V geometry:margin=0.75in

clean: phony
	rm -rf book/output/*

book: phony clean
	pandoc $(PANDOC_FLAGS) -o book/output/typescript-algorithms.pdf $(MARKDOWN_FILES)

watch: phony
	fswatch -o -r book/*.md | xargs -n1 -I{} make book
