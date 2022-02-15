#!/bin/sh
#
# This file converts the odt file to Markdown in two stages:
# - Use the soffice binary (points to libreoffice usually now) to convert to HTML.
# - Use markdownify


echo
REPO_DIR="`pwd`"
REPO_DOCS="$REPO_DIR/documentation"
REPO_DOC_MD_DIR="$REPO_DOCS/odt-md"
BASE="Sixteen_Combos-Rules"
REPO_DOC="$REPO_DOCS/$BASE.odt"
tidy_conf="$REPO_DIR/tidy_options.conf"

#if [ ! -f "`command -v xmllint`" ]; then
#    echo "Error: This script requires the 'xmllint' command."
#    exit 1
#fi
if [ ! -f "`command -v tidy`" ]; then
    echo "Error: This script requires the 'tidy' command such as from the tidy package."
    exit 1
fi
if [ ! -f "`command -v markdownify`" ]; then
    echo "Error: This script requires the 'markdownify' command such as from <https://github.com/poikilos/markdownify-cli>."
    exit 1
fi
if [ ! -d "$REPO_DOCS" ]; then
    echo "Error: \"$REPO_DOCS\" is not a directory. This script can only run from the sixteencombos repo."
    exit 1
fi
if [ ! -d "$REPO_DOC_MD_DIR" ]; then
    # echo "Error: \"$REPO_DOC_MD_DIR\" is not a directory. This script can only run from the sixteencombos repo."
    # exit 1
    echo "* WARNING: creating \"$REPO_DOC_MD_DIR\"..."
    mkdir "$REPO_DOC_MD_DIR"
    if [ $? -ne 0 ]; then
        echo "Error: 'mkdir \"$TMP_DOC_MD\"' failed."
        exit 1
    else
        echo "OK"
    fi
fi
if [ ! -f "$REPO_DOC" ]; then
    echo "Error: \"$REPO_DOC\" is not a file. This script can only run from the sixteencombos repo."
    exit 1
fi
if [ ! -d "$REPO_DIR/documentation/odt-html" ]; then
    echo "Error: \"documentation/odt-html\" is missing in \"`pwd`\". This script only runs from the sixteencombos repo."
    # exit 1
fi

TMP_DOC_HTML_DIR=/tmp/$BASE-to-HTML
TMP_DOC_MD=/tmp/$BASE-to-MD
if [ -d "$TMP_DOC_HTML_DIR" ]; then
    printf "* removing an old copy of \"$TMP_DOC_HTML_DIR\"..."
    rm -Rvf "$TMP_DOC_HTML_DIR"
    if [ $? -ne 0 ]; then
        echo "Error: 'rm -Rvf \"$TMP_DOC_HTML_DIR\"' failed."
        exit 1
    else
        echo "OK"
    fi
fi
if [ -d "$TMP_DOC_MD" ]; then
    printf "* removing an old copy of \"$TMP_DOC_MD\"..."
    rm -rvf "$TMP_DOC_MD"
    if [ $? -ne 0 ]; then
        echo "Error: 'rm -rvf \"$TMP_DOC_MD\"' failed."
        exit 1
    else
        echo "OK"
    fi
fi

mkdir $TMP_DOC_HTML_DIR
if [ $? -ne 0 ]; then
    echo "Error: 'mkdir \"$TMP_DOC_HTML_DIR\"' failed."
    exit 1
fi
mkdir $TMP_DOC_MD
if [ $? -ne 0 ]; then
    echo "Error: 'mkdir \"$TMP_DOC_MD\"' failed."
    exit 1
fi
#cd $TMP_DOC_HTML_DIR
#if [ $? -ne 0 ]; then
#    echo "Error: 'cd \"$TMP_DOC_HTML_DIR\"' failed."
#    exit 1
#i

