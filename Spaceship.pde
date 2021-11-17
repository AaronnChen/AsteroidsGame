class Spaceship extends Floater {   
  Spaceship() {
    corners = 4;
    xCorners = new int[]{-8, 16, -8, -2};
    yCorners = new int[]{-8, 0, 8, 0};
    myCenterX = 800.0;
    myCenterY = 400.0;
    myColor = 255;
  }
  
  public void slowXspeed() {
    if(myXspeed >= 0.01) myXspeed *= 0.9;
    else if(myXspeed <= 0.01) myXspeed *= 0.9;
  }
  
  public void slowYspeed() {
    if(myYspeed > 0.01) myYspeed *= 0.9;
    else if(myYspeed < 0.01) myYspeed *= 0.9; 
  }
  
  public void showBlast() {
    noStroke();
    fill(0, 255, 255);
    translate((float)myCenterX, (float)myCenterY);
    float dRadians = (float)(myPointDirection*(Math.PI/180));
    rotate(dRadians + (float)Math.PI / 2.5);
    rect(0, 15, 1, 10); //down (starting pos)
    rotate((float)Math.PI/5.0);
    rect(0, 15, 1, 10); //up (starting pos)
    rotate((float)Math.PI / -10.0);
    rect(0, 15, 1, 10); //middle
    
  }
}
