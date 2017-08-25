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
public boolean scoreStart=false;
public boolean handScore=false;
public int adjustSpeedOfCard=5000;
ArrayList<Integer> uniqueArray = new ArrayList<Integer>();

public void settings(){
	//size(600,600);				//for Sublime

}

public void setup(){
	size(600,600);				//for JS
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
	for(int empty=0; empty<9; empty++){
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
	if(timer>adjustSpeedOfCard){
		for(int i=0; i<52; i++){
			if(deck[i].getY()<-100){
				deck[i].setY(((int)(Math.random()*adjustSpeedOfCard)-adjustSpeedOfCard-300));			//resets cards that arent shown on screen
			}
		}
		timer=0;
	}
	if (keyPressed) {
      if (key == 'a' ) {  			//left
        flyer.setDirectionX(-6);
      }else if (key == 'd'){		//right
      	flyer.setDirectionX(6);
      }else{
      	flyer.setDirectionX(0);
      }
    }
    noStroke();
    for(int a=0; a<deck.length; a++){
      	for(int i=0; i<magazine.size(); i++){
	     	if(magazine.get(i).getX()<deck[a].getX()+90&&magazine.get(i).getX()>deck[a].getX()-10					//collision of bullets and cards
	     	&&magazine.get(i).getY()<deck[a].getY()+100&&magazine.get(i).getY()>deck[a].getY()){				//80X 100Y
		          deck[a].setY(-20000);					//moves the card off the screen if it gets hit
		          magazine.remove(i);
		          i--;
		          handCount++;
		          shotTargets++;
		          scores-=1;
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
      if(magazine.get(i).getX()<0 ||magazine.get(i).getY()<0||magazine.get(i).getX()>600|| magazine.get(i).getY()>600){                    //removing bullets when it goes off the screen
        magazine.remove(i);
        i--;
      }
    }
    fill(50,150,50);				//dashboard
    rect(0,520,600,90);
    for(int a=0; a<deck.length; a++){						//moves the cards that were shot far away and makes a copy onto the dashboard
	    if(deck[a].getY()==-20000){
	    	deck[a].setY(-30000);
	    	hand.set(handCount-1, deck[a]);
	    }
	    if(deck[a].getY()>600){
	    	deck[a].setY(-10000);
	    }
	}
			stroke(0,0,0);
			textSize(15);																		
			fill(0,0,0);
			text(hand.get(0).getValueConvert()+"\n" + hand.get(0).getSuitConvert(), 1*90 + 40, 540);			
			text(hand.get(1).getValueConvert()+"\n" + hand.get(1).getSuitConvert(), 2*90 + 40, 540);
			text(hand.get(2).getValueConvert()+"\n" + hand.get(2).getSuitConvert(), 3*90 + 40, 540);
			text(hand.get(3).getValueConvert()+"\n" + hand.get(3).getSuitConvert(), 4*90 + 40, 540);
			text(hand.get(4).getValueConvert()+"\n" + hand.get(4).getSuitConvert(), 5*90 + 40, 540);
	if(handCount>=6){								//making the hand
		handCount=0;
		scores+=1;
	}else if(handCount==5){
		scoreEngine();
		scoreStart=false;
	}else if(handCount==4){
		scoreStart=true;
	}
	text("SCORE: "+ scores, 20, 540);				//scoreCard
	fill(150,200,250);	
	noStroke();
	fill(50,150,50);								//shifting rectangle to cover up a hand that isn't complete
	rect(600,520,-480+handCount*90,90);
									
	strokeWeight(3);
	stroke(150,200,250);									//theCrossHair
	line(mouseX-15, mouseY-15, mouseX-8, mouseY-8);
	line(mouseX-15, mouseY+15, mouseX-8, mouseY+8);
	line(mouseX+15, mouseY+15, mouseX+8, mouseY+8);
	line(mouseX+15, mouseY-15, mouseX+8, mouseY-8);
	strokeWeight(1);

}
public void keyPressed(){					

}
public void mousePressed(){
	magazine.add(0, new Bullet());
	/*magazine.add(0, new Bullet());
	magazine.add(0, new Bullet());
	magazine.add(0, new Bullet());
	magazine.add(0, new Bullet());
	magazine.get(1).setDirectionX(2*(mouseX-flyer.getX())/(mouseY-flyer.getY()-120));			//fun!  just adding a spread of bullets
	magazine.get(2).setDirectionX(-2*(mouseX-flyer.getX())/(mouseY-flyer.getY()-120));			
	magazine.get(3).setDirectionX(4*(mouseX-flyer.getX())/(mouseY-flyer.getY()-120));*/
	
	/*if(-3*(mouseX-flyer.getX())/(mouseY-flyer.getY()-100)<-15){
		magazine.get(0).setDirectionX(-8);														
	}else if(-3*(mouseX-flyer.getX())/(mouseY-flyer.getY()-100)>15){
		magazine.get(0).setDirectionX(8);
	}else{*/
		magazine.get(0).setDirectionX(-4*(mouseX-flyer.getX())/(mouseY-flyer.getY()-120));
	//}
	//System.out.println(shotTargets);						//to see how many targets were shot, trying to see if it's over 52, checking if reset deck works
	//System.out.println(deck[0].getValue()); 						//to try to get value of cards
	//System.out.println(maker.getX() + " "+ maker.getY());			//to try to get coordinates of cards
	//System.out.println(deck[0].getX()+""+deck[0].getY());			//cards were initially not visible
	//magazine.get(0).getDirectionX();								//bullets are moving left or right
	//System.out.println(flyer.getX());								//ship wouldnt move
}
public class SpaceShip extends Floater{
	private int colorChange;
	public SpaceShip(){
	}
	public void show(){
		colorChange++;
		fill(100,50,0);
		noStroke();
		fill(colorChange%80+20, colorChange%120, 150);
		rect((float)myX, (float)myY, 50, -20);					//long piece
		fill(colorChange%150+40, colorChange%170, 150);
		rect((float)myX, (float)myY, 10, -30);					//left
		fill(colorChange%150+40, colorChange%170, 150);
		rect((float)myX+40, (float)myY, 10, -30);					//right
		fill(colorChange%80+20, colorChange%120, 150);
		rect((float)myX+20, (float)myY, 10, -60);					//center
	}
	public void setX(double x){myX= x;}; 
    public double getX(){return myX;};
    public void setY(double y){myY= y;};
    public double getY(){return myY;};
	public void setDirectionX(double dirX){myDirectionX = dirX;};
    public double getDirectionX(){return myDirectionX;};
    public void setDirectionY(double dirY){myDirectionY = dirY;};
    public double getDirectionY(){return myDirectionY;};
}

abstract class Floater{
	protected double myX;
	protected double myY;
	protected double myDirectionX;
	protected double myDirectionY;
	abstract public void setX(double x);
	abstract public double getX ();
	abstract public void setY(double y);
	abstract public double getY ();
	abstract public void setDirectionX(double dirX);
	abstract public double getDirectionX();
	abstract public void setDirectionY(double dirY);
	abstract public double getDirectionY();
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
	double myX= ((int)(Math.random()*400)+50);
	double myY= ((int)(Math.random()*adjustSpeedOfCard)-adjustSpeedOfCard-100);
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
			//return Integer.toString(myValue+2);			//FOR Sublime
			return parseInt(myValue+2);				//FOR Javascript
		}
	}
	public void move(){
		myY+= myDirectionY;
	}
	public void cardMake(int input){							//makes the cards so it's easier to call
		stroke(0,0,0);
		textSize(15);
		fill(180,20,20);
		rect((float)myX, (float)myY, 80, 100); 												//the card itself
		fill(0,0,0);
		text(deck[input].getValueConvert()+"\n" + deck[input].getSuitConvert(), (float)myX+5, (float)myY+20); 		//text of the card
	}		
	public void setX(double x){myX= x;}; 
    public double getX(){return myX;};
    public void setY(double y){myY= y;};
    public double getY(){return myY;};
    public void setDirectionX(double dirX){myDirectionX = dirX;};
    public double getDirectionX(){return myDirectionX;};
    public void setDirectionY(double dirY){myDirectionY = dirY;};
    public double getDirectionY(){return myDirectionY;};
}
public class Star extends Floater{
	private double myStarX, myStarY;
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
      fill((float)myColorStar);
      ellipse((float)myStarX, (float)myStarY, 2, 2);
      super.show();
    }
    public void setX(double x){myX= x;}; 
    public double getX(){return myX;};
    public void setY(double y){myY= y;};
    public double getY(){return myY;};
	public void setDirectionX(double dirX){myDirectionX = dirX;};
    public double getDirectionX(){return myDirectionX;};
    public void setDirectionY(double dirY){myDirectionY = dirY;};
    public double getDirectionY(){return myDirectionY;};
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
