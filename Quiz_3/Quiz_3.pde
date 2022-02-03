float timer = 300; 
  
void setup()
{
  background(255);
  size(1280, 720, P3D);
  camera(0, 0, -(height/2.0) / tan(PI*30.0 / 180.0), 0, 0, 0, 0, -1, 0);
}

void draw()
{
  float gaussian = randomGaussian();
  float standardDeviation = 150;
  float mean = 0;
  
  float x = standardDeviation * gaussian + mean;
  float y = random(-360, 360);
  colorChange();
  circle(x, y, (50 * randomGaussian() + 5));
  timer--;
  clearScreen();
}

void colorChange()
{
  int red = int(random(256));
  int green = int(random(256));
  int blue = int(random(256));
  int alpha = int(random(50,100));
    
  color circleColor = color(red, green, blue, alpha);
  fill(circleColor);
  noStroke();
}

void clearScreen()
{
  if(timer <= 0)
  {
    background(255);
    timer = 300; 
  }
}
