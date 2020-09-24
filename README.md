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

1. Install application steps

1. List dependencies require for the application to run and how to install them

1. System/Hardware requirements

1. How to use the application
