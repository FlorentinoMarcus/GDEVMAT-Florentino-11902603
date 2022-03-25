Walker[] walkers = new Walker[10];

void setup()
{
 size(1280, 720, P3D);
 camera(0, 0, Window.eyeZ, 0, 0, 0, 0, -1, 0);
 spawnWalkers();
}

void draw()
{
  background(0);

  for(int i = 0; i <  walkers.length; i++)
  { 
    for(int j = 0; j < walkers.length; j++)
    {
       if (walkers[i] != walkers[j])
       {
         walkers[i].applyForce(walkers[j].calculateAttraction(walkers[i]));
         walkers[j].applyForce(walkers[i].calculateAttraction(walkers[j]));
       }
    }
  }

  
  for(Walker w : walkers)
  {
    w.render();
    w.update();
  }  
}

void spawnWalkers()
{
  for(int i = 0; i < 10; i++)
  {
   walkers[i] = new Walker();
   walkers[i].position = new PVector(random(-500, 500), random(-300, 300));
   walkers[i].col = color(random(1, 255), random(1, 255), random(1, 255));
   walkers[i].alpha = random(150, 255);
   walkers[i].mass = random(5 , 10);
   walkers[i].scale = walkers[i].mass * 10;
  }
}
