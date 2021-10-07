SOURCES=resume.md style.css

all: html pdf

pdf: $(SOURCES)
	pandoc resume.md -o "Riley Shahar - Resume.pdf" -t html --css style.css \
		-V margin-top=1 -V margin-left=1 -V margin-right=1 -V margin-bottom=1 -V papersize=letter

html: $(SOURCES)
	pandoc resume.md -o resume.html -t html --css style.css --standalone \
		-V margin-top=1 -V margin-left=1 -V margin-right=1 -V margin-bottom=1 -V papersize=letter
