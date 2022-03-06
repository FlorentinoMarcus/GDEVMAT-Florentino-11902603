Walker[] walkers = new Walker[100];
PVector direction = new PVector();
Walker myMouse = new Walker();

void setup()
{
  size(1080, 720, P3D);
  camera(0, 0, Window.eyeZ, 0, 0, 0, 0, -1, 0);
  spawnWalkers();
}

void draw()
{
  background(0);
  
  PVector mouse = mousePos();
  moveWalkers();
  
  for(int i = 0; i < walkers.length; i++)
  {
    walkers[i].update();
    walkers[i].render();
  }
  
  myMouse.setPosition(mouse);
}

void spawnWalkers()
{
  for(int i = 0; i < walkers.length; i++)
  {
    walkers[i] = new Walker();
    walkers[i].acceleration = new PVector(-0.01, 0.1);
    
    float gaussian = randomGaussian();
    float standardDeviation = 360;
    float mean = 0;
    
    walkers[i].position.x = standardDeviation * gaussian + mean;
    walkers[i].position.y = random(-360, 360);
    walkers[i].scale = (25 * randomGaussian() + 10);
  }
}

 PVector mousePos()
{
  float x = mouseX - Window.windowWidth / 2;
  float y = - (mouseY - Window.windowHeight / 2);
  return new PVector(x, y);
}

void moveWalkers()
{
  for(int i = 0; i < walkers.length; i++)
  {
    PVector direction = PVector.sub(myMouse.position, walkers[i].position);
    walkers[i].acceleration = direction.normalize().mult(0.2);
  }
}
