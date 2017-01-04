public class Card
{      
      private String cColor; // r,g,b or wild
      private boolean numeric;  
      private int number; //used if numeric.
      private String type; // skip, reverse, draw2, draw4, wild


      public Card(String c, int numb) throws Exception
      {
            if (c.equals("red")||
                  c.equals("blue")||
                  c.equals("green")||
                  c.equals("yellow")||
                  c.equals("wild")
                  ) this.cColor = c;
            else throw new Exception("invalid color input");
            this.numeric = true;
            if (numb < 0 || numb > 9) throw new Exception("invlid number input"); 
            this.number = numb;
      }
      public Card(String c, String t) throws Exception
      {
            if (c.equals("red")||
                  c.equals("blue")||
                  c.equals("green")||
                  c.equals("yellow")||
                  c.equals("wild")
                  ) this.cColor = c;
            else throw new Exception("invalid color input");
            this.numeric = false;
            if (t.equals("skip")||
                  t.equals("reverse")||
                  t.equals("draw2")||
                  t.equals("draw4")||
                  t.equals("wild")
                  ) this.type = t;
            else throw new Exception("invalid type input");
      }
      //      -- getters --

      public String getColor() {
            return this.cColor;
      }
      public boolean isNumeric(){
            return numeric;
      }
      public int getNumber() {
            if (numeric) return this.number;
            else return -1;
      }
      public String getType() {
            if (numeric) return null;
            else return this.type;
      }
}