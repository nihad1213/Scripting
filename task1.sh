#!/bin/bash

convert_string() {
    # Relation between layout of Russian and English
    declare -A conversion_map=(
        ["q"]="й" ["w"]="ц" ["e"]="у" ["r"]="к" ["t"]="е" ["y"]="н" ["u"]="г" ["i"]="ш"
        ["o"]="щ" ["p"]="з" ["["]="х" ["]"]="ъ" ["a"]="ф" ["s"]="ы" ["d"]="в" ["f"]="а"
        ["g"]="п" ["h"]="р" ["j"]="о" ["k"]="л" ["l"]="д" [";"]="ж" ["'"]="э" ["z"]="я"
        ["x"]="ч" ["c"]="с" ["v"]="м" ["b"]="и" ["n"]="т" ["m"]="ь" [","]="б" ["."]="ю"
        ["/"]="." ["Q"]="Й" ["W"]="Ц" ["E"]="У" ["R"]="К" ["T"]="Е" ["Y"]="Н" ["U"]="Г"
        ["I"]="Ш" ["O"]="Щ" ["P"]="З" ["{"]="Х" ["}"]="Ъ" ["A"]="Ф" ["S"]="Ы" ["D"]="В"
        ["F"]="А" ["G"]="П" ["H"]="Р" ["J"]="О" ["K"]="Л" ["L"]="Д" [";"]="Ж" ["'"]="Э"
        ["Z"]="Я" ["X"]="Ч" ["C"]="С" ["V"]="М" ["B"]="И" ["N"]="Т" ["M"]="Ь" [","]="Б"
        ["."]="Ю" ["/"]=","
    )

    local input_string="$1"
    local converted_string=""

    for ((i=0; i<${#input_string}; i++)); do
        char="${input_string:$i:1}"
        converted_string+="${conversion_map[$char]:-$char}"
    done

    echo "$converted_string"
}

# Change keyboard layout
change_layout() {
    local layout="$1"
    setxkbmap "$layout"
}

read -p "Enter the string with the wrong language layout: " input_string

echo "Original string: $input_string"

# Convert string to correct form
converted_string=$(convert_string "$input_string")
echo "Converted string: $converted_string"

# Change keyboard layout to the language of the converted string
change_layout "ru"
