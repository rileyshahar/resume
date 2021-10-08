SOURCES=resume.md style.css
BUILD_DIR=build
FILE_NAME=Riley Shahar - Resume
BUILD_PATH=$(BUILD_DIR)/$(FILE_NAME)

COMPANY_BUILD_DIR=$(BUILD_DIR)/$(company)
COMPANY_FILE_NAME=$(FILE_NAME) - $(company)
COMPANY_BUILD_PATH=$(COMPANY_BUILD_DIR)/$(COMPANY_FILE_NAME)

all: html pdf $(company)

$(company): pdf html
	mkdir -p "$(COMPANY_BUILD_DIR)" 				&& \
		cp "$(BUILD_PATH).pdf" "$(COMPANY_BUILD_PATH).pdf" 	&& \
		cp "$(BUILD_PATH).html" "$(COMPANY_BUILD_PATH).html"

pdf: $(SOURCES) build_dir
	pandoc resume.md -o "$(BUILD_PATH).pdf" -t html --css style.css \
		-V margin-top=1 -V margin-left=1 -V margin-right=1 -V margin-bottom=1 -V papersize=letter

html: $(SOURCES) build_dir
	pandoc resume.md -o "$(BUILD_PATH).html" -t html --css style.css --self-contained \
		-V margin-top=1 -V margin-left=1 -V margin-right=1 -V margin-bottom=1 -V papersize=letter

build_dir:
	mkdir -p $(BUILD_DIR)

clean:
	-rm -rf $(BUILD_DIR)
