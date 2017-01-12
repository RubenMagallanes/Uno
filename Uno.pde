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

void setup() {
      size (700, 290);
      frameRate(30);
      //noStroke();
      strokeWeight(3);


      gameModel = new UnoGame(2);
}




void draw() {
      background(240, 240, 240);
      textAlign(LEFT);
      textSize(18);
      fill(10);
      text("Play Pile", 30, 20);
      renderCardAt(gameModel.lookPlayPile(), 30, 30);

      textAlign(LEFT);
      textSize(18);
      fill(10);      
      text("player "+ gameModel.currentPlayer()+"'s hand", 30, 150);
      renderHand();
}

public void renderHand() {
      Card2[] curHand = gameModel.lookCurrentPlayerHand();
      int x = 30;
      for (int i = 0; i< curHand.length; i++)
      {
            renderCardAt(curHand[i], (i*(cardWidth+10)) + x , handY);
      }
}

void keyPressed() {
      if (key == 'q') {
            print(gameModel.queryGameState());
      }
      
}
void mousePressed(){
      
      
}

public void renderCardAt(Card2 c, int x, int y) {

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
}

void drawCardBackAt(int x, int y){
      //draw border
      stroke(0, 0, 0);
      fill(0, 0);
      rect(x, y, cardWidth, cardHeight );
}