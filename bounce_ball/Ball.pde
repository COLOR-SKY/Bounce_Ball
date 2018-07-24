class Ball{
  PVector loc, v, a;//location, velocity, acceleration
  float radius;
  color c;
  boolean bounced = false, boosted = false;
  
  Ball(float r){//initialize Ball class
    radius = r;
    loc = new PVector(random(radius/2, width), -radius);
    v = new PVector(random(3,10), random(3,6));
    a = new PVector(0, 0);// The gravitational constant
    float red = random(0,100);
    float green = random(0,100);
    float blue = random(0,100);
    c = color(red, green, blue);
  }
  void border(){
    if(loc.x < radius/2 || loc.x > width - radius/2)
      a.add( -(v.x * 2), 0);
    if(loc.y < radius/2 && bounced == true)
    {
      a.add(0, -(v.y * 2));
      bounced = false;
    }
    
  }
  void bounce(){
    if(loc.y > bouncer.h - radius/2 && loc.y < bouncer.h + 40 + radius && bounced == false)//When the ball is below & does not pass the bouncer
      if(loc.x > bouncer.left - radius/2 && loc.x < bouncer.right + radius/2){// When the ball hits the top of the bouncer
        if(loc.y < bouncer.h + 5){//condition to bounce up
          if(boosted == false){
             a.add(0, -(v.y * 2) * bouncer.strength);
             boosted = true;
          }
          else a.add(0, -(v.y * 2));
          bounced = true;
        }
        else if((loc.x > bouncer.left - radius/2 && loc.x < bouncer.left - radius/2 + 100) || 
        (loc.x > bouncer.right - radius/2 - 100 && loc.x < bouncer.right + radius/2)){//When the ball hits the side of the bouncer
          a.add(-(v.x * 2), 0);
          bounced = true;
        }
      }
  }
  
  void update(){
    bounce();
    border();
    v.add(a);
    a.mult(0);
    loc.add(v);

  }
  void display(){
    pushMatrix();
    fill(c);
    stroke(0);
    strokeWeight(3);
    ellipseMode(CENTER);
    ellipse(loc.x, loc.y, radius, radius);
    popMatrix();
  }
  
  void run(){
    update();
    display();
  }
  
  
}
