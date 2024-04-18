#!/bin/bash

get_hostname(){
    echo "El nombre del host es: $(hostname)"
}

get_date(){
    echo "La fecha y hora actual es: $(date '+%d/%m/%Y %H:%M:%S')"
}

get_root_disk_usage(){
    echo "El uso del disco raiz es: $(df -h | grep ' /$')"
}

get_users(){
    echo "Los usuarios activos son: $(who)"
}

get_memory_usage(){
    free -m | awk 'NR==2{printf "Total: %sMB - Disponible: %sMB\n", $2, $7}'
}

get_processes(){
    local process_name=$1
    echo "Procesos encontrados para '$process_name': $(ps aux | grep "$process_name")"
}

main(){
    local process_name=$1
    get_hostname
    get_date
    get_root_disk_usage
    get_memory_usage
    get_processes "$process_name"
}

# Llamada a la función principal con el nombre del proceso proporcionado como argumento
main "$@"