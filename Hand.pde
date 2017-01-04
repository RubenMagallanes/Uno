public class Hand 
{
      private ArrayList<Card2> cards;
      public Hand (){
            cards = new ArrayList<Card2>(); 
      }
      public void addToHand(Card2 car){
            cards.add(car);
      }
      public Card2[] getCards(){
            Card2[] toRet =  cards.toArray(new Card2[cards.size()]);
            return toRet;
      }
}