build_dir := justfile_directory() + "/build"
file_name := "Riley Shahar - Resume"

pandoc := "pandoc resume.md -o"
pandoc_args := "-t html --css style.css --standalone --embed-resources"

company := ""
target_dir := build_dir + "/" + company
file_path := if company == "" {target_dir + "/" + file_name} else {target_dir + "/" + file_name + " - " + company}


# build the html and pdf resume
default: html pdf

# build the html resume
html: build_dir
	{{pandoc}} "{{file_path}}.html" {{pandoc_args}} -H header.html

# build the pdf resume
pdf: build_dir
	{{pandoc}} "{{file_path}}.pdf" {{pandoc_args}} -V margin-top=1 -V margin-left=1 -V margin-right=1 -V margin-bottom=1 -V papersize=letter

# create the build directory
build_dir:
	mkdir -p {{target_dir}}

# delete the build directory
clean:
	-rm -rf {{target_dir}}
