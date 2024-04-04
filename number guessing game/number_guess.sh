#!/bin/bash
# number guessing game

PSQL="psql --username=freecodecamp --dbname=number_guessing_game -t -c"

RANDOM_GUESS_VALUE=$(( $RANDOM%1000+1 ))

echo -e "\nEnter your username:"
read USERNAME

# check if the username is present in database
USER_INFO=$($PSQL "SELECT * FROM userinfo WHERE username='$USERNAME'")
# if not present
if [[ -z $USER_INFO ]]
then
  # create the user with username
  USER_INFO_INSERT=$($PSQL "INSERT INTO userinfo (username, games_played, best_game) values ('$USERNAME', 0, null)")
  # Welcome, <username>! It looks like this is your first time here.
  echo -e "\nWelcome, $USERNAME! It looks like this is your first time here."
else
  echo "$USER_INFO" | while IFS=" | " read USERNAME GAMES_PLAYED BEST_GAME
  do
    echo Welcome back, $USERNAME! You have played $GAMES_PLAYED games, and your best game took $BEST_GAME guesses.
  done
fi

echo -e "\nGuess the secret number between 1 and 1000:"

read INPUT

while [[ ! $INPUT =~ ^[0-9]+$ ]]
do
  echo -e "\nThat is not an integer, guess again:"
  read INPUT
done

TOTAL_TRIES=0

# echo random is $RANDOM_GUESS_VALUE

while [[ $INPUT != $RANDOM_GUESS_VALUE ]] 
do
  TOTAL_TRIES=$(( $TOTAL_TRIES+1 ))
  if [[ $INPUT > $RANDOM_GUESS_VALUE ]]
  then
    echo -e "\nIt's lower than that, guess again:"
  else
    echo -e "\nIt's higher than that, guess again:"
  fi
  read INPUT
  while [[ ! $INPUT =~ ^[0-9]+$ ]]
  do
    echo -e "\nThat is not an integer, guess again:"
    read INPUT
  done
done

# update user info 
# update games played
UPDATE_GAMES_PLAYED_RESULT=$($PSQL "UPDATE userinfo SET games_played=games_played+1 WHERE username='$USERNAME'")
# update best game
BEST_GAME=$($PSQL "SELECT best_game FROM userinfo WHERE username='$USERNAME'")
# lowest value updated to best_game
if [[ $BEST_GAME -eq null || $TOTAL_TRIES -lt $BEST_GAME ]]
then
  BEST_GAME=$TOTAL_TRIES+1
fi

# if [[ $TOTAL_TRIES -lt $BEST_GAME ]]
# then
#   BEST_GAME=$TOTAL_TRIES+1
# fi

UPDATE_BEST_GAME_RESULT=$($PSQL "UPDATE userinfo SET best_game=$BEST_GAME where username='$USERNAME'")

echo -e "You guessed it in $(( $TOTAL_TRIES+1 )) tries. The secret number was $RANDOM_GUESS_VALUE. Nice job!"