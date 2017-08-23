//POKER BUT WITH ASTEROIDS!!
SpaceShip flyer = new SpaceShip();
ArrayList <Bullet> magazine = new ArrayList <Bullet> ();
public int distance1, distance2;
public boolean starCounter=false;
Star [] night = new Star[400];

Cards [] deck = new Cards[52];								//original code for poker
boolean [] switcher = new boolean [5];
public int withinCounter=0;
public float money=100;
public float bet=1; //bet is 1 right now;
public int counter=0;
public boolean gameStart=false;
public boolean roundOver=true;
public boolean lock=false;
public int something;
public boolean pairCheck, tripCheck, quadCheck, flushCheck=false;
public int flushCheckOne, flushCheckTwo, flushCheckThree, flushCheckFour;
ArrayList<Integer> uniqueArray = new ArrayList<Integer>();

public void settings(){
	size(600,600);
}

public void setup(){
	flyer.setX(300);
	flyer.setY(500);
	for(int i=0; i<night.length; i++){	//star background maker
   		 night[i]= new Star();
 	}
	for(int d=0; d<52; d++){
		
	}
	for(int sui=1; sui<=4; sui++){								//deck creator
			for(int val=0; val<13; val++){
				deck[withinCounter+val]= new Cards();
				deck[withinCounter+val].setValue(val);
				deck[withinCounter+val].setSuit(sui);
			}
		withinCounter+=13;
	}
}
public void draw(){
	background(0);
	/*if(collision>10){
		for(int i=0; i<deckFall.length; i++){
			length
		}
	}*/
	for(int i=0; i<night.length; i++){			//shows stars
	      night[i].move();
	      night[i].show();
    }
	flyer.show();
	flyer.move();
	for(int i=0; i<deck.length; i++){
		deck[i].cardMake(i);
		deck[i].show();
		deck[i].move();
	}
	if (keyPressed) {
      if (key == 'a' ) {  			//left
        flyer.setDirectionX(-4);
      }else if (key == 'd'){		//right
      	flyer.setDirectionX(4);
      }
    }else{
    	flyer.setDirectionX(0);
    }
    for(int i=0; i<magazine.size(); i++){
      magazine.get(i).move();
      magazine.get(i).show();
      if(magazine.get(i).getX()<0 ||magazine.get(i).getY()<0||magazine.get(i).getX()>600|| magazine.get(i).getY()>600){                    //removing asteroids on contact
        magazine.remove(i);
        i--; 
      }
    }
}
public void keyPressed(){

}
public void mousePressed(){
	magazine.add(0, new Bullet());
	System.out.println(uniqueArray.size()); 	//debugging line
	//System.out.println(maker.getX() + " "+ maker.getY());
	//System.out.println(deck[0].getX()+""+deck[0].getY());
}
public class SpaceShip extends Floater{
	public void show(){
		fill(100,50,0);
		noStroke();
		rect(myX, myY, 50, -20);
		rect(myX, myY, 10, -30);
		rect(myX+40, myY, 10, -30);
		rect(myX+20, myY, 10, -60);
	}
	public void setX(int x){myX= x;}; 
    public int getX(){return myX;};
    public void setY(int y){myY= y;};
    public int getY(){return myY;};
	public void setDirectionX(int dirX){myDirectionX = dirX;};
    public int getDirectionX(){return myDirectionX;};
    public void setDirectionY(int dirY){myDirectionY = dirY;};
    public int getDirectionY(){return myDirectionY;};
}

abstract class Floater{
	protected int myX;
	protected int myY;
	protected int myDirectionX;
	protected int myDirectionY;
	abstract public void setX(int x);
	abstract public int getX ();
	abstract public void setY(int y);
	abstract public int getY ();
	abstract public void setDirectionX(int dirX);
	abstract public int getDirectionX();
	abstract public void setDirectionY(int dirY);
	abstract public int getDirectionY();
	public void move(){
		myX +=myDirectionX;
		myY +=myDirectionY;
		if(myX+54>width){
			myX=width-54;
		}else if(myX-8<0){
			myX=8;
		}
	}
	public void show(){

	}
}

