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
public boolean sortCards(ArrayList<Cards>input){
	int [] straightOrg= new int [5];
	int low=straightOrg[0];
	int high=straightOrg[1];
	int temp;
	for(int i=0; i<5; i++){
		straightOrg[i]=input.get(i).getValue();
	}
	while(j<5){
		for(int i=0; i<4; i++){
			if(low>straightOrg[i+1]){
				low=straightOrg[i+1];
			}
		}
		j++;
	}
}