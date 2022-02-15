void setup()
{
 size(1080, 720, P3D);
 camera(0, 0, Window.eyeZ, 0, 0, 0, 0, -1, 0);
  
}

PVector mousePos()
{
  float x = mouseX - Window.windowWidth / 2 ;
  float y = -(mouseY - Window.windowHeight / 2);
  return new PVector(x, y);
}

void draw(){
  
   background(130);
  
   PVector mouse = mousePos();
   
   //Length of both Inner and Outer glow
   mouse.normalize().mult(300); 
   
   // RED OUTER GLOW (High thickness)
   strokeWeight(20);
   stroke(255, 0, 0);
   line(0, 0, mouse.x, mouse.y);
   line(0, 0, -mouse.x, -mouse.y);
   
   // WHITE INNER GLOW (Low thickness)
   strokeWeight(5);
   stroke(255);
   line(0, 0, mouse.x, mouse.y);
   line(0, 0, -mouse.x, -mouse.y);
   
   //Length of Handle
   mouse.normalize().mult(50);
   
   // BLACK HANDLE (Mid thickness)
   strokeWeight(10);
   stroke(0);
   line(0, 0, mouse.x, mouse.y);
   line(0, 0, -mouse.x, -mouse.y);
   
}
