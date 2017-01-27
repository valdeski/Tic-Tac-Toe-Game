----------------------------
Tic-Tac-Toe Game
----------------------------

------------------
How to Play
------------------

In the consloe the game starts with the call to startTicTacToe function 
followed up by a parameter - list of strings for representing the current
game situaton. For a new game, the list should consist only "-". When is
hs turn, the player must input the position he wants to play from 1-9.
The game has the standart rules for a Tic-Tac-Toe game. The game ends in
one of the following conditions:

*Player has won
*The game situation is draw

---------------
Functions
---------------

*startTicTacToe - the main function for start of the game. Takes a list of
strings. Gives two players the right to make a turn and calls itself 
recursively.

*winner - takes the current game state and returns if there is a winner.
Checks all possible positions for a winning state.

*makeTurn takes the current game state, position to make the turn and the
symbol to unput. Recursively finds the position and returns the new state.

*printTable - takes the current game state and returns an output in the
console for the game state. 

*draw - takes the current game state and returns if the state is in a draw.

-------------------
Known bugs
-------------------

* No implementation for a BOT turn yet.

*If the second player makes a invalid move (non-existing position or already
taken one), the game requires to be restarted.
 
