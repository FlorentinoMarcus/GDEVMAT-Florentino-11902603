float timer = 0;

Walker blackHole = new Walker();
Walker[] matter = new Walker[100];

void setup()
{
 size(1080, 720, P3D);
 camera(0, 0, Window.eyeZ, 0, 0, 0, 0, -1, 0);
 otherMatter();
 blackHole.randomBlackHolePos();
}

void draw()
{
  background(0);
  
  for(int i = 0; i < matter.length; i++)
  {
    matter[i].renderMatter();
    PVector direction = PVector.sub(blackHole.position , matter[i].position);
    direction.normalize().mult(10);
    matter[i].position.add(direction);
  }
  blackHole.renderBlackHole();
  
  if(timer == 200)
  {
    timer = 0;
    otherMatter();
    blackHole.randomBlackHolePos();
  }
  timer++;
}


void otherMatter()
{
  for(int i = 0; i < matter.length; i++)
  {
    matter[i] = new Walker();
    float gaussian = randomGaussian();
    float standardDeviation = 360;
    float mean = 0;
    
    matter[i].position.x = standardDeviation * gaussian + mean;
    matter[i].position.y = random(-360, 360);
    matter[i].col = color(random(255), random(255), random(255));
    matter[i].scale = (10 * randomGaussian() + 5);
  }
}
