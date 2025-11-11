#!/bin/bash

# Ask how many destinations to create
read -p "Enter how many destinations to prepare: " loop_count

# Define the list of folders to copy
folders=(
"P1 - Vision Stratégique"
"P2 - Administration"
"P3 - Finance & Rentabilité"
"P4 - Marketing & Expérience"
"P5 - Opérations"
"P6 - Ressources humaines"
"P7 - Technologies de l'information"
"P8 - Communications internes"
"P9 - Innovation & Amélioration continue"
"P10 - Partenariats & relations stratégiques"
)

# Starting index
read -p "Enter the start index: " start_index

# --- FIRST LOOP: collect all client names ---
declare -a client_names

echo ""
echo "============================================"
echo "STEP 1: Enter all client names"
echo "============================================"

for ((i=0; i<loop_count; i++)); do
    current_index=$((start_index + i))
    echo ""
    echo "--------------------------------------------"
    read -p "Enter the client name for folder ${current_index} : " client_name
    client_names[$i]="$client_name"
    echo "Stored: ${current_index} - ${client_name}"
done

echo ""
echo "============================================"
echo "All client names have been collected:"
echo "============================================"

for ((i=0; i<loop_count; i++)); do
    echo "$((start_index + i)) - ${client_names[$i]}"
done

echo ""
read -p "Press ENTER to start the copy process..."

# --- SECOND LOOP: execute the copies ---
echo ""
echo "============================================"
echo "STEP 2: Starting copy process"
echo "============================================"

for ((i=0; i<loop_count; i++)); do
    current_index=$((start_index + i))
    dest_folder="${current_index} - Drive structure d'entreprise_${client_names[$i]}"

    echo ""
    echo "--------------------------------------------"
    echo "Copying for destination: ${dest_folder}"
    echo "--------------------------------------------"

    for folder in "${folders[@]}"; do
        echo "Copying $folder ..."
        rclone copy "GoogleDrive:2-Template a jour/$folder" \
                    "GoogleDrive:${dest_folder}/$folder" \
                    --progress --create-empty-src-dirs
    done

    echo "Copy completed for: ${dest_folder}"
done

echo ""
echo "============================================"
echo "All ${loop_count} destinations copied successfully."
echo "Starting index: ${start_index}"
echo "============================================"
