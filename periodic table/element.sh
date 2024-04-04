#!/bin/bash

PSQL="psql --username=freecodecamp --dbname=periodic_table -t -c"

if [[ $1 ]]
then
  # check if the argument is number
  if [[ $1 =~ ^[0-9]+$ ]]
  then
    ATOMIC_NUMBER=$1
    ELEMENT_INFO=$($PSQL "SELECT * FROM elements INNER JOIN  properties USING(atomic_number) INNER JOIN types USING(type_id) WHERE atomic_number=$ATOMIC_NUMBER")
    # if not present
    if [[ -z $ELEMENT_INFO ]]
    then
      # output not found.
      echo I could not find that element in the database.
    else
      # if found atomic number.
      echo "$ELEMENT_INFO" | while IFS=" | " read TYPE_ID ATOMIC_NUMBER SYMBOL NAME ATOMIC_MASS MELTING BOILING TYPE
      do
        # output the required output
        echo -e "The element with atomic number $ATOMIC_NUMBER is $NAME ($SYMBOL). It's a $TYPE, with a mass of $ATOMIC_MASS amu. $NAME has a melting point of $MELTING celsius and a boiling point of $BOILING celsius."
      done
    fi
  else
    # check if the argument is symbol
    SYMBOL=$1
    ELEMENT_INFO=$($PSQL "SELECT * FROM elements INNER JOIN  properties USING(atomic_number) INNER JOIN types USING(type_id) where symbol='$SYMBOL';")
    # if symbol not present
    if [[ -z $ELEMENT_INFO ]]
    then
      # check if the argument is element name
      ELEMENT=$1
      ELEMENT_INFO=$($PSQL "SELECT * FROM elements INNER JOIN  properties USING(atomic_number) INNER JOIN types USING(type_id) WHERE name='$ELEMENT'")
      # if element not present
      if [[ -z $ELEMENT_INFO ]]
      then
        # output not found.
        echo I could not find that element in the database.
      else
        # element if found.
        echo "$ELEMENT_INFO" | while IFS=" | " read TYPE_ID ATOMIC_NUMBER SYMBOL NAME ATOMIC_MASS MELTING BOILING TYPE
        do
          # output the required output
          echo -e "The element with atomic number $ATOMIC_NUMBER is $NAME ($SYMBOL). It's a $TYPE, with a mass of $ATOMIC_MASS amu. $NAME has a melting point of $MELTING celsius and a boiling point of $BOILING celsius."
        done
      fi
    else
      # symbol if found.
      echo "$ELEMENT_INFO" | while IFS=" | " read TYPE_ID ATOMIC_NUMBER SYMBOL NAME ATOMIC_MASS MELTING BOILING TYPE
      do
        # output the required output
        echo -e "The element with atomic number $ATOMIC_NUMBER is $NAME ($SYMBOL). It's a $TYPE, with a mass of $ATOMIC_MASS amu. $NAME has a melting point of $MELTING celsius and a boiling point of $BOILING celsius."
      done
    fi
  fi
else
  echo 'Please provide an element as an argument.'
fi
