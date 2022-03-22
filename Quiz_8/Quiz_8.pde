Walker[] walkers = new Walker[10];
PVector wind = new PVector(0.15, 0);
PVector gravity = new PVector(0, -0.4);
//Walker walker = new Walker();

void setup()
{
 size(1280, 720, P3D);
 camera(0, 0, Window.eyeZ, 0, 0, 0, 0, -1, 0);
 spawnWalkers();
}

void draw()
{
  background(80);
  
  for(int i = 0; i < walkers.length; i++)
  {
    walkers[i].update();
    walkers[i].render();
    walkers[i].applyForce(wind);
    walkers[i].applyForce(gravity);
  }
  
  borderCheck();
}

void spawnWalkers()
{
  for(int i = 0; i < walkers.length; i++)
  {
    walkers[i] = new Walker();
    //walkers[i].acceleration = new PVector(-0.01, 0.1);
    
    walkers[i].position.x = -500;
    walkers[i].position.y = 200;
    walkers[i].mass = 10 - i;
    walkers[i].scale = walkers[i].mass * 15;
    walkers[i].col = color(random(1, 255), random(1, 255), random(1, 255));
    walkers[i].alpha = random(150, 255);
  }
}

void borderCheck()
{
  for(int i = 0; i < walkers.length; i++)
  {   
    if(walkers[i].position.x >= Window.right)
    {
      walkers[i].velocity.x *= -1;
    }
    if(walkers[i].position.y <= Window.bottom)
    {
      walkers[i].velocity.y *= -1;
    }
  }
}
