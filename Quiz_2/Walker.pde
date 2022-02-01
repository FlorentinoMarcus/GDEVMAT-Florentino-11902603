class Walker
{
  //Coordinates
  float x;
  float y;
  
  //Color
  float r;
  float g;
  float b;
  float a;
  
  void renderWalker()
  {
    circle(x,y,30);
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
      y += 10;
    }
    //Move North East
    else if(rng >= 0.6 && rng <= 1)
    {
      y += 5;
      x += 5;
    }
    //Move East
    else if(rng >= 1.1 && rng <= 1.5 )
    {
      x += 10;
    }
    //Move South East
    else if(rng >= 1.6 && rng <= 2 )
    {
      y -= 5;
      x += 5;
    }
    //Move South
    else if(rng >= 2.1 && rng <= 2.5 )
    {
      y -= 10;
    }
    //Move South West
    else if(rng >= 2.6 && rng <= 3 )
    {
      y -= 5;
      x -= 5;
    }
    //Move West
    else if(rng >= 3.1 && rng <= 3.5 )
    {
      x -= 10;
    }
    //Move North West
    else if(rng >= 3.6 && rng <= 4 )
    {
      y += 5;
      x -= 5;
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
      y ++;
    }
    //Move East (40%)
    else if(rng2 == 1 || rng2 == 2)
    {
      x ++;
    }
    //Move South (20%)
    else if(rng2 == 3)
    {
      y --;
    }
    //Move West (20%)
    else if(rng2 == 4)
    {
      x --;
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
