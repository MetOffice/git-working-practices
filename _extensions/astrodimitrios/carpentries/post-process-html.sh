#!/bin/bash
# Remove Quarto's bootstrap
find "$QUARTO_PROJECT_OUTPUT_DIR" -name "*.html" -print0 | xargs -0 sed -i '/..\/site_libs\/bootstrap\/bootstrap/d'
find "$QUARTO_PROJECT_OUTPUT_DIR" -name "*.html" -print0 | xargs -0 sed -i '/styles.css.map/d'

if [ "$QUARTO_PROFILE" != "instructor" ]
then
  find "$QUARTO_PROJECT_OUTPUT_DIR" -name "*.html" -print0 | xargs -0 sed -i -e 's/="..\/site_libs\//="site_libs\//'
fi

find "$QUARTO_PROJECT_OUTPUT_DIR" -name "*extract_all_images.html" -print0 | xargs -0 sed -i '/<script id="quarto-html-after-body"/,/<\/script>/d'

IFS='
' # split on newline only
set -o noglob # disable globbing

# Flatten Quarto's Output Structure
DIR=(
    "$QUARTO_PROJECT_OUTPUT_DIR"/episodes/
    "$QUARTO_PROJECT_OUTPUT_DIR"/instructors/
    "$QUARTO_PROJECT_OUTPUT_DIR"/learners/
    "$QUARTO_PROJECT_OUTPUT_DIR"/profiles/
    )
for d in "${DIR[@]}"
do
  find "$d" -print0 | xargs -0 mv -t "$QUARTO_PROJECT_OUTPUT_DIR" 2> /dev/null
done

# search sitemap and robot still need flattening
