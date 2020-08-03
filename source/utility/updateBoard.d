module utility.updateBoard;
import utility.characterDecider;

void updateBoard(ref char[3][3] board, int coordinate, int goDecider)
{

    switch (coordinate)
    {
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