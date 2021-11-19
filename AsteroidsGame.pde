/*TODO:
  add indicater for friction mode (HUD)
*/
Spaceship spaceship = new Spaceship();
Star[] stars = new Star[75];

boolean upPressed, downPressed, leftPressed, rightPressed, blast = false, noGmode = true, hyperspace = false, raise = false, complete = false;

public void setup() {
  size(1000, 600);

  for(int i = 0; i < stars.length; i++) {
    if(i % 3 == 0) stars[i] = new BlueStar();
    else stars[i] = new Star(); }
}

public void draw() {
  background(30, 25, 25);
  
  for(int i = 0; i < stars.length; i++) stars[i].show();
  
  if(hyperspace == true) { //VERY UNOPTIMIZED AND MESSY HYPERSPACE CODE...
    if(spaceship.getOpacity() >= 50 && raise == false) spaceship.lowerOpacity(); //lower opacity
      
    if(spaceship.getOpacity() <= 50) { //hyperspace at low enough opacity
      spaceship.hyperspace();
      raise = true; }
      
    if(raise == true) { //raise opacity
      if(spaceship.getOpacity() >= 300) {
        raise = false;
        complete = true;
      } else spaceship.raiseOpacity();
    }
    
    if(raise == false && complete == true) { //end
      hyperspace = false;
      complete = false; }
  } //end of hyperspace
  
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
  if((key == 'q' || key == 'Q') && noGmode == false) noGmode = true;
  else if ((key == 'q' || key == 'Q') && noGmode == true) noGmode = false;
  if((key == 'e' || key == 'E') && hyperspace == false) hyperspace = true;
}

public void keyReleased() {
  if(keyCode == UP) {
    upPressed = false; 
    blast = false; }
  if(keyCode == DOWN) downPressed = false; 
  if(keyCode == LEFT) leftPressed = false; 
  if(keyCode == RIGHT) rightPressed = false; 
}
