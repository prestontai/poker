
class Bullet extends Floater{
  private int myBulletX, myBulletY;
  public Bullet(){            
      myBulletX = flyer.getX()+25;     
      myBulletY = flyer.getY()-60;    
      myDirectionY= -3;
    }
    public void move(){
      myBulletY += myDirectionY;
    }
    public void show(){
      fill(255,0,0);
      ellipse(myBulletX, myBulletY, 5, 5);
      ellipse(myBulletX+5, myBulletY, 5, 5);
      ellipse(myBulletX+10, myBulletY, 5, 5);
      ellipse(myBulletX-5, myBulletY, 5, 5);
      ellipse(myBulletX-10, myBulletY, 5, 5);
      ellipse(myBulletX, myBulletY+5, 5, 5);
      ellipse(myBulletX+5, myBulletY+5, 5, 5);
      ellipse(myBulletX+10, myBulletY+5, 5, 5);
      ellipse(myBulletX-5, myBulletY+5, 5, 5);
      ellipse(myBulletX-10, myBulletY+5, 5, 5);
      ellipse(myBulletX, myBulletY+10, 5, 5);
      ellipse(myBulletX+5, myBulletY+10, 5, 5);
      ellipse(myBulletX+10, myBulletY+10, 5, 5);
      ellipse(myBulletX-5, myBulletY+10, 5, 5);
      ellipse(myBulletX-10, myBulletY+10, 5, 5);
    }
    public void setX(int x){myBulletX= x;}; 
    public int getX(){return myBulletX;};
    public void setY(int y){myBulletY= y;};
    public int getY(){return myBulletY;};
    public void setDirectionX(int dirX){myDirectionX = dirX;};
    public int getDirectionX(){return myDirectionX;};
    public void setDirectionY(int dirY){myDirectionY = dirY;};
    public int getDirectionY(){return myDirectionY;};
}


