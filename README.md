# 🚀 Multi-Cloud Data Migration Project

A real-world cloud-to-cloud data migration project using AWS EC2, rclone, Google Drive, and Dropbox.

---

# 📌 Project Overview

This project demonstrates how to securely migrate data between multiple cloud storage providers using an automated and scalable approach.

It includes:
- Multi-source data migration
- Cloud-to-cloud transfer using EC2
- Data validation and integrity checks
- Automated rclone workflows

---

# 🏗️ Architecture

Google Drive (Source 1) ┐
                        ├──→ Dropbox (Destination)
Google Drive (Source 2) ┘

---

# ☁️ Technologies Used

- AWS EC2 (Free Tier)
- Ubuntu Linux
- rclone
- Google Drive API
- Dropbox API
- Bash scripting

---

# 🚀 EC2 Setup Guide

## 1. Launch EC2 Instance
- Go to AWS Console → EC2 → Launch Instance
- Name: rclone-migration-demo
- OS: Ubuntu 22.04 LTS (Free Tier Eligible)
- Instance Type: t2.micro
- Key Pair: Create or use existing (.pem)
- Storage: 8GB
- Security Group: Allow SSH (Port 22) from your IP

---

## 2. Connect to EC2

```bash
ssh -i ~/.ssh/MyKeyPair.pem ubuntu@<EC2_PUBLIC_IP>

3. Update System
sudo apt update && sudo apt upgrade -y
4. Install rclone
curl https://rclone.org/install.sh | sudo bash
rclone version
5. Install utilities
sudo apt install -y screen tmux htop
📂 Cloud Sources & Destination
Sources:
Google Drive → gdrive_source
Google Drive → gdrive_source2
Destination:
Dropbox → dropbox_dest
⚙️ Configure rclone
rclone config

Create:

gdrive_source (Google Drive)
gdrive_source2 (Google Drive)
dropbox_dest (Dropbox)
🔍 Pre-Migration Checks
rclone lsf gdrive_source:
rclone lsf gdrive_source2:

rclone size gdrive_source:
rclone size gdrive_source2:

rclone tree gdrive_source:
🧪 Dry Run (Validation)
rclone copy gdrive_source: dropbox_dest:Migration_Demo --dry-run --progress
rclone copy gdrive_source2: dropbox_dest:Migration_Demo --dry-run --progress
🚀 Migration Execution
rclone copy gdrive_source: dropbox_dest:Migration_Demo --progress --transfers 4 --checkers 8
rclone copy gdrive_source2: dropbox_dest:Migration_Demo --progress --transfers 4 --checkers 8
🔍 Post-Migration Verification
rclone lsf dropbox_dest:Migration_Demo
rclone size dropbox_dest:Migration_Demo

rclone check gdrive_source: dropbox_dest:Migration_Demo --one-way
rclone check gdrive_source2: dropbox_dest:Migration_Demo --one-way
📊 Features
Multi-cloud migration (2 sources → 1 destination)
Secure EC2-based execution
Automated rclone transfers
Dry-run validation before execution
Data integrity verification
Scalable cloud architecture
📦 Output

All migrated data is stored in:

Dropbox:/Migration_Demo
