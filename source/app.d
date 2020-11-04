import std.stdio, std.socket, std.conv;
import utility;

/*******************************************************************************
 ***                           T I C | T A C | T O E                           *
 *******************************************************************************
 *                                                                             *
 *                           Project Name : Tic Tac Toe                        *
 *                                                                             *
 *                           File Name : app.d                                 *
 *                                                                             *
 *                           Programmer : Calin Clement Dermott                *
 *                                                                             *
 *                           Start Date : 31st July 2020                       *
 *                                                                             *
 *                           Last Update : 16th August 2020                    *
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

    // networking setup
    auto socket = new Socket(AddressFamily.INET, SocketType.DGRAM);
    socket.bind(new InternetAddress(InternetAddress.ADDR_ANY,
                    InternetAddress.PORT_ANY));

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
        //updateServer(board, socket);

        // Receive updated board from server.

        // Draw the board
        drawBoard(board);
        goDecider++;
    
        if(checkForWinner(board)) {
            break;
        }
    }

    return 0;
}

bool checkForWinner(char[3][3]board) {
    bool returnValue = false;

    for(int i = 0; i < board.length; i++) {
        returnValue = checkRow(board, i); // always returning true.
        writeln("bla");
        if (returnValue == true) {
            return returnValue;
        }
    }

    /* for(int i = 0; i < board.length; i++) {
        returnValue = checkCol(board, i);
        if (returnValue == true) {
            return returnValue;
        }
    }

    returnValue = checkTopLeftDiagonal(board);
    if (returnValue) { return true; }

    returnValue = checkTopRightDiagonal(board); */
    return returnValue;
}

bool checkRow(char[3][3]board, int rowNum) {
    for(int i = 1; i < board.length; i++) {
        if (board[rowNum][i] != board[rowNum][0]) {
            // will break on second run as not taking into account charcter.
            return false;
        }
    }
    writeln("Am I being hit?");
    return true;
}

bool checkCol(char[3][3]board, int colNum) {
    
    for(int i = 1; i < board.length; i++) {
        if (board[i][colNum] != board[0][colNum]) {
            return false;
        }
    }
    return true;
}

bool checkTopLeftDiagonal(char[3][3]board) {

    for(int i = 1; i < board.length; i++) {
        if (board[i][i] != board[0][0]) {
            return false;
        }
    }
    return true;
}

bool checkTopRightDiagonal(char[3][3]board) {
    for(int i = 1; i < board.length; i--) {
        if (board[i][i] != board[2][2]) {
            return false;
        }
    }
    return true;
}

// I will need to split this out into a seperate file
void updateServer(char[3][3]board, ref Socket socket) {
    // sends the current layout of the board to the server.

    // converts two dimensional array into string to be sent.
    auto dataPacket = to!string(board);

    writeln("Sending Data...");
    auto err = socket.sendTo(dataPacket, new InternetAddress("localhost", 9000));
    if (err == Socket.ERROR) { throw new Exception(lastSocketError()); }
    assert(err == dataPacket.length);

    // wait for a reply
    char[1024] buffer;
	Address from;
	err = socket.receiveFrom(buffer[], from);
	if(err == Socket.ERROR)
		throw new Exception(lastSocketError());
	auto data = buffer[0 .. err];
	writeln("Got response: ", data);

}


