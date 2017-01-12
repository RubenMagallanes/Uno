public class UnoGame {

      private int numberOfPlayers; 
      private Hand[] players;
      private int currentPlayer;
      
      private Deck unoDeck;
      private Card2 playPile; 
      //private ArrayList<Card2> table;
      //private ArrayList<Card2> discardPile; 
      
      public UnoGame(int numPlayers){
            if (numPlayers < 1){
                  print("numPlayers < 1, game invalid lul");
            }
            //set up variables
            numberOfPlayers = numPlayers;
            players = new Hand[numberOfPlayers];
            currentPlayer = 0; 
            
            unoDeck = new Deck();
            
            //table = new ArrayList<Card2>();
            //discardPile = new ArrayList<Card2>();
            
            //set up uno game
            dealHands();
            drawStartingCard();
            
            //now wait for method calls
      }
      private void drawStartingCard()
      {     //TODO some way of notifying players about what cards have been skipped
            Card2 card = unoDeck.drawCard();
            while (!card.isNumeric()){
                  card = unoDeck.drawCard();
            }
            playPile = card;
      }
      
      private void dealHands()
      {      //draw 7 cards for each player
            for (int i=0; i< numberOfPlayers; i++)
            {
                  Hand h = new Hand();
                  for (int j = 0; j< 7; j++) // draw 7 cards into hand
                  {
                        h.addToHand(unoDeck.drawCard());
                  }
                  players[i] = h;
            }
      }
      // methods for influencing game state by players
      //methods for reading data for view
      
      public Card2[] lookCurrentPlayerHand(){
            return lookPlayerHand(currentPlayer);
      }
      public Card2[] lookPlayerHand(int playerNo){
            Card2[] handv = players[playerNo].getCards();
            return handv;
      }
      public Card2 lookPlayPile(){
            return playPile;
      }
      public int currentPlayer(){
            return currentPlayer;
      }
      //text based querys
      public String queryGameState(){
            String ret = "currentPlayer: " + currentPlayer + "\n";
            ret += "card to match: " + playPile.toString()+ "\n"; 
            ret += "player Hands: \n";
            
            for (int i = 0; i< numberOfPlayers; i++)
            {
                  ret += "player "+ i+ "\n";
                  ret += queryPlayerHand(i);
                  
            }
            return ret;
      }
      public String queryPlayerHand(int player){
            Hand h = players[player];
            Card2[] cards = h.getCards();
            String ret = "";
            for (int i = 0; i< cards.length; i++)
            {
                  ret += cards[i].toString() + ", ";
            }
            return ret + "\n";
      }
      
}

/*
TODO:
creating a new uno game creates deck, 
hands for players, sets starting player then waits for method calls from players
then work on synchronisation 
discard pile & reshuffling 
*/