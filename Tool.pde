class Tool
{
  String name;
  HashMap<String,Slider> controlSet;
  public Tool(String name)
  {
    this.name=name;
    this.controlSet = new HashMap<String,Slider>();
  }
  public String getName()
  {
    return this.name;
  }
  public void draw()
  {
    for(String s: controlSet.keySet())
    {
      controlSet.get(s).draw();
    }
  }
}