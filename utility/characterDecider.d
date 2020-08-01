module utility.characterDecider;

char characterDecider(int goDecider)
{
    if (goDecider % 2 == 0)
    {
        return 'X';
    }
    else
    {
        return 'O';
    }
}