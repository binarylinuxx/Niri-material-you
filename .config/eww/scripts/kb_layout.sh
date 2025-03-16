#!/bin/bash

# Получаем текущую раскладку
layout=$(niri msg keyboard-layouts | awk '/\*/ {print $3}')

# Проверяем и выводим код раскладки
if [[ "$layout" == "English" ]]; then
    echo "EN"
elif [[ "$layout" == "Russian" ]]; then
    echo "RU"
else
    echo "Unknown layout: $layout"
fi

