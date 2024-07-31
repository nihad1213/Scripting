#!/bin/bash

# Function to translate text using 'trans' command-line tool
translate_text() {
    # Source and target languages
    SOURCE_LANG=$1
    TARGET_LANG=$2

    # Text to translate
    TEXT="$3"

    # Make the translation request and extract translation
    TRANSLATION=$(trans -brief -s $SOURCE_LANG -t $TARGET_LANG "$TEXT")

    echo "$TRANSLATION"
}

# Check if clipboard contains text
if [ -n "$(xclip -selection clipboard -o)" ]; then
    CLIPBOARD_CONTENT=$(xclip -selection clipboard -o)

    # Translate from English to Hebrew
    TRANSLATION_EN_TO_HE=$(translate_text "en" "iw" "$CLIPBOARD_CONTENT")
    echo "English to Hebrew: $TRANSLATION_EN_TO_HE"

    # Translate from Hebrew to English
    TRANSLATION_HE_TO_EN=$(translate_text "iw" "en" "$CLIPBOARD_CONTENT")
    echo "Hebrew to English: $TRANSLATION_HE_TO_EN"
else
    echo "Clipboard is empty!"
fi
