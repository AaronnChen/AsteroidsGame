Spaceship spaceship = new Spaceship();
Star[] stars = new Star[75];

boolean upPressed, downPressed, leftPressed, rightPressed, blast = false;
boolean noGmode = true;

public void setup() {
  size(1000, 600);
  
  for(int i = 0; i < stars.length; i++) {
    if(i % 3 == 0) stars[i] = new BlueStar();
    else stars[i] = new Star();
  }
}
public void draw() {
  background(30, 25, 25);
  
  for(int i = 0; i < stars.length; i++) stars[i].show();
  
  spaceship.show(); //spaceship movement
  if(keyPressed == false && noGmode == true) {
    spaceship.slowXspeed();
    spaceship.slowYspeed(); }
  if(upPressed == true) {
    spaceship.accelerate(0.25); 
    spaceship.showBlast(); }
  if(downPressed == true) spaceship.accelerate(-0.25); 
  if(leftPressed == true) spaceship.turn(-5);
  if(rightPressed == true) spaceship.turn(5);
  spaceship.move(); //end spaceship movement
   
}

public void keyPressed() {
  if(keyCode == UP) upPressed = true;
  if(keyCode == DOWN) downPressed = true; 
  if(keyCode == LEFT) leftPressed = true;
  if(keyCode == RIGHT) rightPressed = true; 
  if(key == 'q' && noGmode == false) noGmode = true;
  else if (key == 'q' && noGmode == true) noGmode = false;
}

public void keyReleased() {
  if(keyCode == UP) {
    upPressed = false; 
    blast = false;
  }
  if(keyCode == DOWN) downPressed = false; 
  if(keyCode == LEFT) leftPressed = false; 
  if(keyCode == RIGHT) rightPressed = false; 
}
