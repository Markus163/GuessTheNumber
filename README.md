## GuessTheNumber

This is a mini-game where the user makes any integer number (from 1 to 100). 

The guesser (computer) must guess the number, focusing on the clues of the guessing player.
The guessing player can only answer "more", "less" or "equal". The round ends when the number has been guessed, and attempts are counted during the game.
After guessing, the players switch places, and the user must guess the number guessed by the computer. The winner is the player who guessed the opponent's number in less than the number of moves.

In this project I used the MVC architectural pattern for the following reasons:

The project is quite small in its scope. 
This architecture is understandable to most developers and easy to read.
The model encapsulates a specific set of data, and also contains logic for managing this data.
A view is an object that the user can see in the user interface (UI).
The controller controls all the logic between the view and the model. It transfers messages between the view, the model, and vice versa.

![Simulator Screen Shot - iPhone 11 - 2023-01-28 at 18 19 36](https://user-images.githubusercontent.com/106093762/215278433-ee39f890-311e-4147-b44c-f3b937cb30b6.png)
![Simulator Screen Shot - iPhone 11 - 2023-01-28 at 18 19 51](https://user-images.githubusercontent.com/106093762/215278435-f035ccc5-fe52-4e31-a5f9-1c2fd88befbf.png)
![Simulator Screen Shot - iPhone 11 - 2023-01-28 at 18 20 06](https://user-images.githubusercontent.com/106093762/215278436-c2440822-5adc-446a-8e69-15789231d4e2.png)
![Simulator Screen Shot - iPhone 11 - 2023-01-28 at 18 20 46](https://user-images.githubusercontent.com/106093762/215278437-19f23adb-d811-4bf2-b23b-5f837e2b3b97.png)
![Simulator Screen Shot - iPhone 11 - 2023-01-28 at 18 21 41](https://user-images.githubusercontent.com/106093762/215278439-e45c6e3c-1057-47ab-a4c8-8e4371d731c5.png)
