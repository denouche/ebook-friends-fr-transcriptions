#!/bin/bash

rm -rf dist/
mkdir -p dist/markdown
mkdir -p dist/epub

# create merged markdown files
ls -1 Saisons/ | xargs -I{} bash -c 'cat Saisons/{}/* > dist/markdown/{}.md'

# create epubs
ls -1 dist/markdown/ | xargs -I{} bash -c "ebook-convert dist/markdown/{} dist/epub/{}.epub --max-toc-links 0 --markdown-extensions meta,toc --toc-filter '^(\[|\(|GENERIQUE|Générique|FIN)'"
rename 's/\.md//' dist/epub/*.epub
