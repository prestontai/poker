import processing.core.*; 
import processing.data.*; 
import processing.event.*; 
import processing.opengl.*; 

import java.util.HashMap; 
import java.util.ArrayList; 
import java.io.File; 
import java.io.BufferedReader; 
import java.io.PrintWriter; 
import java.io.InputStream; 
import java.io.OutputStream; 
import java.io.IOException; 

public class poker extends PApplet {

//POKER
/*
Cards [] deck = new Cards[52];
boolean [] switcher = new boolean [7];
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
physCard maker = new physCard();
ArrayList<Integer> uniqueArray = new ArrayList<Integer>();
public void setup(){
	size(520,520);
	background(256,256,256);
	fill(50,50,50);
	textSize(40);
	text("PRESS SPACE TO START", 20, 300);
	for(int sui=1; sui<=4; sui++){
			for(int val=0; val<13; val++){
				deck[withinCounter+val]=new Cards();
				deck[withinCounter+val].setValue(val);
				deck[withinCounter+val].setSuit(sui);
			}
		withinCounter+=13;
	}
	for(int i=0; i<7; i++){
		uniqueArray.add((int)(Math.random()*52));
	}
}
public void draw(){
	if(gameStart==true){
		textSize(40);
		noStroke();
		fill(256,256,256);
		rect(40, 155, 500, 50);
		fill(0,200,150);
		text("SCORE: " + (int)money, 50, 200); 								//scoring
		textSize(15);
		text("Press 1-5 to bet that amount" + "\n" + "current amount bet: " + bet, 300, 170);
	}
}
public void keyPressed(){
	if(keyCode==49){
		bet=1;
	}else if(keyCode==50){
		bet=2;
	}else if(keyCode==51){
		bet=3;
	}else if(keyCode==52){
		bet=4;
	}else if(keyCode==53){
		bet=5;
	}
	gameStart=true;					//start the game
	if(roundOver==true){
		if(keyCode==32){
			money=money-bet;
			flushCheckOne=0;
			flushCheckTwo=0;
			flushCheckThree=0;
			flushCheckFour=0;
												//reset pairCheck, tripCheck, quadCheck, flushCheck=false;
			background(256,256,256);
			roundOver=false;
			for(int i=0; i<7; i++){
				uniqueArray.set(i,(int)(Math.random()*52));
			}
			for(int i=0; i<7; i++){
				for(int j=0; j<7; j++){
					while(uniqueArray.get(i)==uniqueArray.get(j)&&i!=j){
						uniqueArray.set(i,(int)(Math.random()*52));
					}
				}
				maker.cardMake(i);
			}
			for(int i=0; i<5; i++){
				switcher[i]=false;
			}
				fill(50,50,50);							//switch cards button
				rect(140, 210, 260, 50);			
		}
	}
}	
public void mousePressed(){
	if(gameStart==true){					
		if(roundOver==false){
			if(mouseY>40&&mouseY<140){			//clicking to choose which cards to switch
				fill(0,0,250);
				textSize(15);
				if(mouseX>20&&mouseX<100){
					if(switcher[0]==false){
						text("SWITCH", 30, 120);
						switcher[0]=true;
					}else{
						maker.cardMake(0);
						switcher[0]=false;
					}
				}
				else if(mouseX>120&&mouseX<200){
					if(switcher[1]==false){
						text("SWITCH", 130, 120);
						switcher[1]=true;
					}else{
						maker.cardMake(1);
						switcher[1]=false;
					}
				}
				else if(mouseX>220&&mouseX<300){
					if(switcher[2]==false){
						text("SWITCH", 230, 120);
						switcher[2]=true;
					}else{
						maker.cardMake(2);
						switcher[2]=false;
					}
				}
				else if(mouseX>320&&mouseX<400){
					if(switcher[3]==false){
						text("SWITCH", 330, 120);
						switcher[3]=true;
					}else{
						maker.cardMake(3);
						switcher[3]=false;
					}
				}
				else if(mouseX>420&&mouseX<500){
					if(switcher[4]==false){
						text("SWITCH", 430, 120);
						switcher[4]=true;
					}else{
						maker.cardMake(4);
						switcher[4]=false;
					}
				}
			}
				if(mouseX>140&&mouseX<400&&mouseY>210&&mouseY<260){				//clicking the button to switch cards 
					roundOver=true;
					if(quadCheck==true){					//switching winnings over too boolean form

					}else if(flushCheck==true){

					}else if(tripCheck==true){

					}else if(pairCheck==true){

					}
					text("Press Space to Continue Playing", 50, 450);
					fill(100,100,100);											//the button to switch cards
					rect(140, 210, 260, 50);				
					for(int i=0; i<7; i++){				
						if(switcher[i]==true){									//switches the cards
							uniqueArray.set(i, (int)(Math.random()*52));
							for(int j=0; j<7; j++){
								while(uniqueArray.get(i)==uniqueArray.get(j)&&i!=j){		//removes duplicates
									uniqueArray.set(i, (int)(Math.random()*52));
								}
							}
						}
					maker.cardMake(i);
					switcher[i]=false;
				}
				for(int i=0; i<7; i++){
					for(int j=0; j<7; j++){
						if(i!=j&&deck[uniqueArray.get(i)].getValue()==deck[uniqueArray.get(j)].getValue()&&deck[uniqueArray.get(i)].getValue()>10){		//pair jacks++
							money+=0.25*bet;					
							fill(50,50,50);
							textSize(30);
							text("WINNER!", 380, 350);	//winning message
							text("WINNER!", 40, 350);
						}
					}  
				}//pair jacks++
				for(int i=0; i<7; i++){
					for(int j=0; j<7; j++){
						for(int k=0; k<7; k++){											
							for(int l=0; l<7; l++){
								if(i!=j&&deck[uniqueArray.get(i)].getValue()==deck[uniqueArray.get(j)].getValue()){		
									if(i!=k&&j!=k&&deck[uniqueArray.get(i)].getValue()==deck[uniqueArray.get(k)].getValue()){			//three of a kind
										money+=0.04*bet;
										if(k!=j&&i!=l&&deck[uniqueArray.get(k)].getValue()==deck[uniqueArray.get(l)].getValue()){		//four of a kind
											money+=0.1*bet;
										}
										fill(50,50,50);
										textSize(30);
										text("WINNER!", 380, 350);	//winning message
										text("WINNER!", 40, 350);
									}
								}
							}
						}
					}
				}//trips and quads
				for(int i=0; i<7; i++){
					if(deck[uniqueArray.get(i)].getSuit()==1){
						flushCheckOne++;
					}else if(deck[uniqueArray.get(i)].getSuit()==2){
						flushCheckTwo++;
					}else if(deck[uniqueArray.get(i)].getSuit()==3){
						flushCheckThree++;
					}else if(deck[uniqueArray.get(i)].getSuit()==1){
						flushCheckFour++;
					}
				}//flushCount
				if(Math.max(Math.max(Math.max(flushCheckOne, flushCheckTwo),flushCheckThree), flushCheckFour)>=5){
					money+=4*bet;
					fill(50,50,50);
					textSize(30);
					text("WINNER!" + "\n" + "FLUSH", 380, 350);	//winning message
					text("WINNER!" + "\n" + "FLUSH", 40, 350);
				}//flushCheck
				//for(int i=0; i<){

				//}
			}	
		}
	}
		
}
public class Cards{
	int myValue;
	int mySuit;	
	public Cards(){
				
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
}
public class physCard{
	public physCard(){

	}
	public void cardMake(int input){							//makes the cards so it's easier to call
		stroke(0,0,0);
		textSize(15);
		if(input<5){
			fill(180,20,20);
			rect(input*100+20, 40, 80, 100); 
			fill(0,0,0);
			//text(uniqueArray.get(input), (input)*100+25, 60); //numberInDeck	
			text(deck[uniqueArray.get(input)].getValueConvert()+"\n" + deck[uniqueArray.get(input)].getSuitConvert(), input*100 + 25, 60); //river
		}else if(input<7){
			fill(180,20,20);
			rect((input-4)*100+80, 300, 80, 100); 
			fill(0,0,0);	
			//text(uniqueArray.get(input), (input-4)*100+85, 320); //numberInDeck									
			text(deck[uniqueArray.get(input)].getValueConvert()+"\n" + deck[uniqueArray.get(input)].getSuitConvert(), (input-4)*100+85, 320); //hand
		}
	}
}
*/

class Bullet extends Floater{
  private double myBulletX, myBulletY;
  private float grower;
  private int colorChange;
  public Bullet(){            
      myBulletX = flyer.getX()+25;     
      myBulletY = flyer.getY()-60;    
      myDirectionY= -4;
      grower=0;
    }
    public void move(){
      myBulletY += myDirectionY;
      myBulletX += myDirectionX;
      grower+=0.1f;
      colorChange++;
    }
    public void show(){
      fill(255,100,colorChange*5);
      ellipse((float)myBulletX, (float)myBulletY, 5+grower, 5+grower);
      ellipse((float)myBulletX+5, (float)myBulletY, 5+grower, 5+grower);
      //ellipse((float)myBulletX+10, (float)myBulletY, 5+grower, 5+grower);
      ellipse((float)myBulletX-5, (float)myBulletY, 5+grower, 5+grower);
      //ellipse((float)myBulletX-10, (float)myBulletY, 5+grower, 5+grower);
      ellipse((float)myBulletX, (float)myBulletY+5, 5+grower, 5+grower);
      ellipse((float)myBulletX+5, (float)myBulletY+5, 5+grower, 5+grower);
      //ellipse((float)myBulletX+10, (float)myBulletY+5, 5+grower, 5+grower);
      ellipse((float)myBulletX-5, (float)myBulletY+5, 5+grower, 5+grower);
      //ellipse((float)myBulletX-10,aaaaaaaa (float)myBulletY+5, 5+grower, 5+grower);
      ellipse((float)myBulletX, (float)myBulletY+10, 5+grower, 5+grower);
      ellipse((float)myBulletX+5, (float)myBulletY+10, 5+grower, 5+grower);
      //ellipse((float)myBulletX+10, (float)myBulletY+10, 5+grower, 5+grower);
      ellipse((float)myBulletX-5, (float)myBulletY+10, 5+grower, 5+grower);
      //ellipse((float)myBulletX-10, (float)myBulletY+10, 5+grower, 5+grower);
    }
    public void setX(double x){myBulletX= x;}; 
    public double getX(){return myBulletX;};
    public void setY(double y){myBulletY= y;};
    public double getY(){return myBulletY;};
    public void setDirectionX(double dirX){myDirectionX = dirX;};
    public double getDirectionX(){return myDirectionX;};
    public void setDirectionY(double dirY){myDirectionY = dirY;};
    public double getDirectionY(){return myDirectionY;};
}


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
	size(600,600);				//for Sublime

}

