library(httr2)

# IMF SDMX API endpoint for CPI dataflow structure
url <- "https://api.imf.org/external/sdmx/3.0/structure/dataflow/IMF.STA/CPI/+?detail=full&references=children"

# Create and execute the request
response <- request(url) |>
  req_headers(
    "Accept" = "application/vnd.sdmx.structure+xml;version=3.0.0",
    "User-Agent" = "R httr2 client"
  ) |>
  req_perform()

# Check the response status
print(paste("Status:", resp_status(response)))

# Get the response body as text (XML format)
content <- resp_body_string(response)

# Print first 1000 characters to preview
cat("Response preview:\n")
cat(substr(content, 1, 1000))
cat("\n...\n")

# Optionally save the full response to a file
writeLines(content, "imf_cpi_dataflow.xml")
cat("Full response saved to: imf_cpi_dataflow.xml\n")
