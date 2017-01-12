int cardWidth = 70;
int cardHeight = 100; 

int handY = 160;


public void renderGameBoard()
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