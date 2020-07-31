import std.stdio, std.conv;

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

int main() {

    //variables to store states of elements within the game
    int playerMove;
    int goDecider = 0; // whose go is it
    // represent the board and intialise all values to ' '
    char[3][3] board = ' ';

    writeln("TIC TAC TOE by Calin Clement Dermott, 2020");

    //instructions
    writeln("The grid goes left to right, 1-3, 3 times. So choosing the number");
    writeln("four would put an 'X' in the left most column on the second row.");
    
    while(true) {
        //Get player input
        writeln("enter a number from 1-9");
        readf(" %d", playerMove);
        
        
        // Put player input into the board
        updateBoard(board, playerMove, goDecider);
        // Draw the board (Need to refactor this)
        writeln();
        write(board[0][0]);
        write(" ");
        write(board[0][1]);
        write(" ");
        write(board[0][2]);
        writeln();
        write(board[1][0]);
        write(" ");
        write(board[1][1]);
        write(" ");
        write(board[1][2]);
        writeln();
        write(board[2][0]);
        write(" ");
        write(board[2][1]);
        write(" ");
        write(board[2][2]);
        writeln();
        goDecider++;
    }
    return 0;
}

void updateBoard(ref char[3][3] board, int coordinate, int goDecider) {

    switch( coordinate ) {
        case 1:
            board[0][0] = characterDecider(goDecider);
            break;
        case 2:
            board[0][1] = characterDecider(goDecider);
            break;
        case 3:
            board[0][2] = characterDecider(goDecider);
            break;
        case 4:
            board[1][0] = characterDecider(goDecider);
            break;
        case 5:
            board[1][1] = characterDecider(goDecider);
            break;
        case 6:
            board[1][2] = characterDecider(goDecider);
            break;
        case 7:
            board[2][0] = characterDecider(goDecider);
            break;
        case 8:
            board[2][1] = characterDecider(goDecider);
            break;
        case 9:
            board[2][2] = characterDecider(goDecider);
            break;
        default:
            break;
    }
}

char characterDecider(int goDecider) {
    if (goDecider % 2 == 0) {
        return 'X';
    }
    else {
        return 'O';
    }
}