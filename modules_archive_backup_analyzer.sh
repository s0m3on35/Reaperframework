#!/bin/bash
# Archive & Backup Analyzer - by Un1nv1t3dr34p3r

echo "[*] Iniciando análisis de archivos de respaldo y archivos comprimidos..."

input_file="targets.txt"
output_file="archive_backup_findings.txt"

# Patrones comunes
patterns=(".zip" ".tar.gz" ".bak" ".old" ".backup" ".rar" ".7z" ".tar" ".gz" ".swp" ".~")

while IFS= read -r url; do
    for ext in "${patterns[@]}"; do
        test_url="${url}/${RANDOM}${ext}"
        response=$(curl -sk --max-time 10 -o /dev/null -w "%{http_code}" "$test_url")
        if [[ "$response" == "200" ]]; then
            echo "[+] Posible archivo encontrado: $test_url" | tee -a "$output_file"
        fi
    done
done < "$input_file"

echo "[*] Análisis completado. Resultados guardados en $output_file."
