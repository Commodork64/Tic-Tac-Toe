module server;

import std.stdio, std.socket, std.parallelism;
import core.thread;

/*******************************************************************************
 ***                           T I C | T A C | T O E                           *
 *******************************************************************************
 *                                                                             *
 *                           Project Name : Tic Tac Toe                        *
 *                                                                             *
 *                           File Name : server.d                              *
 *                                                                             *
 *                           Programmer : Calin Clement Dermott                *
 *                                                                             *
 *                           Start Date : 2nd August 2020                      *
 *                                                                             *
 *                           Last Update : 2nd August 2020                     *
 *                                                                             *
 *-----------------------------------------------------------------------------*
 * Description: Small terminal based game created to help gain familiarity in  *
 * Dlang in preperation for larger projects.                                   *
 *                                                                             *
 *----------------------------------------------------------------------------*/

int main() {

    // goal one: transmission of data between client and server.

    // setup variables the server requires to function
    const int port;
    bool listening = false; // keeps track if listening for traffic or not.
    int address;
    auto socket = new Socket();

    start(listening, port);

    return 0;
}

void start(ref bool listening, ref const int port) {
    listening = true;
    auto listenTask = task!listen(listening, port);
    listenTask.executeInNewThread();
}

void listen(bool listening, int port) {
    while(listening) {
        writeln("Hey baby");
        break;
    }
}

void process() { //should send UDP packet

}

void send(byte[] data) {

}