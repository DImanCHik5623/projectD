#!/bin/bash

if [ "$#" -ne 2 ]; then
    echo "Использование: $0 <входная_директория> <выходная_директория>"
    exit 1
fi

input_dir="$1"
output_dir="$2"

if [ ! -d "$input_dir" ]; then
    echo "Входная директория не существует или не является директорией: $input_dir"
    exit 1
fi

if [ ! -d "$output_dir" ]; then
    mkdir -p "$output_dir"
fi

files=$(find "$input_dir" -type f)

for file in $files; do
    filename=$(basename "$file")
    cp "$file" "$output_dir/$filename"
done

echo "Файлы скопированы из $input_dir в $output_dir"

