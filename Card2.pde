public class Card2
{      
      private String cColor; // r,g,b or wild
      private boolean numeric; //is 0-9 or special
      private String text; //0-9, skip, reverse, draw2, draw4, wild


      public Card2(String c, String t) throws Exception
      {
            //validate color
            if (c.equals("red")||
                  c.equals("blue")||
                  c.equals("green")||
                  c.equals("yellow")||
                  c.equals("wild")
                  ) this.cColor = c;
            else throw new Exception("invalid color input");

            //check is numeric 
            if (t.equals("skip")||
                  t.equals("reverse")||
                  t.equals("draw2")||
                  t.equals("draw4")||
                  t.equals("wild")){
                  this.numeric = false;
            } else {
                  this.numeric = true;
            }
            this.text = t;
            
            //validate wild cards color
            if ((t.equals("draw4") && !c.equals("wild")) ||
                  (t.equals("wild") && !c.equals("wild")))
                  throw new Exception("draw4 and wild must have color = wild");
      }
      //      -- getters --

      public String getColor() {
            return this.cColor;
      }
      public boolean isNumeric() {
            return numeric;
      }
      public boolean isSpecial(){
            return !numeric;
      }
      public String getText() {
            return this.text;
      }
}