# Large CRAN File Processor

This repository contains an R script for efficiently processing large `.cran` files in chunks. The script reads the file in manageable pieces, processes each chunk, and outputs the results, all without loading the entire file into memory at once.

## Features

- **Efficient Processing**: The script reads and processes large files in chunks to avoid memory issues.
- **Data Filtering**: The script demonstrates how to filter data using `dplyr` during processing.
- **Output**: Processed data is saved into a CSV file, with each chunk appended to the output.

## Setup

### Prerequisites

Before running the script, ensure you have the following installed:

1. **R**: Download and install R from [CRAN](https://cran.r-project.org/).
2. **Required R Packages**: You need the `data.table` and `dplyr` packages. You can install them using the following commands in R:

    ```r
    install.packages("data.table")
    install.packages("dplyr")
    ```

### File Path

1. Update the path to the `.cran` file in the script to point to the actual file you want to process. In the `process_large_cran_files.R` script, modify the `file_path` variable:

    ```r
    file_path <- "path/to/your/large_file.cran"  # Replace with actual file path
    ```

2. Ensure the `.cran` file is accessible to the script from your local environment or a networked location.

### Chunk Size

The script reads the file in chunks. You can modify the chunk size based on your system's memory. The default chunk size is set to 100,000 rows per chunk, but you can change this by modifying the `chunk_size` variable in the script:

```r
chunk_size <- 100000  # Adjust as needed based on available memory
```

## Usage

  ### 1. Clone the Repository
To get started, clone the repository to your local machine by running the following command in your terminal:

```
git clone https://github.com/your-username/large-cran-file-processor.git
cd large-cran-file-processor
```
### 2. Install Required R Packages
Before running the script, you need to install the required R packages. Open an R session (e.g., RStudio or R console) and install the dependencies:
```
install.packages("data.table")
install.packages("dplyr")

```
### 3. Set the Path to Your `.cran` File
Update the `file_path` in the `process_large_cran_files.R` script to point to the location of your `.cran` file. Open the script and modify the `file_path` variable:

```
file_path <- "path/to/your/large_file.cran"  # Replace with the actual file path
```

### 4. Adjust the Chunk Size (Optional)
The script reads the file in chunks to avoid memory issues. The default chunk size is set to 100,000 rows per chunk. You can modify this depending on your system's memory:

```
chunk_size <- 100000  # Adjust as needed based on available memory
```

### 5. Run the Script
Once you've set the correct file path and adjusted the chunk size (if needed), run the script in your R environment. You can do this by running the following command in your R session:

```
source("process_large_cran_files.R")
```

### 6. Output
The script will process the `.cran` file in chunks and save the processed data into a CSV file called `processed_output.csv`. Each chunk will be appended to this output file.

You can customize the output file name or format by modifying the script as needed.

### 7. Modify Data Filtering (Optional)
If you want to filter the data during processing (for example, filter rows where the value of `column_name` is greater than 100), update the filter condition in the script:

```
filtered_chunk <- chunk %>%
    filter(column_name > 100)  # Replace with your actual column name and condition
```

### 8. Troubleshooting
**Memory Issues**: If you encounter memory issues, reduce the `chunk_size` value and try again.

**File Format**: If your `.cran` file is not in CSV format or requires special handling (e.g., .rds), modify the fread() function accordingly.
