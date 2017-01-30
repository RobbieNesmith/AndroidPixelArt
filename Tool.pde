class Tool
{
  String name;
  ArrayList<Slider> controlSet;
  public Tool(String name)
  {
    this.name=name;
    this.controlSet = new ArrayList<Slider>();
  }
  public String getName()
  {
    return this.name;
  }
  public Slider get(int i)
  {
    return this.controlSet.get(i);
  }
  public void draw()
  {
    fill(0);
    noStroke();
    int h =(int) (90*vh - width);
    rect(0,width,width,h);
    for(Slider s: this.controlSet)
    {
      s.draw();
    }
  }
}