🚀 Multi-Cloud Data Migration Project

A real-world cloud-to-cloud data migration project using AWS EC2, rclone, Google Drive, and Dropbox.

📌 Project Overview

This project demonstrates how to securely migrate data between multiple cloud storage providers using an automated and scalable approach.

It includes:

Multi-source ingestion
Cloud-to-cloud transfer
Data validation & verification
AWS EC2 execution environment
🏗️ Architecture
Google Drive (Source 1) ┐
                        ├──→ Dropbox (Destination)
Google Drive (Source 2) ┘
☁️ Technologies Used
AWS EC2 (Free Tier)
Ubuntu Linux
rclone (Cloud sync tool)
Google Drive API
Dropbox API
Bash scripting
🚀 EC2 Setup (Important Step)
1. Launch EC2 Instance

Go to AWS Console → EC2 → Launch Instance

Configuration:
Name: rclone-migration-demo
OS: Ubuntu Server 22.04 LTS (Free Tier Eligible)
Instance Type: t2.micro
Key Pair: Create new key pair (.pem)
Storage: 8GB (Free Tier)
Security Group:
SSH (Port 22) → Your IP
2. Connect to EC2
ssh -i ~/.ssh/MyKeyPair.pem ubuntu@<EC2_PUBLIC_IP>

Example:

ssh -i ~/.ssh/MyKeyPair.pem ubuntu@54.224.70.220
3. Update System
sudo apt update && sudo apt upgrade -y
4. Install rclone
curl https://rclone.org/install.sh | sudo bash

Verify:

rclone version
5. Install Utilities
sudo apt install -y screen tmux htop
📂 Sources & Destination
Sources:
Google Drive Account 1 → gdrive_source
Google Drive Account 2 → gdrive_source2
Destination:
Dropbox → dropbox_dest
⚙️ Configure rclone Remotes
rclone config

Create:

gdrive_source → Google Drive
gdrive_source2 → Google Drive
dropbox_dest → Dropbox
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
rclone copy gdrive_source: dropbox_dest:Migration_Demo \
--progress --transfers 4 --checkers 8
Source 2 → Dropbox
rclone copy gdrive_source2: dropbox_dest:Migration_Demo \
--progress --transfers 4 --checkers 8
🔍 Post-Migration Verification
List files:
rclone lsf dropbox_dest:Migration_Demo
Check size:
rclone size dropbox_dest:Migration_Demo
Validate integrity:
rclone check gdrive_source: dropbox_dest:Migration_Demo --one-way
rclone check gdrive_source2: dropbox_dest:Migration_Demo --one-way
📊 Features
Multi-source cloud migration
Secure EC2 execution
Automated transfer using rclone
Data integrity verification
Dry-run safety validation
Scalable multi-cloud architecture
📦 Project Output

All migrated data is stored in:

Dropbox:/Migration_Demo
📸 Suggested Screenshots (for GitHub)
