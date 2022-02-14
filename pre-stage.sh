#!/bin/sh
echo
REPO_DIR="`pwd`"
REPO_DOCS="$REPO_DIR/documentation"
REPO_DOC_EXTRACTED="$REPO_DOCS/odt-extracted"
REPO_DOC="$REPO_DOCS/Sixteen_Combos-Rules.odt"
if [ ! -f "`command -v xmllint`" ]; then
    echo "Error: This script requires the 'xmllint' command."
    exit 1
fi
if [ ! -d "$REPO_DOCS" ]; then
    echo "Error: \"$REPO_DOCS\" is not a directory. This script can only run from the sixteencombos repo."
    exit 1
fi
if [ ! -d "$REPO_DOC_EXTRACTED" ]; then
    echo "Error: \"$REPO_DOC_EXTRACTED\" is not a directory. This script can only run from the sixteencombos repo."
    exit 1
fi
if [ ! -f "$REPO_DOC" ]; then
    echo "Error: \"$REPO_DOC\" is not a file. This script can only run from the sixteencombos repo."
    exit 1
fi
TMP_DOC_EXTRACTED=/tmp/Sixteen_Combos-Rules
TMP_XML_FORMATTED=/tmp/Sixteen_Combos-Rules-tmp.xml
if [ -d "$TMP_DOC_EXTRACTED" ]; then
    printf "* removing an old copy of \"$TMP_DOC_EXTRACTED\"..."
    rm -Rf "$TMP_DOC_EXTRACTED"
    if [ $? -ne 0 ]; then
        echo "Error: 'rm -Rf \"$TMP_DOC_EXTRACTED\"' failed."
        exit 1
    else
        echo "OK"
    fi
fi
if [ -f "$TMP_XML_FORMATTED" ]; then
    printf "* removing an old copy of \"$TMP_XML_FORMATTED\"..."
    rm -f "$TMP_XML_FORMATTED"
    if [ $? -ne 0 ]; then
        echo "Error: 'rm -f \"$TMP_XML_FORMATTED\"' failed."
        exit 1
    else
        echo "OK"
    fi
fi
mkdir $TMP_DOC_EXTRACTED
if [ $? -ne 0 ]; then
    echo "Error: 'mkdir \"$TMP_DOC_EXTRACTED\"' failed."
    exit 1
fi
cd $TMP_DOC_EXTRACTED
if [ $? -ne 0 ]; then
    echo "Error: 'cd \"$TMP_DOC_EXTRACTED\"' failed."
    exit 1
fi
printf "* extracting to `pwd`..."
# ^ The unzip command below shows the archive name so $REPO_DOC
#   doesn't need to be shown.
unzip "$REPO_DOC"
if [ $? -ne 0 ]; then
    echo "Error: 'unzip \"$REPO_DOC\"' failed."
    exit 1
else
    echo "OK"
fi
echo "* formatting XML..."

for EXTRACTED_XML in content.xml meta.xml styles.xml settings.xml
do
    printf "* preparing \"$EXTRACTED_XML\" at \"$TMP_XML_FORMATTED\"..."
    if [ ! -f "$EXTRACTED_XML" ]; then
        echo "Error: There is no '$EXTRACTED_XML' in the archive."
        exit 1
    fi
    cat "$EXTRACTED_XML" | xmllint --format - > "$TMP_XML_FORMATTED"
    if [ $? -ne 0 ]; then
        echo "Error: 'cat $EXTRACTED_XML | xmllint --format - > \"$TMP_XML_FORMATTED\"' failed in `pwd`."
        exit 1
    else
        echo "OK"
    fi
    printf "  * moving result to overwrite \"$EXTRACTED_XML\"..."
    mv "$TMP_XML_FORMATTED" "$EXTRACTED_XML"
    if [ $? -ne 0 ]; then
        echo "Error: 'mv \"$TMP_XML_FORMATTED\" \"$EXTRACTED_XML\"' failed in `pwd`."
        exit 1
    else
        echo "OK"
    fi
done


printf "* updating \"$REPO_DOC_EXTRACTED\" from `pwd`..."
rsync -rtv ./ "$REPO_DOC_EXTRACTED"
if [ $? -ne 0 ]; then
    echo "Error: 'rsync -rtv ./ \"$REPO_DOC_EXTRACTED\"' failed in `pwd`."
    exit 1
else
    echo "OK"
fi
rm -Rf "$TMP_DOC_EXTRACTED"
if [ $? -ne 0 ]; then
    echo "Warning: 'rm -Rf \"$TMP_DOC_EXTRACTED\"' failed."
    exit 1
else
    echo "* removed \"$TMP_DOC_EXTRACTED\"."
fi
echo "* The extracted version of the document is ready to stage in the git repo \"$REPO_DIR\"."
echo "* Done"
echo
