class Slider
{
  float minval,maxval,val;
  int x, y, width;
  boolean active;
  boolean visible;
  String name;
  public Slider(String name, int x, int y, int w)
  {
    this.name = name;
    this.x=x;
    this.y=y;
    this.width=w;
    this.minval=0;
    this.maxval=1;
    this.val=0;
  }
  public Slider(String name, int x, int y, int w, float minval, float maxval)
  {
    this.name = name;
    this.x=x;
    this.y=y;
    this.width=w;
    this.minval=minval;
    this.maxval=maxval;
    this.val=0;
  }
  
  public float getVal()
  {
    return minval+this.val*(maxval-minval);
  }
  
  public void setVal(int x)
  {
    val=(x-this.x)/(float)width;
  }
  public boolean inBounds(int x, int y)
  {
    return x > this.x && x < this.x + this.width && y > this.y && y < this.y + 10*vh;
  }
  public void draw()
  {
    fill(0);
    stroke(255);
    rect(this.x,this.y+4*vh,this.width,2*vh);
    rect(this.x+this.val*this.width-2*vh,this.y,4*vh,10*vh);
  }
}