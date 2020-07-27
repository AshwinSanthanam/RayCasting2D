class Ray
{
  private final LineSegment _ls;
  
  public Ray(Point source, float angle)
  {
    _ls = ConvertToLineSegment(source, angle);
  }
  
  private LineSegment ConvertToLineSegment(Point source, float angle)
  {
    float radius = max(width, height) * 1.5;
    float x = source.GetX() + radius * cos(angle);
    float y = source.GetY() + radius * sin(angle);
    
    return new LineSegment(source, new Point(x, y));
  }
  
  public LineSegment GetLineSegment()
  {
    return _ls;
  }
  
  public void Draw()
  {
    _ls.Draw();
  }
}
