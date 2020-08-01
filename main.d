import std.stdio;
import utility;

/*******************************************************************************
 ***                           T I C | T A C | T O E                           *
 *******************************************************************************
 *                                                                             *
 *                           Project Name : Tic Tac Toe                        *
 *                                                                             *
 *                           File Name : main.d                                *
 *                                                                             *
 *                           Programmer : Calin Clement Dermott                *
 *                                                                             *
 *                           Start Date : 20th July 2020                       *
 *                                                                             *
 *                           Last Update : 20th July 2020                      *
 *                                                                             *
 *-----------------------------------------------------------------------------*
 * Description: Small terminal based game created to help gain familiarity in  *
 * Dlang in preperation for larger projects.                                   *
 *                                                                             *
 *----------------------------------------------------------------------------*/

int main()
{

    // variables to store states of elements within the game
    int playerMove;
    int goDecider = 0; // keeps track of whose go it is.
    // create the board, and intialise all values to ' '
    char[3][3] board = ' ';

    writeln("TIC TAC TOE by Calin Clement Dermott, 2020");

    // Instructions
    writeln("The grid goes left to right, 1-3, 3 times. So choosing the number");
    writeln("four would put an 'X' in the left most column on the second row.");

    while (true)
    {
        // Get player input
        writeln("enter a number from 1-9");
        readf(" %d", playerMove);

        // Put player input into the board
        updateBoard(board, playerMove, goDecider);
        // Draw the board
        drawBoard(board);
        goDecider++;
    }
    return 0;
}
