SOURCES=resume.md style.css header.html
BUILD_DIR=build
FILE_NAME=Riley Shahar - Resume
BUILD_PATH=$(BUILD_DIR)/$(FILE_NAME)

PANDOC_ARGS=-t html --css style.css --self-contained
HTML_ARGS=-H header.html
PDF_ARGS=-V margin-top=1 -V margin-left=1 -V margin-right=1 -V margin-bottom=1 -V papersize=letter

COMPANY_BUILD_DIR=$(BUILD_DIR)/$(company)
COMPANY_FILE_NAME=$(FILE_NAME) - $(company)
COMPANY_BUILD_PATH=$(COMPANY_BUILD_DIR)/$(COMPANY_FILE_NAME)

all: html pdf $(company)

$(company): pdf html
	mkdir -p "$(COMPANY_BUILD_DIR)" 				&& \
		cp "$(BUILD_PATH).pdf" "$(COMPANY_BUILD_PATH).pdf" 	&& \
		cp "$(BUILD_PATH).html" "$(COMPANY_BUILD_PATH).html"

pdf: $(SOURCES) build_dir
	pandoc resume.md -o "$(BUILD_PATH).pdf" $(PANDOC_ARGS) $(PDF_ARGS)

html: $(SOURCES) build_dir
	pandoc resume.md -o "$(BUILD_PATH).html" $(PANDOC_ARGS) $(HTML_ARGS)

build_dir:
	mkdir -p $(BUILD_DIR)

.PHONY: clean
clean:
	-rm -rf $(BUILD_DIR)
