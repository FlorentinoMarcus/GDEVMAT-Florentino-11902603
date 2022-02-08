class Walker
{
  //PVector Position
  PVector position = new PVector();
  //PVector Speed
  PVector speed = new PVector(5, 8);
  //Color
  float r;
  float g;
  float b;
  float a;
  
  void renderWalker()
  {
    circle(position.x, position.y, 50);
  }
  
    void randomWalk()
  {
    // Change Color every frame
    colorChange();
    
    // Random Number Generator
     float rng = random(5);
     
    // Walker Direction Movement
    //Move North
    if(rng >= 0.0 && rng <= 0.5)
    {
      position.add(0,10);
    }
    //Move North East
    else if(rng >= 0.6 && rng <= 1)
    {
      position.add(0,5);
      position.add(5,0);
    }
    //Move East
    else if(rng >= 1.1 && rng <= 1.5 )
    {
      position.add(10,0);
    }
    //Move South East
    else if(rng >= 1.6 && rng <= 2 )
    {
      position.sub(0,5);
      position.add(5,0);
    }
    //Move South
    else if(rng >= 2.1 && rng <= 2.5 )
    {
      position.sub(0, 10);
    }
    //Move South West
    else if(rng >= 2.6 && rng <= 3 )
    {
      position.sub(0,5);
      position.sub(5,0);
    }
    //Move West
    else if(rng >= 3.1 && rng <= 3.5 )
    {
      position.sub(10,0);
    }
    //Move North West
    else if(rng >= 3.6 && rng <= 4 )
    {
      position.add(0,5);
      position.sub(5,0);
    }
  }
  
  
  void randomWalkBiased()
  {
    // Note: x and y values are set to "++" only to clearly see that the movement of 
    // the walker will most likely go right as the program goes on.
    
    // Change Color every frame
    colorChange();
    
    // Random Number Generator
    int rng2 = int(random(4));
    
    //Move North (20%)
    if(rng2 == 0)
    {
      position.add(0,1);
    }
    //Move East (40%)
    else if(rng2 == 1 || rng2 == 2)
    {
      position.add(1,0);
    }
    //Move South (20%)
    else if(rng2 == 3)
    {
      position.sub(0,1);
    }
    //Move West (20%)
    else if(rng2 == 4)
    {
      position.sub(1,0);
    }
  }
  
  void moveAndBounce()
  {
    color circleColor = color(255, 20, 147, 100);
    fill(circleColor);
    stroke(0);
    
    // Add Speed to the current position of the circle
    position.add(speed);
    
    if (( position.x > Window.right) || ( position.x < Window.left))
    {
      speed.x *= -1;
    }
  
    if (( position.y > Window.top) || ( position.y < Window.bottom))
    {
      speed.y *= -1;
    }
  }
  
  void colorChange()
  {
    int red = int(random(256));
    int green = int(random(256));
    int blue = int(random(256));
    int alpha = int(random(50,100));
    
    color circleColor = color(red, green, blue, alpha);
    fill(circleColor);
    stroke(circleColor);
  }
}
