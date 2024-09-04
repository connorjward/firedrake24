# Compilers
TEX = latexmk -lualatex="lualatex -shell-escape" -lualatex

# Documents
MAIN = main.pdf

FIGURES_DIR = figures
FIGURES_SRC = $(wildcard $(FIGURES_DIR)/*.tex)
FIGURES = $(patsubst $(FIGURES_DIR)/%.tex,%.pdf,$(FIGURES_SRC))

# Make everything
.PHONY: all
all: $(MAIN)

# Make figures
.PHONY: figures
figures: $(FIGURES)

# Remove PDFs
.PHONY: clean
clean:
	-rm ./*.pdf 2>/dev/null || true

$(MAIN): %.pdf: $(FIGURES) %.tex
	$(TEX) $*

$(FIGURES): %.pdf: $(FIGURES_DIR)/%.tex
	$(TEX) $(FIGURES_DIR)/$*

# Use to always run a command even if the files are unchanged
.PHONY: ALWAYS
ALWAYS:
