#!/bin/bash

SOURCE1="gdrive_source:"
SOURCE2="gdrive_source2:"
DEST="dropbox_dest:Migration_Demo"

LOG="verification_report.log"

echo "=====================================" | tee $LOG
echo "     CLOUD MIGRATION VERIFICATION    " | tee -a $LOG
echo "=====================================" | tee -a $LOG
echo "" | tee -a $LOG

# 1. SIZE CHECK
echo "📦 Checking sizes..." | tee -a $LOG
echo "Source 1 size:" | tee -a $LOG
rclone size $SOURCE1 | tee -a $LOG

echo "Source 2 size:" | tee -a $LOG
rclone size $SOURCE2 | tee -a $LOG

echo "Destination size:" | tee -a $LOG
rclone size $DEST | tee -a $LOG

echo "" | tee -a $LOG

# 2. FILE COUNT CHECK
echo "📁 Checking file counts..." | tee -a $LOG

echo "Source 1 files:" $(rclone ls $SOURCE1 | wc -l) | tee -a $LOG
echo "Source 2 files:" $(rclone ls $SOURCE2 | wc -l) | tee -a $LOG
echo "Destination files:" $(rclone ls $DEST | wc -l) | tee -a $LOG

echo "" | tee -a $LOG

# 3. CHECKSUM VALIDATION
echo "🔍 Running checksum verification..." | tee -a $LOG

echo "Checking Source 1..." | tee -a $LOG
rclone check $SOURCE1 $DEST --one-way | tee -a $LOG

echo "Checking Source 2..." | tee -a $LOG
rclone check $SOURCE2 $DEST --one-way | tee -a $LOG

echo "" | tee -a $LOG

# 4. FINAL RESULT
echo "=====================================" | tee -a $LOG
echo "       VERIFICATION COMPLETE        " | tee -a $LOG
echo "Check log file: $LOG" | tee -a $LOG
echo "=====================================" | tee -a $LOG
