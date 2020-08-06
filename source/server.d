module server;

import std.stdio, std.socket, std.parallelism;
import core.thread, core.stdc.errno;

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
 *                           Last Update : 6th August 2020                     *
 *                                                                             *
 *-----------------------------------------------------------------------------*
 * Description: Small terminal based game created to help gain familiarity in  *
 * Dlang in preperation for larger projects.                                   *
 *                                                                             *
 * Server functionality added mainly to help gain experience with socket       *
 * programming in general.                                                     *
 *                                                                             *
 *----------------------------------------------------------------------------*/

int main() {

    // setup variables the server requires to function
    bool listening = false;
    const ushort port = 9000;
    Address address = new InternetAddress("localhost", port);

    // creates a socket using INET addresses and UDP protocol.
    auto udpSocket = new Socket(AddressFamily.INET, SocketType.DGRAM);
    assert(udpSocket.isAlive); // verifies successful socket creation.
    udpSocket.bind(address); // Associate a local address with this socket.
    
    start(udpSocket, listening);
    udpSocket.close();

    return 0;
}

void start(ref Socket udpSocket, ref bool listening) {
    // We might need to be listening, receiving and sending data simultaneously,
    // therefore concurrency is required.
    while(true) {
        if(!listening) {
            auto listenTask = task!listen(udpSocket, listening);
            listenTask.executeInNewThread();
            // waits for the task to complete its operations,
            // this line stops multiple threads been spun up to listen on the
            // same socket.
            immutable taskResult = listenTask.yieldForce();
        }
        writeln(listening);
        listening = false;
    }
}

int listen(ref Socket udpSocket, ref bool listening) {
    
    // populated by recieveFrom function.
    Address from;

    // all std.socket buffers must have a size bigger than zero to work.
    char[1024] buffer;

    TRY_AGAIN:
    auto value = udpSocket.receiveFrom(buffer[], from);

    // Important to check for EINTR on POSIX systems.
    if(value == Socket.ERROR) {
        version(Posix) {
            if(errno == EINTR) goto TRY_AGAIN;
        }
        writeln(lastSocketError);
        throw new Exception(lastSocketError());    
    }
    // this line is never reached, if 66-71 is commented, program exits on line
    // 74. No error given, need to test why.
    auto data = buffer[0 .. value];
    writeln("Received: ", data);

    auto reply = "Received packet";
    value = udpSocket.sendTo(reply[], from);
    if(value == Socket.ERROR) { throw new Exception(lastSocketError()); }
    assert(value == reply.length);

    listening = true;
    return 0;
}

void process() { // should call send to send UDP datagram packet

    // if we receive data that isn't empty, do something with it and send it
    // on to the next player.

}

void send(char[] data, ref Socket udpSocket) {
    // do nothing.
}