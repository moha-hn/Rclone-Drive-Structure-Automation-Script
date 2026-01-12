# Rclone Drive Structure Automation Script

This Bash script automates the creation and duplication of standardized Google Drive structures for multiple clients using Rclone.  
It simplifies the onboarding process and quickly deploys consistent folder structures (P1–P10) for each new company.

---

## Features

- **Interactive prompts** – no need to edit the script manually  
  - Choose how many destinations to prepare  
  - Set a starting index (for example, 6 → creates “6 - Drive structure d’entreprise_…”)  
  - Enter client names one by one  
- **Two-step execution**
  1. Collect all client names  
  2. Copy all template folders for each client automatically  
- **Consistent naming convention**
[Index] - Drive structure d'entreprise_[Client Name]

yaml
Copier le code
- **Rclone integration**
- Fully replicates all subfolders  
- Preserves empty folders  
- Displays real-time progress

---

## Folder Structure Example

### Source Template (`2-Template a jour`)
2-Template a jour/
├── P1 - Vision Stratégique
├── P2 - Administration
├── P3 - Finance & Rentabilité
├── P4 - Marketing & Expérience
├── P5 - Opérations
├── P6 - Ressources humaines
├── P7 - Technologies de l'information
├── P8 - Communications internes
├── P9 - Innovation & Amélioration continue
└── P10 - Partenariats & relations stratégiques

shell
Copier le code

### Destination Example (auto-generated)
6 - Drive structure d'entreprise_/
├── P1 - Vision Stratégique
├── P2 - Administration
...
└── P10 - Partenariats & relations stratégiques

yaml
Copier le code

---

## Installation

### 1. Install Rclone
Follow the [official installation guide](https://rclone.org/install/).

### 2. Authorize Rclone with Google Drive
Run these commands to set up authentication:
```bash
rclone authorize "drive"
rclone config reconnect GoogleDrive:
rclone lsd GoogleDrive:
The last command should list your Drive folders, confirming that access works.

Usage
1. Make the script executable
bash
Copier le code
chmod +x drive_copy.sh
2. Run the script
bash
Copier le code
./drive_copy.sh
You will be guided through interactive prompts like:

yaml
Copier le code
Enter how many destinations to prepare: 3
Enter the start index: 6

STEP 1: Enter all client names
Enter the client name for folder 6 : Toitures L et L inc_Emmanuel Matte
Enter the client name for folder 7 : Reno Expertise_Christian Bernier
Enter the client name for folder 8 : CINDY TESSIER_Partenaires d’Affaires

All client names collected:
6 - Toitures L et L inc_Emmanuel Matte
7 - Reno Expertise_Christian Bernier
8 - CINDY TESSIER_Partenaires d’Affaires
Press ENTER to start the copy process...
The script will then automatically copy the standard folders for each client.

Example Output
python-repl
Copier le code
Copying for destination: 6 - Drive structure d'entreprise_Toitures L et L inc_Emmanuel Matte
Copying P1 - Vision Stratégique ...
Copying P2 - Administration ...
...
All 3 destinations copied successfully.
Starting index: 6
Notes
Each folder copy is performed with:

bash
Copier le code
rclone copy "GoogleDrive:2-Template a jour/$folder" \
            "GoogleDrive:${dest_folder}/$folder" \
            --progress --create-empty-src-dirs
The script ensures subfolders are created even if empty.

It works safely and does not overwrite unrelated folders.

Best executed from a Linux terminal or macOS shell.

Requirements
Bash shell (Linux or macOS)

Rclone installed and configured with a Google Drive remote (named GoogleDrive:)

Access to a source folder (like 2-Template a jour) containing the P1–P10 structure

Author
Mohamed Amine Hanou
Automation & Systems Engineer – HustleUp