public class Cards extends Floater{
	int myValue;
	int mySuit;	
	public Cards(){
		myDirectionY= 3;
	}

	public void setValue(int value){
		myValue=value;
	}
	public int getValue(){
		return myValue+2;
	}
	public void setSuit(int suit){
		mySuit=suit;
	}
	public int getSuit(){
		return mySuit;
	}
	public String getSuitConvert(){		//switches from int to string to display suit instead of number
		if(mySuit==1){
			return "diamonds";
		}else if(mySuit==2){
			return "clovers";
		}else if(mySuit==3){
			return "hearts";
		}else{
			return "spades";
		}
	}
	public String getValueConvert(){	//switches to Jack/Queen/King/Ace
		if(myValue+2==11){
			return "JACK";
		}else if(myValue+2==12){
			return "QUEEN";
		}else if(myValue+2==13){
			return "KING";
		}else if(myValue+2==14){
			return "ACE";
		}else{
			return Integer.toString(myValue+2);			//FOR Sublime
			//return parseInt(myValue+2);				//FOR Javascript
		}
	}
	public void move(){
		myY+= myDirectionY;
	}
	public void cardMake(int input){							//makes the cards so it's easier to call
		stroke(0,0,0);
		textSize(15);
		fill(180,20,20);
		rect(myX, myY, 80, 100); 
		fill(0,0,0);
		text(deck[input].getValueConvert()+"\n" + deck[input].getSuitConvert(), myX, myY); //falling cards
	}		
	public void setX(int x){myX= x;}; 
    public int getX(){return myX;};
    public void setY(int y){myY= y;};
    public int getY(){return myY;};
    public void setDirectionX(int dirX){myDirectionX = dirX;};
    public int getDirectionX(){return myDirectionX;};
    public void setDirectionY(int dirY){myDirectionY = dirY;};
    public int getDirectionY(){return myDirectionY;};
}
/*public class physCard extends Floater{
	public physCard(){
		myDirectionY= 3;
		myX=(int)(Math.random()*560)+20;
		myY=(int)(Math.random()*560)+20;
		//myY=(int)(Math.random()*800)-900;
	}
	public void cardMake(int input){							//makes the cards so it's easier to call
		stroke(0,0,0);
		textSize(15);
		fill(180,20,20);
		rect(myX, myY, 80, 100); 
		fill(0,0,0);
		text(deck[uniqueArray.get(input)].getValueConvert()+"\n" + deck[uniqueArray.get(input)].getSuitConvert(), myX, myY); //falling cards
	}
    public void setX(int x){myX= x;}; 
    public int getX(){return myX;};
    public void setY(int y){myY= y;};
    public int getY(){return myY;};
    public void setDirectionX(int dirX){myDirectionX = dirX;};
    public int getDirectionX(){return myDirectionX;};
    public void setDirectionY(int dirY){myDirectionY = dirY;};
    public int getDirectionY(){return myDirectionY;};


}*/
public class Star extends Floater{
	private int myStarX, myStarY;
	private int myColorStar;
	public Star(){
		myStarX= ((int)(Math.random()*580)+10);
      	myStarY= ((int)(Math.random()*580)+10);
	}
	public void move(){
      if (myColorStar==255){
        starCounter=true;
      }else if(myColorStar==70){
        starCounter=false;
      }
      if(starCounter==true){
     	 myColorStar--;
      }else{
      	myColorStar++;
      } 
      super.move();
    }
    public void show(){
      noStroke();
      fill(myColorStar);
      ellipse((float)myStarX, (float)myStarY, 2, 2);
      super.show();
    }
    public void setX(int x){myX= x;}; 
    public int getX(){return myX;};
    public void setY(int y){myY= y;};
    public int getY(){return myY;};
	public void setDirectionX(int dirX){myDirectionX = dirX;};
    public int getDirectionX(){return myDirectionX;};
    public void setDirectionY(int dirY){myDirectionY = dirY;};
    public int getDirectionY(){return myDirectionY;};
}
public void shuffle(int []){

}