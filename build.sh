#!/bin/sh

if [ -d "static/blog" ]; then
    rm -rf static/blog
fi
mkdir static/blog

articleindex=""

for file in blog/*.md; do
    out="static/${file%.md}.html"

    # Create article page
    awk '
        NR==FNR { a[NR] = $0; next }
        { flag = 1 }
        /{{post}}/ { flag = 0; for (i = 1; i <= length(a); i++) { print a[i] } }
        flag { print }
    ' <(cmark $file) blog/article.template > $out

    # Create article index entry
    date=$(echo "${file#blog/}" | awk 'BEGIN { FS = "-"; OFS = "-" } { print $1, $2, $3 }')
    thisindex=$(
        cat "blog/index-article.template" \
        | sed "s/{{datetime}}/${date}T00:00:00/" \
        | sed "s/{{date}}/$date/" \
        | sed "s:{{filename}}:${out#static/}:" \
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
' <(echo "$articleindex") blog/index.template > static/blog/index.html