public void setup(){
	//size(600,600);				//for JS
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
		handScore=false;
	}else if(handCount==4){
		handScore=true;
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
		noStroke();
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
//this is for caclulating winning hand and scores
public boolean pairCheck, tripCheck, quadCheck, flushCheck,straightCheck=false;
public int flushCheckOne, flushCheckTwo, flushCheckThree, flushCheckFour;
public int scores=0;
public void scoreEngine(){
	if(scoreStart==true&&handScore==true){
		if(quadCheck==true){					//switching winnings over too boolean form
			scores+=50;
		}else if(flushCheck==true){
			scores+=30;
		}else if(tripCheck==true){
			scores+=15;
		}else if(pairCheck==true){
			scores+=5;
	//	}else if(sortCards(hand)==true){

		}
		quadCheck=false;
		tripCheck=false;
		pairCheck=false;
		flushCheck=false;
		straightCheck=false;
		for(int i=0; i<5; i++){
			for(int j=0; j<5; j++){
				for(int k=0; k<5; k++){											
					for(int l=0; l<5; l++){
						if(i!=j&&j!=k&&k!=l&&hand.get(i).getValue()==hand.get(j).getValue()){						//two of a kind
							pairCheck=true;	
							if(hand.get(j).getValue()==hand.get(k).getValue()){			//three of a kind
								tripCheck=true;
								if(hand.get(k).getValue()==hand.get(l).getValue()){		//four of a kind
									quadCheck=true;
								}
							}
						}
					}
				}
			}
		}
		for(int i=0; i<5; i++){												//counting how many in each suit
			if(hand.get(i).getSuit()==1){
				flushCheckOne++;
			}else if(hand.get(i).getSuit()==2){
				flushCheckTwo++;
			}else if(hand.get(i).getSuit()==3){
				flushCheckThree++;
			}else if(hand.get(i).getSuit()==4){
				flushCheckFour++;
			}
		}
		if(Math.max(Math.max(Math.max(flushCheckOne, flushCheckTwo),flushCheckThree), flushCheckFour)>=5){		//resetting the flushCount
				flushCheck=true;
				flushCheckOne=0;
				flushCheckTwo=0;
				flushCheckThree=0;
				flushCheckFour=0;
		}
	}
}
/*public boolean sortCards(ArrayList<Cards>input){
	int [] straightOrg= new int [5];
	int low=straightOrg[0];
	int high=straightOrg[1];
	int temp;
	for(int i=0; i<5; i++){
		straightOrg[i]=input.get(i).getValue();
	}
	while(low>high){
		if(low==high){
			return false;
		}
			temp=low;
			low=high;
			high=temp;
		i++;
	}
}*/
  static public void main(String[] passedArgs) {
    String[] appletArgs = new String[] { "poker" };
    if (passedArgs != null) {
      PApplet.main(concat(appletArgs, passedArgs));
    } else {
      PApplet.main(appletArgs);
    }
  }
}
