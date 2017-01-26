Canvas img;
float scl;
float vh;
Toolbox tb;

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
  if(mouseY>90*vh)
  {
    int item=mouseX*tb.numTools()/width;
    tb.select(item);
    tb.draw();
  }
}
void mouseDragged()
{
  if(mouseY<width)
  {
    img.setOffsRel((float)(pmouseX-mouseX)/img.scl,(float)(pmouseY-mouseY)/img.scl);
    img.draw();
  }
}