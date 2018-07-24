/*
  Designed & Progeammed by colorsky
  2018/07/24/9:40
*/
import java.util.*;
Bouncer bouncer;
ArrayList<Ball> balls;
void setup(){
  size(800,600);
  bouncer = new Bouncer(width/2, height*0.8);//initialize bouncer with location indicated
  balls = new ArrayList<Ball>() ;//create a list of balls
  balls.add(new Ball(70));//add a ball with radius of 70
}

void draw(){
  background(255);
  bouncer.run();
  Iterator<Ball> iter = balls.iterator();
  while(iter.hasNext()){
    Ball ball = iter.next();
    ball.run();
    if (ball.loc.y > height + ball.radius)
      iter.remove();
  }
}
void keyPressed(){
  if(keyCode == RIGHT)
    bouncer.applyForce(300);//move right
  if(keyCode == LEFT)
    bouncer.applyForce(-300);//move left
  if(keyCode == UP)
    bouncer.strength += 0.3;
  if(keyCode == DOWN)
    bouncer.strength -= 0.3;
  if(key == ' ')
    balls.add(new Ball(random(30,70)));
} 
