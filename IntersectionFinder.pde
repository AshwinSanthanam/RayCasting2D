class IntersectionFinder
{
  private final LineSegment _ls1, _ls2;
  
  public IntersectionFinder(LineSegment ls1, LineSegment ls2)
  {
    _ls1 = ls1;
    _ls2 = ls2;
  }
  
  private Point GetIntersectionPoint()
  {
    float dell = _ls1.GetA() * _ls2.GetB() - _ls2.GetA() * _ls1.GetB();
    float dellX = _ls1.GetC() * _ls2.GetB() - _ls2.GetC() * _ls1.GetB();
    float dellY = _ls1.GetA() * _ls2.GetC() - _ls2.GetA() * _ls1.GetC();
    
    float x = dellX / dell;
    float y = dellY / dell;
    
    Point intersection = new Point(round(x), round(y));
    if(dell == 0 || !_ls1.IsWithin(intersection) || !_ls2.IsWithin(intersection))
    {
      return null;
    }
    else
    {
      return intersection;
    }
  }
}
