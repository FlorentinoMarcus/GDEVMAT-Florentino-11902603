public class Walker
{
  //Perlin Walk
  public float x; 
  public float y; 
  public float tx = 0; 
  public float ty = 10000;
  //Scale
  public float ts = 10;
  //RGB
  public float tr = 0;
  public float tg = 50;
  public float tb = 100;
  
  void render()
  {
    ts += 0.01f;
    circle(x, y, map(noise(ts), 0, 1, 5, 150));
  }
  
  void perlinWalk()
  {
   x = map(noise(tx), 0, 1, -640, 640); 
   y = map(noise(ty), 0, 1, -360, 360);
   
   tx += 0.01f;
   ty += 0.01f;
  }
  
  void colorChange()
  {
    tr += 0.08f;
    tg += 0.08f;
    tb += 0.08f;
    
    float red = map(noise(tr), 0, 1, 0, 255);
    float green = map(noise(tg), 0, 1, 0, 255);
    float blue = map(noise(tb), 0, 1, 0, 255);
    
    color circleColor = color(red, green, blue, 255);
    fill(circleColor);
    noStroke();
  }
}
