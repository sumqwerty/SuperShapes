import controlP5.*;
import peasy.*;

PeasyCam cam;
//Cam cam;
ControlP5 cp5;
SuperShape s;

Accordion accordion;

void setup()
{
  size(1000,700,P3D);
  cp5 = new ControlP5(this);
  cam = new PeasyCam(this, 500);
  //cam = new Cam();
  s = new SuperShape();
  colorMode(HSB);
  setUI();
}

void setUI()
{
  float upLimit;
  float lowLimit;
  upLimit = 5;
  lowLimit = upLimit * (-1);
  cp5.setAutoDraw(false);
  
  Group g1 = cp5.addGroup("G1")
                .setBackgroundColor(color(255, 64))
                .setBackgroundHeight(173)
                ;
         
  Group g2 = cp5.addGroup("G2")
                .setBackgroundColor(color(255, 64))
                .setBackgroundHeight(173)
                ;
                
  
  
  
  cp5.addSlider("M")
     .setId(1)
     .setPosition(0,0)
     .setSize(100,20)
     .setRange(0,20)
     .setValue(0)
     .moveTo(g1)
     .plugTo(this ,"setMlat");
     
  cp5.addSlider("N1")
     .setId(2)
     .setPosition(0,25)
     .setSize(100,20)
     .setRange(lowLimit,upLimit)
     .setValue(0)
     .moveTo(g1)
     .plugTo(this ,"setNlat1");
  
  cp5.addSlider("N2")
     .setId(3)
     .setPosition(0,50)
     .setSize(100,20)
     .setRange(lowLimit,upLimit)
     .setValue(0)
     .moveTo(g1)
     .plugTo(this ,"setNlat2");
  
  cp5.addSlider("N3")
     .setId(4)
     .setPosition(0,75)
     .setSize(100,20)
     .setRange(lowLimit,upLimit)
     .setValue(0)
     .moveTo(g1)
     .plugTo(this ,"setNlat3");
  
  ////////////////////////////////////////////////////
  
  cp5.addSlider("M2")
     .setId(5)
     .setPosition(0,0)
     .setSize(100,20)
     .setRange(0, 25)
     .setValue(0)
     .moveTo(g2)
     .setLabel("M")
     .plugTo(this ,"setMlon");
     
  cp5.addSlider("N12")
     .setId(6)
     .setPosition(0,25)
     .setSize(100,20)
     .setRange(lowLimit,upLimit)
     .setValue(0)
     .moveTo(g2)
     .setLabel("N1")
     .plugTo(this ,"setNlon1");
  
  cp5.addSlider("N22")
     .setId(7)
     .setPosition(0,50)
     .setSize(100,20)
     .setRange(lowLimit,upLimit)
     .setValue(0)
     .moveTo(g2)
     .setLabel("N2")
     .plugTo(this ,"setNlon2");
  
  cp5.addSlider("N32")
     .setId(8)
     .setPosition(0,75)
     .setSize(100,20)
     .setRange(lowLimit,upLimit)
     .setValue(0)
     .moveTo(g2)
     .setLabel("N3")
     .plugTo(this ,"setNlon2");
     
     
  accordion = cp5.addAccordion("acc")
                 .setPosition(0,0)
                 .setWidth(145)
                 .setHeight(50)
                 .addItem(g1)
                 .addItem(g2)
                 ;
                 
  accordion.open(0);
  accordion.open(1);
  accordion.setCollapseMode(Accordion.MULTI);               
}


void setMlat(float theValue)
{
  s.setMlat(theValue);
}

void setNlat1(float theValue)
{
  s.setNlat1(theValue);
}

void setNlat2(float theValue)
{
  s.setNlat2(theValue);
}

void setNlat3(float theValue)
{
  s.setNlat3(theValue);
}



void setMlon(float theValue)
{
  s.setMlon(theValue);
}

void setNlon1(float theValue)
{
  s.setNlon1(theValue);
}

void setNlon2(float theValue)
{
  s.setNlon2(theValue);
}

void setNlon3(float theValue)
{
  s.setNlon3(theValue);
}


void gui()
{
  hint(DISABLE_DEPTH_TEST);
  cam.beginHUD();
  cp5.draw();
  cam.endHUD();
  hint(ENABLE_DEPTH_TEST);
}

void draw()
{
  //cam.runCam();
  background(0); 
  //translate(width/2,height/2);
  s.disp();
  gui();
}
