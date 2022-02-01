void setup()
{
  size(1280, 720, P3D);
  camera(0, 0, -(height/2.0) / tan(PI*30.0 / 180.0), 0, 0, 0, 0, -1, 0);
}

// Walkers
Walker equalWalker = new Walker();
Walker biasedWalker = new Walker();

void draw()
{
  //background(0);

  // Walker With 8 Different directions but EQUAL probability
  equalWalker.randomWalk();
  equalWalker.renderWalker();
  
  // Walker with 4 Different directions but wth BIASED probability
  biasedWalker.randomWalkBiased();
  biasedWalker.renderWalker();
}
