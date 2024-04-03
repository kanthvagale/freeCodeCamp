#!/bin/bash

PSQL="psql --username=freecodecamp --dbname=salon --tuples-only -c"

echo -e '\n~~~~~ MY SALON ~~~~~\n'

MAIN_MENU() {
  if [[ $1 ]]
  then
    echo -e $1
  fi
  SERVICES_RESULT=$($PSQL "SELECT * FROM services")
  echo "$SERVICES_RESULT" | while read SERVICE_ID BAR SERVICE_NAME
  do
    echo "$SERVICE_ID) $SERVICE_NAME"
  done
  # read service id
  read SERVICE_ID_SELECTED
  if [[ ! $SERVICE_ID_SELECTED =~ ^[0-9]+$ ]]
  then
    MAIN_MENU "\nI could not find that service. What would you like today?"
  fi
  SERVICE_ID_RESULT=$($PSQL "SELECT * FROM services where service_id=$SERVICE_ID_SELECTED")
  # echo $SERVICE_ID_RESULT
  if [[ -z $SERVICE_ID_RESULT ]]
  then
    # return to main menu
    MAIN_MENU "\nI could not find that service. What would you like today?"
  fi
  
  echo -e "\nWhat's your phone number?"
  read CUSTOMER_PHONE
  # check if phone number exists
  CUSTOMER_PHONE_RESULT=$($PSQL "select * from customers where phone='$CUSTOMER_PHONE'")
  if [[ -z $CUSTOMER_PHONE_RESULT ]]
  then
    # create customer 
    echo -e '\nI don't have a record for that phone number, what's your name?'
    read CUSTOMER_NAME
    CUSTOMER_ADD_RESULT=$($PSQL "INSERT INTO customers(phone, name) values ('$CUSTOMER_PHONE', '$CUSTOMER_NAME')")
  fi
  # time selection
  SERVICE_CHOOSEN=$($PSQL "SELECT name from services where service_id=$SERVICE_ID_SELECTED")
  CUSTOMER_NAME=$($PSQL "SELECT name from customers where phone='$CUSTOMER_PHONE'")
  CUSTOMER_ID=$($PSQL "SELECT customer_id from customers where phone='$CUSTOMER_PHONE'")
  echo -e "\nWhat time would you like your$SERVICE_CHOOSEN,$CUSTOMER_NAME?"
  read SERVICE_TIME
  
  # add into appointment
  ADD_APPOINTMENT_RESULT=$($PSQL "INSERT INTO appointments(customer_id, service_id, time) values ($CUSTOMER_ID, $SERVICE_ID_SELECTED, '$SERVICE_TIME')")
  echo -e "\nI have put you down for a$SERVICE_CHOOSEN at $SERVICE_TIME,$CUSTOMER_NAME."
}

MAIN_MENU "Welcome to My Salon, how can I help you?\n"