#!/bin/bash

# Script to convert PDF files referenced in README.md to PNG format
# and update the README to use PNG versions

echo "Converting PDF files to PNG format..."

# Directory containing the images
IMG_DIR="final_pics_for_paper"

# List of PDF files referenced in the README
PDF_FILES=(
    "flipchip_vs_wirebond_illustration.pdf"
    "rf_simulated_vs_real_dut.pdf"
    "tgf_2023_2_02_cw_model_circuit_qucs.pdf"
)

# Function to convert PDF to PNG using ImageMagick (if available) or Ghostscript
convert_pdf_to_png() {
    local pdf_file="$1"
    local png_file="${pdf_file%.pdf}.png"
    local full_pdf_path="$IMG_DIR/$pdf_file"
    local full_png_path="$IMG_DIR/$png_file"
    
    if [ ! -f "$full_pdf_path" ]; then
        echo "Warning: $full_pdf_path not found, skipping..."
        return 1
    fi
    
    echo "Converting $pdf_file to $png_file..."
    
    # Try ImageMagick first
    if command -v convert >/dev/null 2>&1; then
        convert -density 300 -quality 90 "$full_pdf_path" "$full_png_path"
        if [ $? -eq 0 ]; then
            echo "Successfully converted $pdf_file using ImageMagick"
            return 0
        fi
    fi
    
    # Try Ghostscript if ImageMagick failed or not available
    if command -v gs >/dev/null 2>&1; then
        gs -dNOPAUSE -dBATCH -sDEVICE=png16m -dGraphicsAlphaBits=4 -dTextAlphaBits=4 -r300 -sOutputFile="$full_png_path" "$full_pdf_path"
        if [ $? -eq 0 ]; then
            echo "Successfully converted $pdf_file using Ghostscript"
            return 0
        fi
    fi
    
    # Try pdftoppm if available (from poppler-utils)
    if command -v pdftoppm >/dev/null 2>&1; then
        pdftoppm -png -r 300 "$full_pdf_path" "${full_png_path%.png}"
        # pdftoppm adds page numbers, so rename the first page
        if [ -f "${full_png_path%.png}-1.png" ]; then
            mv "${full_png_path%.png}-1.png" "$full_png_path"
            echo "Successfully converted $pdf_file using pdftoppm"
            return 0
        fi
    fi
    
    echo "Error: Could not convert $pdf_file. Please install ImageMagick, Ghostscript, or poppler-utils"
    return 1
}

# Convert each PDF file
for pdf_file in "${PDF_FILES[@]}"; do
    convert_pdf_to_png "$pdf_file"
done

echo "PDF to PNG conversion completed!"
echo ""
echo "Now updating README.md to use PNG versions..."

# Update README.md to use PNG versions
sed -i 's/flipchip_vs_wirebond_illustration\.pdf/flipchip_vs_wirebond_illustration.png/g' README.md
sed -i 's/rf_simulated_vs_real_dut\.pdf/rf_simulated_vs_real_dut.png/g' README.md
sed -i 's/tgf_2023_2_02_cw_model_circuit_qucs\.pdf/tgf_2023_2_02_cw_model_circuit_qucs.png/g' README.md

echo "README.md updated successfully!"
echo ""
echo "Summary of changes:"
echo "- flipchip_vs_wirebond_illustration.pdf → flipchip_vs_wirebond_illustration.png"
echo "- rf_simulated_vs_real_dut.pdf → rf_simulated_vs_real_dut.png"
echo "- tgf_2023_2_02_cw_model_circuit_qucs.pdf → tgf_2023_2_02_cw_model_circuit_qucs.png"
echo ""
echo "All PDF references in README.md have been updated to use PNG versions."
