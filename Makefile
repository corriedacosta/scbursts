PACKAGE = scbursts
VERSION = 0.34

LATEX := $(shell pdflatex -v 2> /dev/null)
BUILD := ../builds/$(shell date +'%Y-%m-%d_%H-%M-%S')

all: deps docs build check

update-deps:
	Rscript -e 'install.packages("devtools",  repos="http://cran.rstudio.com")'
	Rscript -e 'install.packages("roxygen2",  repos="http://cran.rstudio.com")'
	Rscript -e 'install.packages("rmarkdown", repos="http://cran.rstudio.com")'
	Rscript -e 'install.packages("knitr",     repos="http://cran.rstudio.com")'


deps:
	Rscript -e 'if (!require("devtools"))  install.packages("devtools",  repos="http://cran.rstudio.com")'
	Rscript -e 'if (!require("roxygen2"))  install.packages("roxygen2",  repos="http://cran.rstudio.com")'
	Rscript -e 'if (!require("rmarkdown")) install.packages("rmarkdown", repos="http://cran.rstudio.com")'
	Rscript -e 'if (!require("knitr"))     install.packages("knitr",     repos="http://cran.rstudio.com")'

docs:
ifdef LATEX
	R -e 'devtools::document()'
endif

build: deps NAMESPACE
ifdef LATEX
	R CMD build .
else
	R CMD build . --no-build-vignettes
endif

NAMESPACE:
	$(MAKE) docs

$(PACKAGE)_$(VERSION).tar.gz:
	$(MAKE) build

install: $(PACKAGE)_$(VERSION).tar.gz
	R CMD INSTALL $(PACKAGE)_$(VERSION).tar.gz

check: $(PACKAGE)_$(VERSION).tar.gz
	R CMD check $(PACKAGE)_$(VERSION).tar.gz --as-cran

fastcheck: build
	R CMD check $(PACKAGE)_$(VERSION).tar.gz

clean:
	$(RM) NAMESPACE
	$(RM) -r $(PACKAGE).Rcheck/
	$(RM) $(PACKAGE)_$(VERSION).tar.gz

$(PACKAGE).Rcheck:
	$(MAKE) check

export: $(PACKAGE)_$(VERSION).tar.gz $(PACKAGE).Rcheck
	@echo Copying tarball and manuals to ${BUILD}
	@mkdir -p ${BUILD}
	@cp scbursts.Rcheck/scbursts-manual.pdf ${BUILD}
	@cp scbursts.Rcheck/scbursts/doc/scbursts.pdf ${BUILD}
	@cp $(PACKAGE)_$(VERSION).tar.gz ${BUILD}
	$(MAKE) clean
