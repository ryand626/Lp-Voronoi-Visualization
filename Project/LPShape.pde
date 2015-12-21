public class LPShape
{
  public float radius;
  public PVector position;
  public float p;

  public LPShape(PVector pos, float _p, float r)
  {
    position = pos;
    p = _p;
    radius = r;
    radius = .1f;
  }

  public void render(Frame f, float rad)
  {
    radius = rad;
    float distance;
    ArrayList<PVector> points = new ArrayList<PVector>();
    
    int point_density = 50;

    float rx, ry;
    for (int i = 0; i < 4; i++) {
      for (float angle = i * HALF_PI + (TWO_PI) / point_density; angle <= i * (TWO_PI) / 4 + (HALF_PI); angle += (TWO_PI) / point_density) 
      {
        rx = pow(pow(abs(radius), p) / (1 + pow(abs(tan(angle)), p)), 1f / p);
        ry = rx * tan(angle);

        if (i == 1 || i == 2)
        {
          rx *= -1;
          ry *= -1;
        }
        points.add(new PVector(position.x + rx, position.y + ry));
      }
    }

    for (int i = 0; i < points.size (); i++)
    {
      //stroke(255 * (1.0 * i / points.size()));
      stroke(0);
      line((f.x + points.get(i).x * f.w), 
      (f.y + points.get(i).y * f.h), 
      (f.x + (points.get((i + 1) % points.size ()).x * f.w)), 
      (f.y + (points.get((i + 1) % points.size ()).y * f.h)));
    }

    if (f.IsMouseInPointLp(position, radius, p))
    {
      //println("Inside!");
    } else {
      //println();
    }
  }
}

