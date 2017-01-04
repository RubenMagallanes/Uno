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

Hand hand ;
Deck deck;
int cardWidth;
int cardHeight; 


void setup() {
      size (360, 110);
      frameRate(1);
      //noStroke();
      strokeWeight(3);
      cardWidth = 70;
      cardHeight = 100;
      hand = new Hand();
      deck = new Deck();
}




void draw() {
      background(240, 240, 240);

      try {
            Card2 drawn = deck.drawCard();
            hand.addToHand(drawn);
            renderCardAt(drawn, 0, 0);
      } 
      catch (Exception e) { 
            print (e. getMessage());
      }
      
      
      
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
      int bY = cardHeight +6;

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