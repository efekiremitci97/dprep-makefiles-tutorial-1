##Main build rule
all: plot_Antwerp.pdf plot_all.pdf

## Sub-builds
reviews.csv listings.csv: download_data.R
		R --vanilla < download_data.R

aggregated_df.csv: research_project.R reviews.csv listings.csv
		R --vanilla < research_project.R 
		
pivot_table.csv: export_pivot.R aggregated_df.csv
		R --vanilla < research_project.R
		
plot_antwerp.pdf: plot_antwerp.R pivot_table.csv
		R --vanilla < plot_antwerp.R 
		
plot_all.pdf: aggregated_df.csv plot_all.R
		R --vanilla < plot_all.R