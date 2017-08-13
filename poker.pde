//POKER
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
				}
				for(int i=0; i<7; i++){
					for(int j=0; j<7; j++){
						for(int k=0; k<7; k++){											
							for(int l=0; l<7; l++){
								if(i!=j&&deck[uniqueArray.get(i)].getValue()==deck[uniqueArray.get(j)].getValue()){		
									if(i!=k&&j!=k&&deck[uniqueArray.get(i)].getValue()==deck[uniqueArray.get(k)].getValue()){			//three of a kind
										money+=0.04*bet;
										if(k!=j&&i!=l&&deck[uniqueArray.get(l)].getValue()==deck[uniqueArray.get(l)].getValue()){		//four of a kind
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
				}
				for(int i=0; i<7; i++){
					if(deck[uniqueArray.get(i)].getSuit()==1){
						flushCheckOne++;
					}else if(deck[uniqueArray.get(i)].getSuit()==2){
						flushCheckTwo++;
					}else if(deck[uniqueArray.get(i)].getSuit()==3){
						flushCheckThree++;
					}else if(deck[uniqueArray.get(i)].getSuit()==1){
						flushCheckFour;
					}
				}
				if(Math.max(flushCheckOne, flushCheckTwo, flushCheckThree, flushCheckFour)>=5){
					money+=12*bet;
					fill(50,50,50);
					textSize(30);
					text("WINNER!" + "\n" + "FLUSH", 380, 350);	//winning message
					text("WINNER!" + "\n" + "FLUSH", 40, 350);
				}
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
			//return Integer.toString(myValue+2);			//FOR Sublime
			return parseInt(myValue+2);				//FOR Javascript
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