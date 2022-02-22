public class Walker{
  
public PVector position = new PVector();
public float scale;
color col;
color white = color(255,255,255);
public Walker(){}
 
float randomX, randomY;

public void renderBlackHole()
{ 
  position.x = randomX;
  position.y = randomY;
  color(white);
  fill(white);
  circle(position.x, position.y, 50);
  noStroke();
}

public void renderMatter()
{
  fill(col);
  circle(position.x, position.y, scale);
}

public void randomBlackHolePos()
{
  randomX = random(-(Window.windowWidth / 2), Window.windowWidth /2);
  randomY = random(-(Window.windowHeight / 2), Window.windowHeight / 2);
}
}
