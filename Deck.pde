/**
 class that generates uno cards. 
 it may promise no duplicates, it may not 8)
 */
public class Deck
{
      private final String[] colors = {"red", "blue", "green", "yellow", "wild"};
      private final String[] texts = {"0", "1", "2", "3", "4", "5", "6", "7", "8", 
            "9", "skip", "reverse", "draw2", "draw4", "wild"};

      private ArrayList<Card2> cards; // holds all the cards
      public Deck() 
      {
            cards = new ArrayList<Card2>();
            try {
                  fillDeckWithCards();
            } 
            catch (Exception e) {
                  print("exception generating cards, deck is invalid");
                  print(e.getMessage());
            }
      }
      /**
            fills the cards array with cards so it's a valid uno Deck
      */
      private void fillDeckWithCards() throws Exception
      {
            //first lot of all cols 0-9
            for (int col = 0; col < 4; col ++) {
                  for (int num = 0; num < 10; num++) {
                        cards.add(  new Card2 (colors[col], texts[num]));
                  }
            }
            //all cols 1-9
            for (int col = 0; col < 4; col ++) {
                  for (int num = 1; num < 10; num++) {
                       cards.add(  new Card2 (colors[col], texts[num]));
                  }
            }
            //all cols 2x skips, 2xreverse, 2x draw 2
            for (int col = 0; col < 4; col ++) {
                  cards.add(new Card2(colors[col], "skip"));
                  cards.add(new Card2(colors[col], "skip"));

                  cards.add(new Card2(colors[col], "reverse"));
                  cards.add(new Card2(colors[col], "reverse"));

                  cards.add(new Card2(colors[col], "draw2"));
                  cards.add(new Card2(colors[col], "draw2"));
            }
            //4x wilds, 4x draw wilds
            for (int i = 0; i< 4; i++) {
                  cards.add(  new Card2("wild", "wild"));
                  cards.add(  new Card2("wild", "draw4"));
            }
      }

       public Card2 drawCard(){
             //TODO check if deck is size=1, if so reshuffle 
             //deck except last card
             
             Card2 c = cards.remove(0); // gets first card.
             return (c);
       }
}

/*
TODO:
 somehow make cards generated consistent with a real uno deck
 prolly generate a deck's worth of cards, store in data structure
 then randomly serve when drawn.
 */