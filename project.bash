#!/bin/bash

# Welcome message in red color and different font
echo -e "\e[1;31m"
echo "___         ___      _                                "
echo "|  \       /   |    | |                       "
echo " \   \ /\ /   /  ___| | ___ ___  __   __ ___  "
echo "  \   /  \   /  / _ \ |/ __/   \|  \_|  | _ \ "
echo "   \   /\   /   | __/ | (__| |  |  \/   | __/  "
echo "    \_/  \_/    \___|_|\___\___/|_/  \__\___| "
echo "                                                                                "
echo "                                                                                "
echo -e "\e[0m"

# Display main menu
echo "Welcome to the Patient Management System of Hospital Sarwar."
echo "Please select an option:"
echo "1. Add new patient record"
echo "2. Search for a patient record"
echo "3. Edit a patient record"
echo "4. Delete a patient record"         
echo "5. Exit"
# Read user input
read -p "Option: " option

# Process user input
case $option in

      1)
        # Add new patient record    
        read -p "Enter first name: " firstName
        read -p "Enter last name: " lastName
        read -p "Enter phone number: " phoneNumber
        patientId=$(uuidgen) # Generate a unique ID for the patient
        echo "${patientId},${firstName},${lastName},${phoneNumber}" >> patients.csv
        echo "Patient record added successfully."
        ;;
      2)
        # Search for a patient record
        read -p "Enter patient ID: " patientId
        grep "^${patientId}," patients.csv
        ;;
      3)
              # Edit a patient record
        read -p "Enter patient ID: " patientId
       if grep -q "^${patientId}," patients.csv; then
            read -p "Enter new phone number: " newPhoneNumber
            sed -i "s/^${patientId},.*$/${patientId},\1,\2,${newPhoneNumber}/" patients.csv
            echo "Patient record updated successfully."
        else
            echo "Patient record not found."
        fi
        ;;
      4)
        # Delete a patient record
        read -p "Enter patient ID: " patientId
        if grep -q "^${patientId}," patients.csv; then
            sed -i "/^${patientId},/d" patients.csv
            echo "Patient record deleted successfully."
       fi
       ;;
      5)
      #Exit the program
      echo "Exiting Program..."
      exit 0
     ;;
      *)
#invalid option
echo "invalid option selected"
;;

esac
                                                              72,1          Bot


