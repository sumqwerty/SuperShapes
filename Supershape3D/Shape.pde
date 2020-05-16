class SuperShape
{
  PVector[][] globe;
  int total;
  float offset;
  float a;
  float b;
  
  float mlat;
  float mlon;
  float r;
  
  float Nlat1;
  float Nlat2;
  float Nlat3;
  
  float Nlon1;
  float Nlon2;
  float Nlon3;
  
  SuperShape()
  {
    total = 200;
    globe = new PVector[total+1][total+1];
    offset = 0;
    a = 1;
    b = 1;
    mlat = 0;
    mlon = 0;
    r = 200;
    Nlat1 = 0.2;
    Nlat2 = 1.7;
    Nlat3 = 1.7;
    
    Nlon1 = 0.2;
    Nlon2 = 1.7;
    Nlon3 = 1.7;
    
  }
  void setMlat(float _mlat)
  {
    mlat =_mlat;
  }
  
  void setNlat1(float _n1)
  {
    Nlat1 =_n1;
  }
  void setNlat2(float _n2)
  {
    Nlat2 =_n2;
  }
  void setNlat3(float _n3)
  {
    Nlat3 =_n3;
  }
  
  
  
  void setMlon(float _mlon)
  {
    mlon =_mlon;
  }
  
  void setNlon1(float _n1)
  {
    Nlon1 =_n1;
  }
  void setNlon2(float _n2)
  {
    Nlon2 =_n2;
  }
  void setNlon3(float _n3)
  {
    Nlon3 =_n3;
  }
  
  
  
  
  float superShape(float theta, float m, float n1, float n2, float n3)
  {
    
    float t1 = abs((1/a)*cos(m*theta/4));
    t1 = pow(t1,n2);
    float t2 = abs((1/b)*sin(m*theta/4));
    t2 = pow(t2,n3);
    float t3 = t1+t2;
    float r = pow(t3, -1/n1); 
    return r;
  }
  
  
  void calc()
  {
    //m = map(mouseX,0,width,0,100);
    for(int i = 0; i<total+1; ++i)
    {
      float lat = map(i,0,total,-HALF_PI,HALF_PI);
      //float r2 = superShape(lat,0,1,1,1);
      float r2 = superShape(lat,mlat,Nlat1,Nlat2,Nlat3);
      //float r2 = superShape(lat,2,10,10,10);
      for(int j = 0; j<total+1; ++j)
      {
        float lon = map(j,0,total,-PI,PI);
        float r1 = superShape(lon,mlon,Nlon1,Nlon2,Nlon3);
        //float r1 = superShape(lon,10,0.04,1.7,1.7);
        //float r1 = superShape(lon,8,60,100,30);
        float x = r * r1 * cos(lon) * r2 * cos(lat);
        float y = r * r1 * sin(lon) * r2 * cos(lat);
        float z = r * r2 * sin(lat);
        globe[i][j] = new PVector(x,y,z); 
      }
    }
  }
  
  void disp()
  {
    fill(200);
    noStroke();
    lights();
    calc();
    offset += 10;
    if(offset >= 500)offset = 0;
    for(int i = 0; i<total; ++i)
    {
      
      float hu = map(i, 0, total, 0,255*6);
      fill((hu+offset)%255,255,255);
      beginShape(TRIANGLE_STRIP);
      for(int j = 0; j<total+1; ++j)
      {
        PVector v1 = globe[i][j];
        PVector v2 = globe[i+1][j];
        vertex(v1.x,v1.y,v1.z);
        vertex(v2.x,v2.y,v2.z);
      }
      endShape();
    }
  }
  
  
  
}
