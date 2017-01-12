/*
most things in this tab are for testing purposes. eventually itll be player viewer
 and others will be moved out into a seperate unoServer
 
 TODO order: x = done - = partially
 make classes:  card [x] deck [-] hand [] player [] UnoGame [] playerviewer []
 M ->
 deck : produces cards when requsted 
 hand : holds cards. can query for cards in hand
 player : small wrapper for hand plus a few bits. 
 M + C -> 
 UnoGame : game manager. keeps track of : deck, players, whos turn it is etc.
 can query for game state info.
 V ->
 player viewer : displays info from unogame. 
 */


int cardWidth = 70;
int cardHeight = 100; 

int handY = 160;

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
      background(240, 240, 240);
      textAlign(LEFT);
      textSize(18);
      fill(10);
      text("Play Pile", 30, 20);
      renderCardAt(gameModel.lookPlayPile(), 30, 30, false);

      textAlign(LEFT);
      textSize(18);
      fill(10);      
      text("player "+ gameModel.currentPlayer()+"'s hand", 30, 150);
      renderHand();
      
      textAlign(LEFT);
      textSize(18);
      fill(10);      
      text("deck", 510, 20);
      drawCardBackAt(510, 30);
      
      //
}

public void renderHand() 
{
      Card2[] curHand = gameModel.lookCurrentPlayerHand();
      int x = 30;
      for (int i = 0; i< curHand.length; i++)
      {
            boolean highlight = curHand[i].validPlayOn(gameModel.lookPlayPile());
            renderCardAt(curHand[i], (i*(cardWidth+10)) + x , handY, highlight);
            
      }
}

void keyPressed() 
{
      if (key == 'q') 
      {
            print(gameModel.queryGameState());
      } else if (key == 'e')
      {
            print(gameModel.queryPlayerHand(gameModel.currentPlayer()));
            print("can play: "+ gameModel.queryPlayableCards());
      }
      
}
void mousePressed(){
      
      
}

public void renderCardAt(Card2 c, int x, int y, boolean highlight) 
{      
      //draw corner triangle colors
      String col = c.getColor();
      color colr;
      if (col.equals("red"))         colr = color(255, 0, 0);
      else if (col.equals("green"))  colr = color(0, 255, 0);
      else if (col.equals("blue"))   colr = color(0, 0, 255);
      else if (col.equals("yellow")) colr = color(255, 255, 0);
      else if (col.equals("wild"))   colr = color(0, 0, 0);
      else colr = color(255, 255, 255);
      fill(colr);  
      noStroke();

      int trX = x + cardWidth ;
      int trY = y;
      int bX = x;
      int bY = y + cardHeight ;

      triangle(x, y, trX, trY, bX, bY);

      //draw border
      stroke(0, 0, 0);
      fill(0, 0);
      rect(x, y, cardWidth, cardHeight );

      int textY = y + (cardHeight) - 7;

      //draw text
      textAlign(RIGHT);
      textSize(18);
      fill(10);
      text(c.getText(), x+cardWidth-3, textY);
      
      if(highlight)
      {
            stroke(200, 10, 10);
            strokeWeight(5);
            ellipse(x+(cardWidth/2), y+ cardHeight + 20, 5, 5);
            strokeWeight(3);
      }
}

void drawCardBackAt(int x, int y)
{
      //draw border
      stroke(0, 0, 0);
      fill(0, 0);
      rect(x, y, cardWidth, cardHeight );
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