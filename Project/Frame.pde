public class Frame
{
  public float x, y, w, h;
  public Frame(float _x, float _y, float _w, float _h)
  {
    x = _x;
    y = _y;
    w = _w;
    h = _h;
  }

  /* Resets the window coordinates to the new values */
  public void readjust(float _x, float _y, float _w, float _h)
  {
    x = _x;
    y = _y;
    w = _w;
    h = _h;
  }

  /* Returns true if the mouse is within frame, false otherwise */
  public boolean IsMouseInside()
  {
    return (mouseX > x && mouseX < x + w) && (mouseY > y && mouseY < y + h);
  }

  /* Returns true if the mouse is within the radius r of the point p, false otherwise */
  public boolean IsMouseInPoint(PVector p, float r)
  {
    return dist(mouseX, mouseY, x + p.x * w, y + p.y * h) < r;
  }

  public boolean IsMouseInPointLp(PVector point, float r, float p)
  {
    //    println(pow(pow(abs((mouseX - x) / w - point.x), p) + pow(abs((mouseY - y) / h - point.y), p), 1 / p));
    return pow(pow(abs((mouseX - x) / w - point.x), p) + pow(abs((mouseY - y) / h - point.y), p), 1 / p) < r;//dist(mouseX, mouseY, x + p.x * w, y + p.y * h) < r;
  }

  public float LPDistance(PVector p1, PVector p2, float p)
  {
    return pow(pow(abs(p1.x - p2.x), p) + pow(abs(p1.y - p2.y), p), 1 / p);
  }
}

