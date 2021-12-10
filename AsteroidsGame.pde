/*TODO:
  bullets
*/
Spaceship spaceship = new Spaceship();
Star[] stars = new Star[75];
ArrayList <Asteroid> asteroids;

boolean upPressed, downPressed, leftPressed, rightPressed, blast = false, friction = true, hyperspace = false, raise = false, complete = false, endGame = false;

public void setup() {
  size(1000, 600);

  for(int i = 0; i < stars.length; i++) {
    if(i % 3 == 0) stars[i] = new BlueStar();
    else stars[i] = new Star(); }
    
  setAsteroids();
  
}

public void setAsteroids() {  
  asteroids = new ArrayList <Asteroid> (0);
  for(int i = 0; i < 20; i++) {
    asteroids.add(new Asteroid());
  }
}

public void draw() {
  //BACKGROUND
  background(30, 25, 25);
  for(int i = 0; i < stars.length; i++) stars[i].show();
  //END BACKGROUND
  
  //HUD
  textSize(15); //friction
  if(friction == true) text("Friction: on", 25, 25);
  else text("Friction: off", 25, 25);
  
  if(endGame == false) { //health bar
    
    fill(255, 50, 50); //red
    noStroke();
    if(spaceship.getLives() == 3) rect(350, 500, 300, 20);
    else if(spaceship.getLives() == 2) rect(350, 500, 200, 20);
    else if(spaceship.getLives() == 1) rect(350, 500, 100, 20);
    
    noFill(); //white
    stroke(255);
    strokeWeight(3);
    rect(350, 500, 300, 20);
    noStroke();
  }
    
  if(spaceship.getLives() == 0) {
    endGame = true;
    textSize(104);
    text("Wow, you suck!", 110, 200);
    noFill();
    stroke(255);
    strokeWeight(4);
    rect(350, 250, 300, 80);
    strokeWeight(0);
    textSize(48);
    text("Play Again", 380, 305);
    if(mousePressed == true && (mouseX > 350 && mouseX < 650) && (mouseY > 250 && mouseY < 330)) {
      endGame = false;
      spaceship = new Spaceship();
      setAsteroids();
    }
  }
  //END HUD
  
  if(endGame == false) {
    //HYPERSPACE
    if(hyperspace == true) { 
      if(spaceship.getOpacity() >= 50 && raise == false) spaceship.lowerOpacity(); 
      if(spaceship.getOpacity() <= 50) {
        spaceship.hyperspace();
        raise = true; }
      if(raise == true) {
        if(spaceship.getOpacity() >= 300) {
          raise = false;
          complete = true;
        } else spaceship.raiseOpacity();
      }
      if(raise == false && complete == true) { 
        hyperspace = false;
        complete = false; }
    } 
    //END HYPERSPACE
    
    //ASTEROIDS
    for(int i = 0; i < asteroids.size(); i++) {
      asteroids.get(i).show();
      asteroids.get(i).move();
      if(dist((float)spaceship.getX(), (float)spaceship.getY(), (float)asteroids.get(i).getX(), (float)asteroids.get(i).getY()) <= 30) {
        spaceship.lowerVar();
        asteroids.remove(asteroids.get(i)); 
      }
    } 
    //END ASTEROIDS
    
    //SPACESHIP MOVEMENT
    stroke(0);
    spaceship.updateColor();
    spaceship.show(); 
    if(keyPressed == false && friction == true) {
      spaceship.slowSpeed(); }
    if(upPressed == true) {
      spaceship.accelerate(0.25); 
      spaceship.showBlast(); }
    if(downPressed == true) spaceship.accelerate(-0.25); 
    if(leftPressed == true) spaceship.turn(-5);
    if(rightPressed == true) spaceship.turn(5);
    spaceship.move();
  }
  //END SPACESHIP MOVEMENT
}
//END DRAW

public void keyPressed() {
  if(keyCode == UP) upPressed = true;
  if(keyCode == DOWN) downPressed = true; 
  if(keyCode == LEFT) leftPressed = true;
  if(keyCode == RIGHT) rightPressed = true; 
  if((key == 'q' || key == 'Q') && friction == false) friction = true;
  else if ((key == 'q' || key == 'Q') && friction == true) friction = false;
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
