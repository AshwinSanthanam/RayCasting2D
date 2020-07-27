class Point
{
  private final float _x, _y;
  
  public Point(float x, float y)
  {
    _x = x;
    _y = y;
  }
  
  public float GetX()
  {
    return _x;
  }
  
  public float GetY()
  {
    return _y;
  }
  
  public String toString()
  {
    return "X : " + _x + "; Y : " + _y;
  }
}
