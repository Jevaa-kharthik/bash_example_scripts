#! /bin/bash

source_dic=("~/Documents/GitHub/Malware-C"
            "~/Documents/GitHub/cinfo_jk"
)

backup_dic="~/backup"
max_backups=7

#configure

function perform_backup {
    timestamp=$(date %Y%m%d_%H%M%S)
    backup_file="backup_$timestamp.tar.gz"

    mkdir -p "$backup_dic"

    tar -czf "$backup_dic/$backup_file" "${source_dic[@]}"

    rotate_backup
}

function rotate_backup {
    backup_file=($( ls -t "$backup_dic" | grep "^backup_" | grep ".tar.gz" ))

    num_backups=$((${#backup_file[@]} - $max_backups ))

    if [ $num_backups -gt 0]; then
        for (( i=0; i<num_backups; i++ )); do
            rm -rf "$backup_dic/${backup_file[$i]}"

            echo "Deleted the Backup file : $backup_dic/${backup_file[$i]}"
        done
    fi
}

echo "Starting the Backup Process"

perform_backup

echo "The Backup Process is Complete"

