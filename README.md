# 🚀 Multi-Cloud Data Migration Project

A real-world cloud-to-cloud data migration project using AWS EC2, rclone, Google Drive, and Dropbox.

---

## 📌 Project Overview

This project demonstrates how to migrate data between multiple cloud storage providers using a secure and automated approach.

### 💡 Architecture

Google Drive (Source 1) ┐  
                         ├──→ Dropbox (Destination)  
Google Drive (Source 2) ┘  

---

## ☁️ Technologies Used

- AWS EC2 (Free Tier)
- rclone (Cloud sync tool)
- Google Drive API
- Dropbox API
- Ubuntu Linux
- Bash scripting

---

## 📂 Sources & Destination

### Sources:
- Google Drive Account 1 (`gdrive_source`)
- Google Drive Account 2 (`gdrive_source2`)

### Destination:
- Dropbox (`dropbox_dest`)

---

## ⚙️ Setup Steps

### 1. Install rclone
```bash
sudo apt update
sudo apt install rclone -y

2. Configure remotes

rclone config

Create:
gdrive_source (Google Drive)
gdrive_source2 (Google Drive)
dropbox_dest (Dropbox)

🔍 Pre-Migration Checks
List files:

rclone lsf gdrive_source:
rclone lsf gdrive_source2:

Check size:

rclone size gdrive_source:
rclone size gdrive_source2:

Tree view:

rclone tree gdrive_source:

🧪 Dry Run (Validation)
rclone copy gdrive_source: dropbox_dest:Migration_Demo --dry-run --progress
rclone copy gdrive_source2: dropbox_dest:Migration_Demo --dry-run --progress

🚀 Migration Execution
Source 1 → Dropbox
rclone copy gdrive_source: dropbox_dest:Migration_Demo --progress --transfers 4 --checkers 8
Source 2 → Dropbox
rclone copy gdrive_source2: dropbox_dest:Migration_Demo --progress --transfers 4 --checkers 8
🔍 Post-Migration Verification
Check files:
rclone lsf dropbox_dest:Migration_Demo
Check size:
rclone size dropbox_dest:Migration_Demo
Validate integrity:
rclone check gdrive_source: dropbox_dest:Migration_Demo --one-way
rclone check gdrive_source2: dropbox_dest:Migration_Demo --one-way


📊 Features
Multi-source cloud migration
Automated transfer using rclone
Data integrity verification
Dry-run validation before execution
Scalable architecture (supports multiple cloud providers)
📦 Project Output

All migrated data is stored in:

Dropbox:/Migration_Demo

👨‍💻 Author
DevOps Engineer Abdellatif Mohamed Abdeldaim
Cloud Migration Project
