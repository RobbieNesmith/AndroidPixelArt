class Toolbox
{
  ArrayList<Tool> tools;
  int sel;
  public Toolbox()
  {
    this.tools=new ArrayList<Tool>();
    this.tools.add(new Tool("Pan"));
    this.tools.get(0).controlSet.add(new Slider("Zoom",0,(int)(70*vh),width,1,8));
    this.tools.add(new Tool("Brush"));
    this.tools.add(new Tool("Erase"));
    this.tools.add(new Tool("Fill"));
    sel=0;
  }
  public Tool getTool(int idx)
  {
    return this.tools.get(idx);
  }
  public Tool getSelTool()
  {
    return this.tools.get(this.sel);
  }
  public int numTools()
  {
    return this.tools.size();
  }
  public void select(int s)
  {
    this.sel=s;
  }
  public void draw()
  {
    textSize(10*vh);
    float vh=height/100f;
    fill(0);
    stroke(255);
    rect(0,80*vh,width,10*vh);
    fill(255);
    text(this.getTool(this.sel).getName(),0,90*vh);
    float tw=(float)width/this.numTools();
    for(int i=0; i<this.numTools();i++)
    {
      if(i==this.sel)
      {
        fill(0,0,255);
      }
      else
      {
        fill(127);
      }
      rect(i*tw,90*vh,tw,10*vh);
      fill(255);
      text(this.getTool(i).getName().substring(0,1),(i+0.5f)*tw,height);
    }
    this.tools.get(this.sel).draw();
  }
}