#!/bin/bash

# Script to convert markdown book chapters to a single PDF with cover page
# Usage: ./convert_to_pdf_v3.sh <directory>
# Example: ./convert_to_pdf_v3.sh english-version

set -e  # Exit on error

# Check if directory argument is provided
if [ $# -eq 0 ]; then
    echo "Usage: $0 <directory>"
    echo "Example: $0 english-version"
    exit 1
fi

BOOK_DIR="$1"
BOOK_DIR="${BOOK_DIR%/}"  # Remove trailing slash

# Validate directory exists
if [ ! -d "$BOOK_DIR" ]; then
    echo "Error: Directory '$BOOK_DIR' does not exist"
    exit 1
fi

echo "════════════════════════════════════════════════"
echo "  From Bit to Bitcoin - PDF Converter v3"
echo "════════════════════════════════════════════════"

# Determine language and set variables
if [[ "$BOOK_DIR" == *"english"* ]]; then
    COVER_IMAGE="images/bookcover.png"
    OUTPUT_NAME="$BOOK_DIR/from-bit-to-bitcoin-english.pdf"
    LANG_CODE="en"
elif [[ "$BOOK_DIR" == *"spanish"* ]]; then
    COVER_IMAGE="images/portadalibro.png"
    OUTPUT_NAME="$BOOK_DIR/from-bit-to-bitcoin-spanish.pdf"
    LANG_CODE="es"
else
    echo "Warning: Language not detected, using defaults"
    COVER_IMAGE="images/bookcover.png"
    OUTPUT_NAME="book.pdf"
    LANG_CODE="en"
fi

# Find chapters directory
if [ -d "$BOOK_DIR/chapters" ]; then
    CHAPTERS_DIR="$BOOK_DIR/chapters"
elif [ -d "$BOOK_DIR/capitulos" ]; then
    CHAPTERS_DIR="$BOOK_DIR/capitulos"
else
    echo "Error: chapters/capitulos directory not found in $BOOK_DIR"
    exit 1
fi

echo "📁 Book Directory: $BOOK_DIR"
echo "📚 Chapters Directory: $CHAPTERS_DIR"
echo "📄 Output: $OUTPUT_NAME"
echo "🌐 Language: $LANG_CODE"

# Verify cover image exists
if [ ! -f "$COVER_IMAGE" ]; then
    echo "⚠️  Warning: Cover image not found at $COVER_IMAGE"
    echo "    Proceeding without cover..."
    USE_COVER=false
else
    echo "🖼️  Cover Image: $COVER_IMAGE"
    USE_COVER=true
fi

# Create temporary working directory
TEMP_DIR=$(mktemp -d -t book-pdf-XXXXXX)
echo "📦 Temp Directory: $TEMP_DIR"

# Cleanup function
cleanup() {
    echo "🧹 Cleaning up temporary files..."
    rm -rf "$TEMP_DIR"
}
trap cleanup EXIT

# Create LaTeX preamble file for custom styling
echo "📝 Creating LaTeX preamble..."
cat > "$TEMP_DIR/preamble.tex" << 'EOF'
% Remove "Chapter" prefix completely
\usepackage{titlesec}

% Redefine chapter format to remove the word entirely
\titleformat{\chapter}[display]
  {\normalfont\huge\bfseries}{\thechapter}{20pt}{\Huge}
\titlespacing*{\chapter}{0pt}{7pt}{20pt}

% Start chapter numbering from 0
\setcounter{chapter}{-1}

% Force images to stay in place
\usepackage{float}
\let\origfigure\figure
\let\endorigfigure\endfigure
\renewenvironment{figure}[1][2] {
    \expandafter\origfigure\expandafter[H]
} {
    \endorigfigure
}

% Disable floating for all figures
\makeatletter
\def\fps@figure{H}
\makeatother
EOF

# Create cover page if image exists
if [ "$USE_COVER" = true ]; then
    echo "🎨 Creating cover page..."
    COVER_ABS_PATH=$(realpath "$COVER_IMAGE")

    cat > "$TEMP_DIR/00-cover.md" << EOF
---
title: ""
---

\thispagestyle{empty}

\vspace*{\fill}

\begin{center}
\includegraphics[width=0.7\textwidth]{$COVER_ABS_PATH}
\end{center}

\vspace*{\fill}

\newpage

EOF
fi

# Create table of contents page
echo "📑 Creating table of contents page..."
cat > "$TEMP_DIR/01-toc.md" << 'EOF'
---
title: ""
---

\tableofcontents

\newpage

EOF

# Find and sort chapter files
echo "🔍 Collecting chapter files..."
CHAPTER_FILES=()

for pattern in "chapter-" "capitulo-"; do
    while IFS= read -r -d '' file; do
        CHAPTER_FILES+=("$file")
    done < <(find "$CHAPTERS_DIR" -maxdepth 1 -name "${pattern}*.md" -print0 | sort -z)
done

CHAPTER_COUNT=${#CHAPTER_FILES[@]}

if [ $CHAPTER_COUNT -eq 0 ]; then
    echo "Error: No chapter files found"
    exit 1
fi

echo "✅ Found $CHAPTER_COUNT chapters"

# Build pandoc arguments array
PANDOC_ARGS=()

# Add cover if exists
if [ "$USE_COVER" = true ]; then
    PANDOC_ARGS+=("$TEMP_DIR/00-cover.md")
fi

# Add TOC page
PANDOC_ARGS+=("$TEMP_DIR/01-toc.md")

# Add all chapter files
for file in "${CHAPTER_FILES[@]}"; do
    PANDOC_ARGS+=("$file")
    echo "   - $(basename "$file")"
done

# Add output and options
PANDOC_ARGS+=(
    "-o" "$OUTPUT_NAME"
    "--pdf-engine=xelatex"
    "--include-in-header=$TEMP_DIR/preamble.tex"
    "--number-sections"
    "-V" "geometry:margin=1in"
    "-V" "fontsize=11pt"
    "-V" "documentclass=book"
    "-V" "papersize=letter"
    "-V" "colorlinks=true"
    "-V" "linkcolor=blue"
    "-V" "urlcolor=blue"
    "-V" "lang=$LANG_CODE"
    "--highlight-style=tango"
    "--resource-path=$CHAPTERS_DIR"
)

echo ""
echo "🚀 Generating PDF..."
echo "    This may take a minute..."

# Run pandoc
if pandoc "${PANDOC_ARGS[@]}"; then
    echo ""
    echo "════════════════════════════════════════════════"
    echo "✨ SUCCESS! PDF created: $OUTPUT_NAME"
    echo "════════════════════════════════════════════════"

    if [ -f "$OUTPUT_NAME" ]; then
        FILE_SIZE=$(du -h "$OUTPUT_NAME" | cut -f1)
        echo "📊 File size: $FILE_SIZE"
    fi
else
    echo ""
    echo "❌ Error: PDF generation failed"
    exit 1
fi
