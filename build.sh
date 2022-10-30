#!/bin/sh

if [ -d "build" ]; then
    rm -rf build
fi
mkdir build
mkdir build/blog

cp avatar.png build/avatar.png

# Create stylesheet
sass -s compressed --no-source-map style.scss build/style.css

# Generate blog posts
articleindex=""
for file in blog/*.md; do
    out="build/${file%.md}.html"

    # Extract title and date, generate article body
    title=$(head -n 1 $file | sed "s/# //")
    rawdate=$(echo "${file#blog/}" | awk 'BEGIN { FS = "-"; OFS = "-" } { print $1, $2, $3 }')
    date=$(date -d "$rawdate" +"%B %d, %Y")
    article=$(tail -n+3 $file | cmark)

    # Create article page
    cat article.html \
    | sed "s/{{title}}/${title}/" \
    | sed "s/{{date}}/${date}/" \
    | awk -v article="$article" '
        { flag = 1 }
        /{{post}}/ { flag = 0; print article }
        flag { print }
    ' > $out

    # Create article index entry
    thisindex=$(
        cat article-entry.html \
        | sed "s/{{datetime}}/${date}T00:00:00/" \
        | sed "s/{{date}}/$date/" \
        | sed "s:{{filename}}:${out#build}:" \
        | sed "s/{{title}}/$(cat $file | head -1 | sed 's/# //')/"
    )
    articleindex="$thisindex$articleindex"
done

# Create index
awk '
    NR==FNR { a[NR] = $0; next }
    { flag = 1 }
    /{{posts}}/ { flag = 0; for (i = 1; i <= length(a); i++) { print a[i] } }
    flag { print }
' <(echo "$articleindex") index.html > build/index.html
