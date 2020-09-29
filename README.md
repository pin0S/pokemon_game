# Software Development Plan

## Statement of Purpose and Scope

#### What will this application do? 
This application will allow users to play a Pokemon themed rock-paper-scissors game against a computer. The game will print the results of each round to the screen and the print the winner in best of 1, 3 and 5 games.

#### What Problem is this application solving
This application aims to solve the problem of boring rock-paper-scissors games by Pokemon-izing it. I wanted to develop this application to allow users to enjoy rock-paper-scissors in the nostalgic Pokemon universe.

#### Who is the target audience
The target audience for this application is developers looking to have a little fun and compete to be the very best trainer in the pokemon universe rock-paper-scissors universe.

#### How will the target audience use this application
Developers will use this application anytime they are looking for a quick break. Once they download the application they will be able to access it from X(probably the cmdline update once complete). 

## Features

Water, Grass, Fire will have three key features. 

1. **Menu Screen**: The application features a menu screen which is shown when the user enters the game. The menu will give users several input options; press **'1'** to play best of 1, press **'3'** to play best of 3, press **'5'** to play best of 5, press **'b'** to see the all time leaderboard, press **'s'** to see the users personal stats and records and finally press **'q'** to quit.
The menu will be called within the game loop to print all options to the screen whenever the user is required to make a selection. Errors like invalid inputs are handled by conditional logic.

2. **Leader board**: The user can select the option to see the all time leader board for most wins in the game. The leaderboard is displayed in a nicely formatted table ranking the top 3. The stats are stored in a file ***database.csv*** and it is updated during the game loop. 

3. **The user can input their username and pin as a command line argument**: Each time the user loads the program they can enter their username and pin as a command line argument. This prevents other users for effecting that players record. If the username and pin are not entered as arguments (checked through length method) the user will be asked if this is their first time playing and to select their username and 4 digit pin. Otherwise they can still enter their existing username and pin once the program has loaded.  

## User Experience and Interaction

#### How the user will find out how to intereact with each feature

Once the user has entered their username and pin, they will be welcomed with a welcome screen, like a start screen in video games. Once they press any key or after time 10 seconds has elapsed they will be shown a menu of options to pick from. Each menu option is linked to a specific feature. 

#### How the user will interact with and use each feature

To get to each feature the user will need to interact with the menu by inputing a command into the terminal. 

#### How errors will be handled and displayed to the user

The application will utilise conditional loops along with rescues to hanfle errors. If the user is to enter an invalid username, pin or menu option they will be presented with an error message. The application will loop back to the option prior to the error to again ask for the user input. 

The app has also been developed through Test Driven Development(TDD) to ensure errors are accounted for before run time.

## Flow Chart of application 

Will add image of flow chart once finished formatting

## Instructions

### Installation Instructions

- Follow these instructions to [download and install](https://www.ruby-lang.org/en/documentation/installation/) Ruby on your local machine.
- Clone or download the project files onto your local machine. 
- Open your computers terminal and run the following command:

`$ install bundler`

- Once bundler has finished installing, enter the following code to install the Gems required to run the application. 

`$ bundle install`

- For the fisrt time use run the application using the following command to launch it(ensure volume is on).

`$ run_game.sh`

- In the future you can bypass the login screen by passing your user name and pin as arguments e.g.

`$ run_game.sh username pin`

### Dependencies require for the application to run and how to install them

The following Ruby Gems are require to run the application, however all are included in the Gemfile which will install them if you followed the above instructions. 

* gem "rspec", "~> 3.9"
* gem "json", "~> 2.3"
* gem "text-table", "~> 1.2"
* gem "colorize", "~> 0.8.1"
* gem "ruby2d", "~> 0.9.4"
* gem "pastel", "~> 0.8.0"

### System/Hardware requirements

Pokemon Royal Rumble has been tested on MAC OS Catalina Version: 10.15.6.

### How to use the application

* Once you have logged in and have read the welcome screen `PRESS ANY KEY` to enter the main menu.

* In the main menu you are presented with several options to access the option enter the value in `()` e.g. `(1)` will allow you to play a best of one game.
* All available option: 
    * `r` - will show game rules.
    * `1` - will begin a best of one game.
    * `3` - will begin a best of three game.
    * `5` - will begin a best of five game.
    * `b` - will show the user the all time leaderboard of games won.
    * `s` - will show the user their individual round wins/losses and game wins/losses.
    * `q` - will exit the application. 
* In the games users will be asked to choose their starting Pokemon `fire`, `water` or `grass` players must type the starter they wish to use and hit enter. 
* The computer will select their starter at the same time. 
* The round is then played, if their is a winner results will be displayed otherwise if it is a draw the game will be replayed. 
* At the end of the game, the users all time record will be updated. Users then can `PRESS ANY KEY` to return to the main menu. 
