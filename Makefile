## report.html: rule for making report  
report.html: Data/LandUse_Clean.csv Figures/fig1.png Rcode/ProjectReport.Rmd
	cd Rcode &&\
	Rscript -e "rmarkdown::render('ProjectReport.Rmd', output_dir = '../output')"
	
## fig1.png: rule for making figure 1
Figures/fig1.png: Rcode/fig1.R Data/LandUse_Clean.csv Rcode/MakeTable.R
	cd Rcode &&\
	Rscript fig1.R
	
## LandUse_Clean.csv: rule for cleaning data and outputting it in a csv file
Data/LandUse_Clean.csv: Rcode/cleandata.R Data/LandUse_Future.csv
	Rscript Rcode/cleandata.R

.PHONY: help
help: Makefile
	@sed -n 's/^##//p' $<
