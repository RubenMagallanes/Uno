/**      UNO SERVER      **/
/*       listen for connections, 
      create thread to deal with client, connecting to appropriate game */

/*
      todo: running this just listens for a connection, 
      has an UnoGame waiting for players.
      create new thread to deal with client & pass reference to UnoGame,
      thread listen to commands from clients and calls synchronised methods on unoGame.
      

*/
UnoGame gameModel;

void setup() 
{
      size (700, 290);
      frameRate(30);
      //noStroke();
      strokeWeight(3);

      gameModel = new UnoGame(2);
}
void draw() 
{
     renderGameBoard();
}
void keyPressed() 
{
      if (key == 'q') 
      {
            print(gameModel.queryGameState());
      } else if (key == 'e')
      {
            print(gameModel.queryPlayerHand(gameModel.currentPlayer()));
            print("can play "+ gameModel.queryPlayableCards());
      }
      
}
void mousePressed(){
      
      
}


/*
TODO
clean up code style fam
      monor ui elements: do as text based from UnoGame
      UI element- view play order
      UI for players selecting a card to play
      then extend so can select multiple
      
      massive UI overhaul lul
*/