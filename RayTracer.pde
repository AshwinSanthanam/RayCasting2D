class RayTracer
{
  private final ArrayList<LineSegment> _obstacles;
  private final ArrayList<Ray> _rays;
  
  public RayTracer(ArrayList<LineSegment> obstacles, ArrayList<Ray> rays)
  {
    _obstacles = obstacles;
    _rays = rays;
  }
  
  public ArrayList<Point> GetTerminationPoints()
  {
    ArrayList<Point> terminationPoints = new ArrayList<Point>();
    
    for(Ray ray : _rays)
    {
      println(ray.GetLineSegment());
      ArrayList<Point> possiblePoints = new ArrayList<Point>(); 
      for(LineSegment obstacle : _obstacles)
      {
        IntersectionFinder intersectionFinder = new IntersectionFinder(ray.GetLineSegment(), obstacle);
        Point point = intersectionFinder.GetIntersectionPoint();       
        if(point == null)
        {
          point = ray.GetLineSegment().GetPoint2();
        }
        possiblePoints.add(point);
      }
      
      Point terminationPoint = GetNearestPoint(possiblePoints, ray.GetLineSegment().GetPoint1());
      println(terminationPoint);
      println();
      terminationPoints.add(terminationPoint);
    }
    return terminationPoints;
  }
  
  private Point GetNearestPoint(ArrayList<Point> possiblePoints, Point source)
  {
    Point closestPoint = possiblePoints.get(0);
    float minDistance = GetDistance(closestPoint, source);
    
    for(Point point : possiblePoints)
    {
      float currentDistance = GetDistance(point, source);
      if(minDistance > currentDistance)
      {
        minDistance = currentDistance;
        closestPoint = point;
      }
    }
    
    return closestPoint;
  }
  
  private float GetDistance(Point point, Point source)
  {
    return (point.GetX() - source.GetX()) * (point.GetX() - source.GetX()) + (point.GetY() - source.GetY()) * (point.GetY() - source.GetY());
  }
  
}
