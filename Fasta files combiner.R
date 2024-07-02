library(seqinr)

dir_path <- choose.dir(default = getwd(), caption = "Select the Folder Containing the FASTA Files")
file_list <- list.files(path = dir_path, pattern = "\\.TXT$", full.names = TRUE)

all_sequences <- list()
error_files <- list()

for (file in file_list) {
  tryCatch({
    sequences <- read.fasta(file = file)
    if(length(sequences) > 0) {
      # Convert sequences to uppercase
      sequences <- lapply(sequences, toupper)
      all_sequences <- c(all_sequences, sequences)
      cat("Successfully read and converted to uppercase: ", file, "\n")
    } else {
      cat("No sequences found in: ", file, "\n")
      error_files <- c(error_files, file)
    }
  }, error = function(e) {
    cat("Error reading file: ", file, " - ", e$message, "\n")
    error_files <- c(error_files, file)
  })
}

output_file <- file.path(dir_path, "combined_sequences.fasta")
write.fasta(sequences = all_sequences, names = names(all_sequences), file.out = output_file)

cat("Files with errors: ", length(error_files), "\n")
if(length(error_files) > 0) {
  cat("Check the following files for formatting issues:\n")
  print(error_files)
}

cat("File writing complete, check the output file.\n")
