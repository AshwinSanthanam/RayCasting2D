class LineSegment
{
  private final Point _p, _q;
  
  public LineSegment(Point p, Point q)
  {
    _p = p;
    _q = q;
  }
  
  public void Draw()
  {
    line(_p.GetX(), _p.GetY(), _q.GetX(), _q.GetY());
  }
  
  public float Slope()
  {
    return (_p.GetY() - _q.GetY()) / (_p.GetX() - _q.GetX());
  }
  
  public Point GetPoint1()
  {
    return _p;
  }

  public Point GetPoint2()
  {
    return _q;
  }
  
  public boolean IsWithin(Point point)
  {
    return isWithinX(point) && isWithinY(point);
  }
  
  private boolean isWithinX(Point point)
  {
    float x1 = max(_p.GetX(), _q.GetX());
    float x2 = min(_p.GetX(), _q.GetX());
    float x = point.GetX();
    return (x1 == x2) || (x <= x1 && x >= x2);
  }
  
  private boolean isWithinY(Point point)
  {
    float y1 = max(_p.GetY(), _q.GetY());
    float y2 = min(_p.GetY(), _q.GetY());
    float y = point.GetY();    
    return (y1 == y2) || (y <= y1 && y >= y2);
  }
  
  public String toString()
  {
    return "P : " + _p + "\nQ : " + _q;
  }
  
  // for solving linear equation
  // Ax + By = C
  public float GetA()
  {
    return _q.GetY() - _p.GetY();
  }
  
  public float GetB()
  {
    return _p.GetX() - _q.GetX();
  }
  
  public float GetC()
  {
    float x1 = _p.GetX();
    float x2 = _q.GetX();
    float y1 = _p.GetY();
    float y2 = _q.GetY();
    
    return x1 * (y2 - y1) - y1 * (x2 - x1);
  }
}
