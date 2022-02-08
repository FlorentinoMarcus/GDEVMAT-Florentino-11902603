void setup()
{
  size(1280, 720, P3D);
  camera(0, 0, Window.eyeZ, 0, 0, 0, 0, -1, 0);
}

// Walkers
Walker equalWalker = new Walker();
Walker biasedWalker = new Walker();
Walker bounceWalker = new Walker();

void draw()
{
  // Flush the screen with white background
  background(255);
   
//=================================================================
  // Walker With 8 Different directions but EQUAL probability
  equalWalker.randomWalk();
  equalWalker.renderWalker();
  
  // Walker with 4 Different directions but wth BIASED probability
  biasedWalker.randomWalkBiased();
  biasedWalker.renderWalker();
  
//=================================================================
  // Conditions for bouncing
  bounceWalker.moveAndBounce();
  bounceWalker.renderWalker();
}
