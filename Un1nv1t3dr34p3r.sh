#!/bin/bash

# ANSI color codes
RED="\033[1;31m"
GREEN="\033[1;32m"
YELLOW="\033[1;33m"
BLUE="\033[1;34m"
CYAN="\033[1;36m"
NC="\033[0m" # No Color

while true; do
    clear
    echo -e "${CYAN}"
    echo "============================================"
    echo "         Un1nv1t3dr34p3r Recon Toolkit       "
    echo "============================================"
    echo -e "${NC}"

    echo -e "${YELLOW}Recon Modules${NC}"
    echo -e "  [${GREEN}50${NC}] Run PoC Generator"
    echo -e "  [${GREEN}52${NC}] GPT Recon Chat"

    echo -e "${YELLOW}Exploits${NC}"
    echo -e "  [${GREEN}56${NC}] Exploit Mapper & Suggestions"
    echo -e "  [${GREEN}58${NC}] Auto PoC Generator"

    echo -e "${YELLOW}Web App Testing${NC}"
    echo -e "  [${GREEN}53${NC}] DOM-Based XSS Detector"
    echo -e "  [${GREEN}54${NC}] Telemetry Leak Detector"

    echo -e "${YELLOW}Cloud Risk${NC}"
    echo -e "  [${GREEN}55${NC}] CSPM Risk Dashboard"

    echo -e "  [${RED}99${NC}] Exit"
    echo ""

    read -p "Select a module by number: " option

    case $option in
        50)
            read -p "Enter target (URL/IP): " target
            bash modules_poc_generator/poc_generator.sh "$target"
            ;;
        52)
            bash modules_recon_chat/gpt_recon_chat.sh
            ;;
        53)
            read -p "Enter JS/URL to analyze: " target
            bash modules_domxss_detector/dom_xss_detector.sh "$target"
            ;;
        54)
            read -p "Enter target (URL/IP): " target
            bash modules_telemetry_leak_detector/telemetry_leak_detector.sh "$target"
            ;;
        55)
            bash modules_cspm_dashboard/cspm_dashboard.sh
            ;;
        56)
            read -p "Enter CVE ID or service name: " target
            bash modules_exploit_mapper/exploit_mapper.sh "$target"
            ;;
        58)
            read -p "Enter target (URL/IP): " target
            bash modules_auto_poc_generator/auto_poc_generator.sh "$target"
            ;;
        99)
            echo -e "${RED}Exiting.${NC}"
            exit 0
            ;;
        *)
            echo -e "${RED}Invalid option. Try again.${NC}"
            sleep 1
            ;;
    esac

    echo ""
    read -p "Press Enter to return to the main menu..." dummy
done
