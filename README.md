# FASTA File Combiner
This repository contains an R script that reads multiple FASTA files from a specified directory, converts all sequences to uppercase, and combines them into a single FASTA file. The script also handles errors gracefully and logs files that could not be read.

## Features

- Reads multiple FASTA files from a user-specified directory.
- Converts all sequences to uppercase.
- Combines all sequences into a single FASTA file.
- Logs files that could not be read due to errors.

## Requirements

- R (version 4.0 or later)
- RStudio (optional but recommended)

### R Packages

The following R package is required to run the script:

- seqinr

You can install this package using the following command:

```r
install.packages("seqinr")
