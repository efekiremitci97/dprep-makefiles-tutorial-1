##Main build rule

all: output/plot_Antwerp.pdf output/plot_all.pdf 

## Sub-builds
data/reviews.csv data/listings.csv: src/download_data.R
		R --vanilla < src/download_data.R

temp/aggregated_df.csv: src/clean_data.R data/reviews.csv data/listings.csv
		R --vanilla < src/clean_data.R 
		
temp/pivot_table.csv: src/export_pivot.R temp/aggregated_df.csv
		R --vanilla < src/export_pivot.R
		
output/plot_antwerp.pdf: src/plot_antwerp.R temp/pivot_table.csv
		R --vanilla < src/plot_antwerp.R 
		
output/plot_all.pdf: temp/aggregated_df.csv src/plot_all.R
		R --vanilla < src/plot_all.R