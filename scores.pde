//this is for caclulating winning hand and scores
public boolean pairCheck, tripCheck, quadCheck, flushCheck=false;
public int flushCheckOne, flushCheckTwo, flushCheckThree, flushCheckFour;
public int scores=0;
public void scoreEngine(){
	if(scoreStart==true){
		if(quadCheck==true||flushCheck==true||tripCheck==true||pairCheck==true){
			if(quadCheck==true){					//switching winnings over too boolean form
				quadCheck=false;
				scores+=100;
			}else if(flushCheck==true){
				flushCheck=false;
				scores+=10;
			}else if(tripCheck==true){
				tripCheck=false;
				scores+=3;
			}else if(pairCheck==true){
				pairCheck=false;
				scores+=2;
			}
			quadCheck=false;
			tripCheck=false;
			pairCheck=false;
			flushCheck=false;
		}
		for(int i=0; i<5; i++){
			for(int j=0; j<5; j++){
				for(int k=0; k<5; k++){											
					for(int l=0; l<5; l++){
						if(i!=j&&hand.get(i).getValue()==hand.get(j).getValue()){						//two of a kind
							pairCheck=true;	
							if(i!=k&&j!=k&&hand.get(j).getValue()==hand.get(k).getValue()){			//three of a kind
								tripCheck=true;
								if(k!=j&&i!=l&&hand.get(k).getValue()==hand.get(l).getValue()){		//four of a kind
									quadCheck=true;
								}
							}
						}
					}
				}
			}
		}
		for(int i=0; i<5; i++){
			if(hand.get(i).getSuit()==1){
				flushCheckOne++;
			}else if(hand.get(i).getSuit()==2){
				flushCheckTwo++;
			}else if(hand.get(i).getSuit()==3){
				flushCheckThree++;
			}else if(hand.get(i).getSuit()==1){
				flushCheckFour++;
			}
		}
		if(Math.max(Math.max(Math.max(flushCheckOne, flushCheckTwo),flushCheckThree), flushCheckFour)>=5){
			flushCheck=true;
			flushCheckOne=0;
			flushCheckTwo=0;
			flushCheckThree=0;
			flushCheckFour=0;
		}
	}
}