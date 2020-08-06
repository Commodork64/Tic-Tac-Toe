import std.stdio, std.socket;
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
 *                           Last Update : 6th August 2020                     *
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
    
    // This chunk of code will need to be altered later, only using for testing.
    string dataPacket = "hello";
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

    return 0;

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
    // Will this be reachable or will the game loop back to waiting to connect
	// to the server?
	return 0;
}
