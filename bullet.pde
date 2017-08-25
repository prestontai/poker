
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
      grower+=0.1;
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


