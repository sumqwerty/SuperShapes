class Cam
{
  float mx;
  float my;
  float staticX;
  float staticY;
  float zoom;
  float zoomspeed;
  float rotationY;
  float rotationX;
  float rotationZ;
  float rotspeed;
  Cam()
  {
    rotspeed = 1;
    zoomspeed = 5;
  }
  
  void runCam()
  {
    
    if(mousePressed && mouseButton == RIGHT)
    {
      mx = mouseX;
      my = mouseY;
      staticX = mx;
      staticY = my;
      camera(mouseX, mouseY, (height/2) / tan(PI/4)+zoom, width/2, height/2, 0, 0, 1, 0);
    }
    
    else
      camera(staticX,staticY,(height/2)/tan(PI/4)+zoom,width/2.0,height/2.0,0,0,1,0);
    
    
    
    
    
    if(keyPressed)
    {
      if(keyCode == UP)rotationX  += rotspeed;
      else if(keyCode == DOWN)rotationX  -= rotspeed;
      else if(keyCode == LEFT)rotationY  += rotspeed;
      else if(keyCode == RIGHT)rotationY  -= rotspeed;
      else if(key == 'm')rotationZ  -= rotspeed;
      else if(key == 'n')rotationZ  += rotspeed;
      else if(key == 'z')zoom-=zoomspeed;
      else if(key == 'x')zoom+=zoomspeed;
      else if(key == 'r')
      {
        rotationY = 0;
        rotationX = 0;
        rotationZ = 0;
      }
    }
    translate(width/2,height/2,0);
    rotateY(radians(rotationY));
    rotateX(radians(rotationX));
    rotateZ(radians(rotationZ));
    translate(-width/2,-height/2,0);
      
  }
}
