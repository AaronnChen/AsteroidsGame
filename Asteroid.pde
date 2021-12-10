class Asteroid extends Floater {
  protected int direction;
  protected double turnSpeed;
  
  Asteroid() {
    corners = 8;
    xCorners = new int[]{-15 + (int)(Math.random() * 10 - 5), -10 + (int)(Math.random() * 10 - 5), 0 + (int)(Math.random() * 10 - 5), 10 + (int)(Math.random() * 10 - 5), 15 + (int)(Math.random() * 10 - 5), 10 + (int)(Math.random() * 10 - 5), 0 + (int)(Math.random() * 10 - 5), -10 + (int)(Math.random() * 10 - 5)};
    yCorners = new int[]{0 + (int)(Math.random() * 10 - 5), -10 + (int)(Math.random() * 10 - 5), -15 + (int)(Math.random() * 10 - 5), -10 + (int)(Math.random() * 10 - 5), 0 + (int)(Math.random() * 10 - 5), 10 + (int)(Math.random() * 10 - 5), 15 + (int)(Math.random() * 10 - 5), 10 + (int)(Math.random() * 10 - 5)};
    myCenterX = Math.random() * 1100.0 - 50.0;
    myCenterY = Math.random() * 650.0 - 25.0;
    myColor = 150;
    myXspeed = Math.random() * 5 - 2.5;
    myYspeed = Math.random() * 5 - 2.5;
    turnSpeed = Math.random() * 20 - 10;
  }
  
  public void move () {          
    myCenterX += myXspeed;    
    myCenterY += myYspeed;       
    if(myCenterX >width) myCenterX = 0;    
    else if (myCenterX<0) myCenterX = width;       
    if(myCenterY >height) myCenterY = 0;    
    else if (myCenterY < 0) myCenterY = height;  
    myPointDirection += turnSpeed;
  }   
  
  public double getX() { return myCenterX; }
  
  public double getY() { return myCenterY; }
}
