module utility.drawBoard;
import std.stdio;

void drawBoard(char[3][3] board)
{
    for(int i = 0; i < 3; i++) {
        for(int j = 0; j < 3; j++) {
            write(board[i][j]);
            write(" ");
        }
        writeln();
    }
}