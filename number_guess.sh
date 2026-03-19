#!/bin/bash

PSQL="psql --username=freecodecamp --dbname=number_guess -t --no-align -c"

createdb --username=postgres number_guess 2>/dev/null

$PSQL "CREATE TABLE IF NOT EXISTS users (user_id SERIAL PRIMARY KEY, username VARCHAR(22) NOT NULL);"
$PSQL "CREATE TABLE IF NOT EXISTS game_stats (game_id SERIAL PRIMARY KEY, user_id INT REFERENCES users(user_id), guesses INT NOT NULL);"

SECRET_NUMBER=$((RANDOM % 1000 + 1))

echo -n "Enter your username: "
read USERNAME

USER_ID=$($PSQL "SELECT user_id FROM users WHERE username='$USERNAME'")

if [[ -z "$USER_ID" ]]; then
  $PSQL "INSERT INTO users (username) VALUES ('$USERNAME')"
  USER_ID=$($PSQL "SELECT user_id FROM users WHERE username='$USERNAME'")
  echo ""
  echo "Welcome, $USERNAME! It looks like this is your first time here."
else
  GAMES_PLAYED=$($PSQL "SELECT COUNT(*) FROM game_stats WHERE user_id=$USER_ID")
  BEST_GAME=$($PSQL "SELECT MIN(guesses) FROM game_stats WHERE user_id=$USER_ID")
  echo ""
  echo "Welcome back, $USERNAME! You have played $GAMES_PLAYED games, and your best game took $BEST_GAME guesses."
fi
echo ""
echo "Guess the secret number between 1 and 1000:"
GUESS_COUNT=0

while true; do
  read GUESS
  if ! [[ "$GUESS" =~ ^-?[0-9]+$ ]]; then
    echo "That is not an integer, guess again:"
    continue
  fi
  GUESS_COUNT=$((GUESS_COUNT + 1))
  if [[ $GUESS -lt $SECRET_NUMBER ]]; then
    echo "It's higher than that, guess again:"
  elif [[ $GUESS -gt $SECRET_NUMBER ]]; then
    echo "It's lower than that, guess again:"
  else
    echo "You guessed it in $GUESS_COUNT tries. The secret number was $SECRET_NUMBER. Nice job!"
    break
  fi
done

$PSQL "INSERT INTO game_stats (user_id, guesses) VALUES ($USER_ID, $GUESS_COUNT)"
