public class Card2
{      
      private String cColor; // r,g,b or wild
      private boolean numeric; //is 0-9 or special
      private final String text; //0-9, skip, reverse, draw2, draw4, wild


      public Card2(String c, String t) throws Exception
      {
            if (!validateCard(c, t))
                  throw new Exception ("invalid card");

            this.numeric = textIsNumeric(t);
            this.text = t;
            this.cColor = c;
      }
      
      /**
            returns whether this card is a valid play on the prevous
      */
      public boolean validPlayOn(Card2 previous){
            if (cColor.equals("wild")) 
                  return true; // can play wilds on anything
            if (previous.getColor().equals(cColor))
                  return true; // colors match
            if (previous.getText().equals(text))
                  return true; // same number/ special card
            return false;      // nothng matches
      }
      
      
      //      -- getters -- suh dude -- 

      public String getColor() {
            return this.cColor;
      }
      /** set wild cards color */
      public boolean chooseWildColor(String col){
            if (!validateColor(col)) return false;
            if (col.equals ("wild")) return false; // cant choose wild as a color lol
            this.cColor = col;
            return true;
      }
      public boolean isNumeric() {
            return numeric;
      }
      public boolean isSpecial() {
            return !numeric;
      }
      public String getText() {
            return this.text;
      }

      @Override
            public boolean equals(Object other) {
            if (other == this) // check if is itself
                  return true;
            if (!(other instanceof Card2)) //check other is a Card2
                  return false;
            Card2 otherC = (Card2) other;
            return otherC.getColor().equals(this.getColor()) && 
                  otherC.getText().equals(this.getText());
      }
      @Override
            public String toString () {
            return "" + cColor + " "+ text;
      }

      /* private methods for validating card */

      private boolean validateCard(String c, String t) {
            if (validateColor(c) &&
                  validateText(t) &&
                  validateWild(c, t))
                  return true;
            else
                  return false;
      }
      private boolean validateColor (String c) {
            String[] colors = {"red", "blue", "green", "yellow", "wild"};
            if (isInArray(c, colors))
                  return true; 
            else
                  return false;
      }
      private boolean validateText (String t) {
            String[] texts = {"0", "1", "2", "3", "4", "5", "6", "7", "8", 
                  "9", "skip", "reverse", "draw2", "draw4", "wild"};
            if (isInArray(t, texts))
                  return true;
            else 
            return false;
      }
      private boolean isInArray(String s, String[] ary) {
            for (int i = 0; i< ary.length; i++) {
                  if (ary[i].equals(s)) return true;
            }
            return false;
      }
      private boolean validateWild(String c, String t) {
            if ((t.equals("draw4") && !c.equals("wild")) ||
                  (t.equals("wild") && !c.equals("wild")))
                  return false;
            else return true;
      }
      private boolean textIsNumeric(String t) {
            String[] nums = {"0", "1", "2", "3", "4", "5", "6", "7", "8", 
                  "9"};

            if (isInArray(t, nums))
                  return true;
            else 
            return false;
      }
}