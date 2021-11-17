class Star {
  protected float myX, myY, mySize;
  protected color myColor;
  
  Star() {
    myX = (float)(Math.random() * width);
    myY = (float)(Math.random() * height);
    mySize = (float)(Math.random() * 7);
    myColor = color(255);
  }
  
  public void show() {
    noStroke();
    fill(myColor);
    ellipse(myX, myY, mySize, mySize);
  }
}

class BlueStar extends Star {
  BlueStar() {
    myX = (float)(Math.random() * 1600);
    myY = (float)(Math.random() * 800);
    mySize = (float)(Math.random() * 7);
    myColor = color(0, 255, 255);
  }
}
