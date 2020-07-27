ArrayList<LineSegment> obstacles; 
ArrayList<Ray> rays;

void setup()
{
  size(500, 500);  
  GenerateObstacles();
}

void GenerateObstacles()
{
  obstacles = new ArrayList<LineSegment>();
  obstacles.add(new LineSegment(new Point(200, 150), new Point(300, 150)));
  obstacles.add(new LineSegment(new Point(200, 350), new Point(300, 350)));
  obstacles.add(new LineSegment(new Point(150, 200), new Point(150, 300)));
  obstacles.add(new LineSegment(new Point(350, 200), new Point(350, 300)));

  obstacles.add(new LineSegment(new Point(0, 0), new Point(100, 100)));
  obstacles.add(new LineSegment(new Point(0, 500), new Point(100, 400)));
  obstacles.add(new LineSegment(new Point(500, 0), new Point(400, 100)));
  obstacles.add(new LineSegment(new Point(500, 500), new Point(400, 400)));

  obstacles.add(new LineSegment(new Point(200, 200), new Point(300, 200)));
  obstacles.add(new LineSegment(new Point(200, 300), new Point(300, 300)));
  obstacles.add(new LineSegment(new Point(200, 200), new Point(200, 300)));
  obstacles.add(new LineSegment(new Point(300, 200), new Point(300, 300)));

  float r = 100;
  float x = 0;
  float y = 250 - r;
  for (int i = -90; i <= 90; i += 10)
  {
    float current_x = round(r * cos(i * PI / 180));
    float current_y = round(r * sin(i * PI / 180) + 250);
    obstacles.add(new LineSegment(new Point(x, y), new Point(current_x, current_y)));

    x = current_x;
    y = current_y;
  }
  
  x = 500;
  y = 250 - r;
  for (int i = 90; i <= 270; i += 10)
  {
    float current_x = round(r * cos(i * PI / 180) + 500);
    float current_y = round(r * sin(i * PI / 180) + 250);
    obstacles.add(new LineSegment(new Point(x, y), new Point(current_x, current_y)));

    x = current_x;
    y = current_y;
  }
}

void ShowObstacles()
{
  for (LineSegment ls : obstacles)
  {
    ls.Draw();
  }
}

void GenerateRays(Point source)
{
  rays = new ArrayList<Ray>();
  for (int i = 0; i < 360; i += 1)
  {
    rays.add(new Ray(source, i * PI / 180));
  }
}

int MX = 0, MY = 0;

void draw()
{ 
  if (MX != mouseX || MY != mouseY)
  {
    background(0);
    stroke(255, 0, 0);
    fill(255, 0, 0);
    TraceRays(new Point(mouseX, mouseY));
    stroke(255);
    ShowObstacles();
  }
  MX = mouseX;
  MY = mouseY;
}

void TraceRays(Point source)
{
  GenerateRays(source);
  RayTracer tracer = new RayTracer(obstacles, rays);
  ArrayList<Point> terminationPoints = tracer.GetTerminationPoints();

  beginShape();
  for (Point point : terminationPoints)
  {
    //new LineSegment(source, point).Draw();
    vertex(point.GetX(), point.GetY());
  }
  endShape();
}
