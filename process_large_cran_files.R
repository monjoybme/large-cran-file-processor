# Install the required packages if they are not already installed
if (!require(data.table)) install.packages("data.table", dependencies = TRUE)
if (!require(dplyr)) install.packages("dplyr", dependencies = TRUE)

# Load necessary libraries
library(data.table)
library(dplyr)

# Define the path to the .cran file (replace with your actual file path)
file_path <- "path/to/your/large_file.cran"  # Update with actual file path

# Set the chunk size based on your system's memory and the file size
chunk_size <- 100000  # Adjust this as needed (number of rows per chunk)

# Initialize a counter for chunk processing
chunk_counter <- 1

# Process the file in chunks
repeat {
    # Read the next chunk from the file
    chunk <- fread(file_path, skip = (chunk_counter - 1) * chunk_size, nrows = chunk_size)
    
    # If the chunk is empty, stop the loop (end of file)
    if (nrow(chunk) == 0) {
        message("Finished processing all chunks.")
        break
    }
    
    # Process the chunk: for example, display the first few rows
    print(paste("Processing chunk", chunk_counter))
    print(head(chunk))  # Show the first few rows of the chunk
    
    # Example of data manipulation using dplyr (adjust this part as needed)
    filtered_chunk <- chunk %>%
        filter(column_name > 100)  # Replace column_name and condition with your actual logic
    
    # Optionally write the processed data to a new file (append mode)
    write.table(filtered_chunk, "processed_output.csv", append = TRUE, row.names = FALSE, col.names = FALSE, sep = ",")
    
    # Increment the chunk counter
    chunk_counter <- chunk_counter + 1
}
