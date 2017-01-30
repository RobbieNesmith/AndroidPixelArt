class Canvas
{
  PGraphics pg;
  PVector offs;
  float scl;
  boolean active;
  public Canvas(int w, int h)
  {
    this.pg=createGraphics(w,h);
    this.scl=1;
    this.offs=new PVector(0,0);
  }
  public void setScale(float s)
  {
    this.scl=s;
  }
  public void setOffs(float x,float y)
  {
    this.offs=new PVector(constrain(x,0,this.pg.width),constrain(y,0,this.pg.height));
  }
  public void setOffsRel(float x,float y)
  {
    this.setOffs(this.offs.x+x,this.offs.y+y);
  }
  public void setActive(boolean active)
  {
    this.active = active;
  }
  public void draw()
  {
    clip(0,0,width,width);
    pg.loadPixels();
    int stx=(int)this.offs.x;
    int sty=(int)this.offs.y;
    int edx=min((int)(stx+width/this.scl)+2,pg.width);
    int edy=min((int)(sty+width/this.scl)+2,pg.height);
    float offx=this.offs.x-stx;
    float offy=this.offs.y-sty;
    noStroke();
    for(int j=sty;j<edy;j++)
    {
      for(int i=stx;i<edx;i++)
      {
        fill(this.pg.pixels[j*pg.width+i]);
        rect((i-stx-offx)*this.scl,(j-sty-offy)*this.scl,(int)this.scl+1,(int)this.scl+1);
      }
    }
    noClip();
  }
}