printf "* converting odt to html+media at destination \"$TMP_DOC_HTML_DIR\"..."
# ^ The unzip command below shows the archive name so $REPO_DOC
#   doesn't need to be shown.
libreoffice --headless --convert-to htm:HTML --outdir "$TMP_DOC_HTML_DIR" "$REPO_DOC"
# ^ ".htm" is changed to ".html" by tidy further down
# ^ The command will do nothing if libreoffice is already open
#   (<https://stackoverflow.com/a/31241534/4541104>) but it still returns 0,
#   so check if the file got generated:
REPO_DOC_HTM_NOT_TIDY="$TMP_DOC_HTML_DIR/$BASE.htm"
TMP_DOC_HTML="${REPO_DOC_HTM_NOT_TIDY}l"
TMP_DOC_MD="$TMP_DOC_HTML_DIR/$BASE.md"

if [ $? -ne 0 ]; then
    echo "Error: 'libreoffice --headless --convert-to htm:HTML --outdir \"$TMP_DOC_HTML_DIR\" \"$REPO_DOC\"' failed."
    exit 1
elif [ ! -f "$REPO_DOC_HTM_NOT_TIDY" ]; then
    echo "The libreoffice command didn't produce \"$REPO_DOC_HTM_NOT_TIDY\". Make sure you close all libreoffice windows first."
    exit 1
else
    echo "OK"
fi

echo "* formatting HTML to $TMP_DOC_HTML..."
tidy -q -config $tidy_conf -f $TMP_DOC_HTML.err -i $REPO_DOC_HTM_NOT_TIDY | sed 's/ class="c[0-9]*"//g' > $TMP_DOC_HTML
if [ $? -ne 0 ]; then
    echo "Error: 'tidy -q -config $tidy_conf -f $TMP_DOC_HTML.err -i $REPO_DOC_HTM_NOT_TIDY | sed 's/ class=\"c[0-9]*\"//g' > $TMP_DOC_HTML' failed."
    exit 1
else
    echo "OK"
fi
echo "* converting to Markdown..."
markdownify $TMP_DOC_HTML
if [ $? -ne 0 ]; then
    echo "Error: 'markdownify $BASE.html' failed."
    exit 1
elif [ ! -f "$TMP_DOC_MD" ]; then
    echo "Error: 'markdownify $BASE.html' did not produce \"$TMP_DOC_MD\"."
    exit 1
else
    echo "OK"
fi
printf "* removing $REPO_DOC_HTM_NOT_TIDY..."
rm -f "$REPO_DOC_HTM_NOT_TIDY"
if [ $? -ne 0 ]; then
    echo "Error: 'rm -f \"$REPO_DOC_HTM_NOT_TIDY\"' failed."
    exit 1
else
    echo "OK"
fi

printf "* removing $TMP_DOC_HTML..."
rm -f "$TMP_DOC_HTML"
if [ $? -ne 0 ]; then
    echo "Error: 'rm -f \"$TMP_DOC_HTML\"' failed."
    exit 1
else
    echo "OK"
fi

printf "* updating \"$REPO_DOC_MD_DIR\" from $TMP_DOC_MD..."
# rsync -rtv $TMP_DOC_MD "$REPO_DOC_MD_DIR"
rsync -tv $TMP_DOC_MD "$REPO_DOC_MD_DIR/"
if [ $? -ne 0 ]; then
    # echo "Error: 'rsync -rtv ./ \"$REPO_DOC_MD_DIR\"' failed in `pwd`."
    echo "Error: 'rsync -tv $TMP_DOC_MD \"$REPO_DOC_MD_DIR\"' failed."
    exit 1
else
    echo "OK"
fi
rm -Rf "$TMP_DOC_HTML_DIR"
if [ $? -ne 0 ]; then
    echo "Warning: 'rm -Rf \"$TMP_DOC_HTML_DIR\"' failed."
    exit 1
else
    echo "* removed \"$TMP_DOC_HTML_DIR\"."
fi
echo "* The extracted version of the document is ready to stage in the git repo \"$REPO_DIR\"."
echo "  * See the new markdown in \"$REPO_DOC_MD_DIR\""
echo "* Done"
echo
