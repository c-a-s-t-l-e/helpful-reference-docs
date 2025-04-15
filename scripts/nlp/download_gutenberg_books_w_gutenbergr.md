This is how to download Project Gutenberg books with the gutenbergr package:

```{r}
# Install packages (if needed)
install.packages(pkgs = c("gutenbergr", "dplyr"))

# 1. Load libraries
library(gutenbergr)
library(dplyr) # Handy for data manipulation

# 2. Find books by title or author
gutenberg_works(title == "Wuthering Heights")

# 3. Download the book (ID 768)
wuthering_heights <- gutenberg_download(768)

# The result 'wuthering_heights' is a tibble (a type of data frame)
# It has columns: gutenberg_id and text (each row is a line from the book)
print(head(wuthering_heights))

# 4. Extract the text content
text_lines <- wuthering_heights$text

# 5. Specify the output file name
output_filename <- "wuthering_heights.txt"

# 6. Write the lines to the file
writeLines(text_lines, output_filename)

print(paste("Book saved as:", output_filename))
```
