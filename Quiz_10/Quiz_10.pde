Walker[] walkers = new Walker[10];
Liquid ocean = new Liquid(0, -100, Window.right, Window.bottom, 0.1f);
PVector wind = new PVector(0.1, 0);
int posX = 0;

void setup()
{
 size(1280, 720, P3D);
 camera(0, 0, Window.eyeZ, 0, 0, 0, 0, -1, 0);
 spawnWalkers();
}

void draw()
{
  background(255);
  ocean.render();
  
  for(Walker w : walkers)
  { 
    w.applyForce(wind);
    
    PVector gravity = new PVector(0, -0.15 * w.mass);
    w.applyForce(gravity);
    
    float mew = 0.01f;    
    float normal = 1;
    float frictionMagnitude = mew * normal;
    PVector friction = w.velocity.copy();
    w.applyForce(friction.mult(-1).normalize().mult(frictionMagnitude));
    
    w.render();
    w.update();
    
    if(w.position.y <= Window.bottom)
    {
      w.position.y = Window.bottom;
      w.velocity.y *= -1;
    }
    
    if(ocean.isCollidingWith(w))
    {
      PVector dragForce = ocean.calculateDragForce(w);
      w.applyForce(dragForce);
      wind = new PVector(0, 0);
    }
    
    if(w.position.x >= Window.right)
    {
      w.position.x = Window.right;
      w.velocity.x *= -1;
    }

  }
}

void spawnWalkers()
{
  for(int i = 0; i < 10; i++)
  {
   posX = 2 * (Window.windowWidth / 10) * (i - 5);
   walkers[i] = new Walker();
   walkers[i].position = new PVector(posX, 300);
   walkers[i].col = color(random(1, 255), random(1, 255), random(1, 255));
   walkers[i].alpha = random(150, 255);
   walkers[i].mass = 10 - i;
   walkers[i].scale = walkers[i].mass * 10;
  }
}

void mouseClicked()
{
  for(int i = 0; i < 10; i++)
  {
    posX = 2 * (Window.windowWidth / 12) * (i - (walkers.length / 2));
    walkers[i].position = new PVector(posX, 300);
    walkers[i].velocity.mult(0);
    wind = new PVector(0.1, 0);
  }
}
