# Tic-Tac-Toe
A basic Tic-Tac-Toe terminal based game in D.

## How to run
[NOTE] 
Coming back to code and having no idea how to run it sucks! Remember to add run instructions
on projects!

To run the code, you will need to run app.d and server.d seperately.

You can use use rdmd as follows:
rdmd app.d utility/characterDecider.d utility/drawBoard.d utility/updateBoard.d utility/package.d -de -w
and in a seperate window:
rdmd server.d

Otherwise you choose to build the executables them like so:
dmd utility/characterDecider.d utility/drawBoard.d utility/updateBoard.d utility/package.d -lib -ofutility -de -w
dmd app.d utility.a -de -w
dmd server.d

## Resources

I made heavy use of the dlang.org documentation but below are some of the additional resources
I found, which made creating this application possible.

Adam D. Ruppe: Socket Tutorial - 11/11/2019
	http://dpldocs.info/this-week-in-d/Blog.Posted_2019_11_11.html#communication-by-datagram

Çehreli, A. 2019. _Programming in D - Tutorial and Reference_. California: Ali Çehreli
	http://ddili.org/ders/d.en/parallelism.html
