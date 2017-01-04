Card2 c1, c2, c3, c4, c5;
int cardWidth;
int cardHeight; 


void setup() {
      size (360, 110);
      //noStroke();
      strokeWeight(3);
      cardWidth = 70;
      cardHeight = 100;
      
      try {
            c1 = new Card2("red", "0");
            c2 = new Card2("blue", "9");
            c3 = new Card2("green", "reverse");
            c4 = new Card2("yellow", "draw2");
            c5 = new Card2("wild", "wild");
            
      } 
      catch (Exception e) {
            print(e.getMessage());
      }

}




void draw() {
      background(240,240,240);
      
      renderCardAt(c1, 5, 5);
      renderCardAt(c2, 75, 5);
      renderCardAt(c3, 145, 5);
      renderCardAt(c4, 215, 5);
      renderCardAt(c5, 285, 5);
      
}

public void renderCardAt(Card2 c, int x, int y) {
      
      //draw corner triangle colors
      String col = c.getColor();
      color colr;
      if (col.equals("red"))         colr = color(255,0,0);
      else if (col.equals("green"))  colr = color(0,255,0);
      else if (col.equals("blue"))   colr = color(0,0,255);
      else if (col.equals("yellow")) colr = color(255,255,0);
      else if (col.equals("wild"))   colr = color(0,0,0);
      else colr = color(255,255,255);
      fill(colr);  
      noStroke();
      
      int trX = x + cardWidth ;
      int trY = y;
      int bX = x;
      int bY = cardHeight +6;
      
      triangle(x, y, trX, trY, bX, bY);
      
      //draw border
      stroke(0,0,0);
      fill(0,0);
      rect(x, y, cardWidth , cardHeight );
      
      int textY = y + (cardHeight) - 7;
      
      //draw text
      textAlign(RIGHT);
      textSize(18);
      fill(10);
      text(c.getText(), x+cardWidth-3, textY);
}