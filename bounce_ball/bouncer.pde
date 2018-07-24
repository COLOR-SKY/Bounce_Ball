class Bouncer{
  PVector loc, v, a; // location, velocity, acceleration
  float maxspeed = 10;
  float left, right;
  float strength = 1.0;
  float h;
  Bouncer(float x, float y){
    loc = new PVector(x, y);
    v = new PVector();
    a = new PVector();
    h = y; //y axis of the rect
  }
  void applyForce(float x){
    a.add(new PVector(x, 0));
  }
  void display(){
    noStroke();
    fill((strength - 1) * 200);
    rect(loc.x,loc.y, width/3, 40);
    fill(255);
    text("left: "+ left , loc.x + 10 , loc.y + 25);
    text("right: " + right, loc.x + width/5 , loc.y + 25);
    fill(0);
    text("strength: " + strength, loc.x + 10, loc.y - 5);
    text("Use LEFT and RIGHT to control the block", 10, height - 40);
    text("Use UP and DOWN to change the block's elasticity", 10, height - 25);
    text("Use SPACE to create a new ball", 10, height - 5);
    
    border();
  }
  void update(){
    v.add(a);
    v.limit(maxspeed);
    loc.add(v);
    a.mult(0.6);
    v.mult(0.85);
    loc.x = int(loc.x);
    if(abs(v.x) < 2) {v.mult(0); a.mult(0);}
    left = loc.x;
    right = loc.x + (width/3);
    
  }
  void border(){
    if(loc.x < 0) {loc.x = 0; v.x = 0;}
    if(loc.x > width - width/3) {loc.x = width - width/3; v.x = 0;}
  }
  void run(){
    update();
    display();
  }
  
}
