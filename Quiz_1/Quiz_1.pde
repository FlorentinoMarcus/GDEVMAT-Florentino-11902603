// Global Variables
float frequency = 0.3;
float amplitude =  50.0;
float time = 0.0;
float deltaTime = 1.0;

void setup()
{
  size(1280, 720, P3D);
  camera(0, 0, -(height/2.0) / tan(PI*30.0 / 180.0), 0, 0, 0, 0, -1, 0);
}

void draw()
{
  background(0);
  
  drawCartesianPlane();
  
  drawLinearFunction();

  drawQuadraticFunction();
  
  drawSineWave();
}

void drawCartesianPlane()
{
    strokeWeight(1);
  color white = color (255,255,255);
  fill(white);
  stroke(white);
  line(300, 0, -300, 0);
  line(0, -300, 0, 300);
  
  for(int i = -300; i <= 300; i += 10)
  {
    line(i, -2, i, 2);
    line(-2, i, 2, i);
  }
}

void drawLinearFunction()
{
  // f(x) =−5x +30
  color purple = color(127,0,250);
  fill(purple);
  noStroke();
  
  for (int x = -200; x <= 200; x++)
  {
    circle(x , -(x * 5) + 30, 5);
  }
}

void drawQuadraticFunction()
{
  // f(x) = x2−15x−3  
  color yellow = color(255,255,0);
  fill(yellow);
  stroke(yellow);
  
  for (float x = -300; x <= 300; x+= 0.1f)
  {
    circle(x * 10, (float) Math.pow(x, 2) - (15 * x) - 3, 5);
  }
}

void drawSineWave()
{
  // f(x) = Amplitude sin (frequency (x + time)) + position);
  
  keyInput();
  
  color blue = color(0,255,255);
  fill(blue);
  stroke(blue);

  for (float x = -300; x <= 300; x+= 0.1f) 
  {
    circle(x, amplitude * sin((x + time) * frequency) + 0, 5);
  }
  
  time += deltaTime;
}

void keyInput()
{
  if(keyPressed && keyCode == UP)
  {
    amplitude += 10;
  }
    if(keyPressed && keyCode == DOWN)
  {
    amplitude -= 10;
  }
    if(keyPressed && keyCode == LEFT)
  {
    frequency -= 0.1;
  }
    if(keyPressed && keyCode == RIGHT)
  {
    frequency += 0.1;
  }
}
