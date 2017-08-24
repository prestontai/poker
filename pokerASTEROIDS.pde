//POKER BUT WITH ASTEROIDS!!
SpaceShip flyer = new SpaceShip();
ArrayList <Bullet> magazine = new ArrayList <Bullet> ();
public int distance1, distance2;
public boolean starCounter=false;
Star [] night = new Star[400];
Cards [] deck = new Cards[52];								//original code for poker
ArrayList <Cards> hand = new ArrayList<Cards> ();
//boolean [] switcher = new boolean [5];
public int withinCounter=0;
public int handCount=0;
public int timer=0;
public int shotTargets=0;
/*public float money=100;
public float bet=1; //bet is 1 right now;
public int counter=0;
public boolean gameStart=false;
public boolean roundOver=true;
public boolean lock=false;
public int something;*/
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
	for(int sui=1; sui<=4; sui++){								//deck creator
			for(int val=0; val<13; val++){
				deck[withinCounter+val]= new Cards();
				deck[withinCounter+val].setValue(val);
				deck[withinCounter+val].setSuit(sui);
			}
		withinCounter+=13;
	}
	for(int empty=0; empty<5; empty++){
		hand.add(0,new Cards());
	}
	//shuffle(deck);
}
public void draw(){
	background(0);
	for(int i=0; i<night.length; i++){			//shows stars
	      night[i].move();
	      night[i].show();
    }
	flyer.show();
	flyer.move();
	for(int i=0; i<52; i++){
		deck[i].cardMake(i);
		deck[i].show();
		deck[i].move();
	}
	timer++;
	if(timer>1000){
		for(int i=0; i<52; i++){
			deck[i].setX(((int)(Math.random()*400)+50));
			deck[i].setY(((int)(Math.random()*4000)-4000));
			System.out.println("resetting");
		}
		timer=0;
	}
	if (keyPressed) {
      if (key == 'a' ) {  			//left
        flyer.setDirectionX(-6);
      }else if (key == 'd'){		//right
      	flyer.setDirectionX(6);
      /*}else if(key=='w'){				//up
      	flyer.setDirectionY(-6);		
      }else if(key=='s'){			
      	flyer.setDirectionY(6);*/		//down
      }else{
      	flyer.setDirectionX(0);
      }
    }
    noStroke();
    for(int a=0; a<deck.length; a++){
      	for(int i=0; i<magazine.size(); i++){
	     	if(magazine.get(i).getX()<deck[a].getX()+90&&magazine.get(i).getX()>deck[a].getX()-10
	     	&&magazine.get(i).getY()<deck[a].getY()+100){				//80X 100Y
		          deck[a].setX(5000);
		          magazine.remove(i);
		          i--;
		          handCount++;
		          shotTargets++;
		          break;
	       	}
    	}
     	/*if(deck[a].getY()==600){
    		deck[a].setX(5000);
    	}*/
    }
    for(int i=0; i<magazine.size(); i++){
      magazine.get(i).move();
      magazine.get(i).show();
      if(magazine.get(i).getX()<0 ||magazine.get(i).getY()<0||magazine.get(i).getX()>600|| magazine.get(i).getY()>600){                    //removing asteroids on contact
        magazine.remove(i);
        i--;
      }
    }
    fill(50,150,50);	//dashboard
    rect(0,520,600,90);
    for(int a=0; a<deck.length; a++){
	    if(deck[a].getX()==5000){
	    	deck[a].setX(10000);
	    	hand.set(handCount-1, deck[a]);
	    }
	}
			stroke(0,0,0);
			textSize(15);																		
			fill(0,0,0);
			text(hand.get(0).getValueConvert()+"\n" + hand.get(0).getSuitConvert(), 1*90 + 20, 540);			
			text(hand.get(1).getValueConvert()+"\n" + hand.get(1).getSuitConvert(), 2*90 + 20, 540);
			text(hand.get(2).getValueConvert()+"\n" + hand.get(2).getSuitConvert(), 3*90 + 20, 540);
			text(hand.get(3).getValueConvert()+"\n" + hand.get(3).getSuitConvert(), 4*90 + 20, 540);
			text(hand.get(4).getValueConvert()+"\n" + hand.get(4).getSuitConvert(), 5*90 + 20, 540);
	if(handCount==5){
		handCount=0;
		//hand.set(handCount-1, deck[0]);
	}

}
public void keyPressed(){

}
public void mousePressed(){
	magazine.add(0, new Bullet());
	System.out.println(shotTargets);						//to see how many targets were shot, trying to see if it's over 52, checking if reset deck works
	//System.out.println(deck[0].getValue()); 						//to try to get value of cards
	//System.out.println(maker.getX() + " "+ maker.getY());			//to try to get coordinates of cards
	//System.out.println(deck[0].getX()+""+deck[0].getY());			//cards were initially not visible
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
	int myX= ((int)(Math.random()*400)+50);
	int myY= ((int)(Math.random()*4000)-4000);
	public Cards(){
		myDirectionY= 1;
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
		rect(myX, myY, 80, 100); 												//the card itself
		fill(0,0,0);
		text(deck[input].getValueConvert()+"\n" + deck[input].getSuitConvert(), myX+5, myY+20); 		//text of the card
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
public void shuffle(int inArray[] ){
	int temp1, temp2;
	for(int i=0; i<inArray.length; i++){
		temp1=(int)(Math.random()*52);
		temp2=(int)(Math.random()*52);
		inArray[temp1]=inArray[temp2];
		inArray[temp2]=inArray[temp2];

	}
}