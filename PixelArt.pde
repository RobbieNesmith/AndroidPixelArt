Canvas img;
float scl;
float vh;
Toolbox tb;
Slider activeSlider;

void settings()
{
  size(540,960);
}

void setup()
{
  vh=height/100;
  tb=new Toolbox();
  scl=1f;
  background(0);
  img=new Canvas(32,32);
  img.pg.beginDraw();
  img.pg.background(200);
  img.pg.ellipse(16,16,16,16);
  img.pg.endDraw();
  img.setScale((float)width/img.pg.width*2);
  img.setOffs(0,0);
  img.draw();
  tb.draw();
}

void draw()
{
  
}
void mousePressed()
{
  activeSlider = null;
  if(mouseY<width)
  {
    img.setActive(true);
  }
  else if(mouseY>90*vh)
  {
    int item=mouseX*tb.numTools()/width;
    tb.select(item);
    tb.draw();
  }
  else
  {
    Tool cur = tb.getSelTool();
    {
      for(Slider s : cur.controlSet)
      {
        if(s.inBounds(mouseX,mouseY))
        {
          activeSlider = s;
          break;
        }
      }
    }
  }
}
void mouseDragged()
{
  if(mouseY<width)
  {
    img.setOffsRel((float)(pmouseX-mouseX)/img.scl,(float)(pmouseY-mouseY)/img.scl);
    img.draw();
  }
  if(activeSlider != null)
  {
    activeSlider.setVal(mouseX);
    if(activeSlider.name.equals("Zoom"))
    {
      img.setScale(activeSlider.getVal()*((float)width/img.pg.width));
      img.draw();
    }
    tb.getSelTool().draw();
  }
}