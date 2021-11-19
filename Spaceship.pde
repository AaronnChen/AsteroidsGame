class Spaceship extends Floater {   
  protected boolean flicker;
  protected int myOpacity;
  
  Spaceship() {
    corners = 4;
    xCorners = new int[]{-8, 16, -8, -2};
    yCorners = new int[]{-8, 0, 8, 0};
    myCenterX = 500;
    myCenterY = 300;
    flicker = true;
    myOpacity = 300;
    myColor = color(255, 255, 255);
  }
  
  public void slowXspeed() {
    if(myXspeed >= 0.01) myXspeed *= 0.9;
    else if(myXspeed <= 0.01) myXspeed *= 0.9;
  }
  
  public void slowYspeed() {
    if(myYspeed > 0.01) myYspeed *= 0.9;
    else if(myYspeed < 0.01) myYspeed *= 0.9; 
  }
  
  public int getOpacity() {
    return myOpacity;
  }
  
  public void lowerOpacity() {
    myOpacity -= 15;
    myColor = color(255, 255, 255, myOpacity);
  }
  
  public void raiseOpacity() {
    myOpacity += 15;
    myColor = color(255, 255, 255, myOpacity);
  }
  
  public void hyperspace() {
      myCenterX = Math.random() * 1000;
      myCenterY = Math.random() * 600;
  }
  
  public void showBlast() {
    if(flicker == true) flicker = false;
    else {
      noStroke();
      fill(0, 255, 255);
      translate((float)myCenterX, (float)myCenterY);
      float dRadians = (float)(myPointDirection*(Math.PI / 180));
      rotate(dRadians + (float)Math.PI / 2.5);
      rect(0, 15, 1, 10 + (float)(Math.random() * 7) - 5); //down (starting pos)
      rotate((float)Math.PI / 5.0);
      rect(0, 15, 1, 10 + (float)(Math.random() * 7) - 5); //up (starting pos)
      rotate((float)Math.PI / -10.0);
      rect(0, 15, 1, 10 + (float)(Math.random() * 7) - 5); //middle
      
      flicker = true;
    }
    
  }
}
