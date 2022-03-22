Walker[] walkers = new Walker[8];
PVector acceleration = new PVector(0.2, 0);

void setup()
{
 size(1280, 720, P3D);
 camera(0, 0, Window.eyeZ, 0, 0, 0, 0, -1, 0);
 spawnWalkers();
}

void draw()
{
  background(80);
  fill(255, 255, 255);
  rect(0, Window.bottom + 30, 10, 650);
  for(Walker w : walkers)
  { 
    float mew = 0.01f;
    
    if(w.position.x >= 0)
      mew = 0.4f;
    
    float normal = 1;
    float frictionMagnitude = mew * normal;
    PVector friction = w.velocity.copy();
    friction.mult(-1);
    friction.normalize();
    friction.mult(frictionMagnitude);
    w.applyForce(friction);
    
    w.render();
    w.update();
    w.applyForce(acceleration);
    
    if(w.position.x >= Window.right)
    {
      w.position.x = Window.right;
      w.velocity.x *= -1;
    }
    if(w.position.y <= Window.bottom)
    {
      w.position.y = Window.bottom;
      w.velocity.y *= -1;
    }
  }
}

void spawnWalkers()
{
  int posY;
  for(int i = 0; i < 8; i++)
  {
   posY = 2 * (Window.windowHeight / walkers.length) * (i - (walkers.length / 2));
   walkers[i] = new Walker();
   walkers[i].position = new PVector(-550, posY);
   walkers[i].col = color(random(1, 255), random(1, 255), random(1, 255));
   walkers[i].alpha = random(150, 255);
   walkers[i].mass = 10 - i;
   walkers[i].scale = walkers[i].mass * 15;
  }
}

void mouseClicked()
{
  for(Walker w : walkers)
    w.resetPos();
}
