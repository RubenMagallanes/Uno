/**
 class that generates uno cards. 
 it may promise no duplicates, it may not 8)
 */
public class Deck
{
      private String[] colors = {"red", "blue", "green", "yellow", "wild"};
      private String[] texts = {"0", "1", "2", "3", "4", "5", "6", "7", "8", 
            "9", "skip", "reverse", "draw2", "draw4", "wild"};
            
      public Deck() {
      }

      public Card2 drawCard() throws Exception {
            int colorIndex = int(random(colors.length-1));
            int textIndex = int(random(texts.length-1));
            print ("generated card, ("+ colorIndex +", "+ textIndex+")\n");
            return new Card2(colors[colorIndex], texts[textIndex]);
      }
}

/*
TODO:
somehow make cards generated consistent with a real uno deck
prolly generate a deck's worth of cards, store in data structure
then randomly serve when drawn.
*/