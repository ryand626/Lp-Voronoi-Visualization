public class Graph
{
  public ArrayList<PVector> Points;
  private ArrayList<PVector> ToRemove;

  private ArrayList<Boolean> IsSelected;

  private boolean IsAdditionAllowed = false;

  ArrayList<LPShape> LPShapes;

  float p_norm = 1f;

  float dpi = 300.0;
  float min = 2;
  int smallest_index = -1;
  PVector pixel;


  /* Constructor */
  public Graph()
  {
    Points = new ArrayList<PVector>();
    IsSelected = new ArrayList<Boolean>();
    ToRemove = new ArrayList<PVector>();

    LPShapes = new ArrayList<LPShape>();
  }

  /* Render Function */
  void render(Frame f) 
  {
    /* Update the p_norm according to the slider */
    p_norm = ((pAdjuster.value) * 30f) + 1f;

    /* Update the p_norms of the LP shapes */
    for (LPShape LP : LPShapes)
    {
      LP.p = p_norm;
    }

    /* BRUTE FORCE Pixel-by-Pixel Voronoi Calculation :( */
    for (int i = 0; i < dpi; i++) {  
      for (int j = 0; j < dpi; j++) {
        min = 2;
        smallest_index = -1;
        pixel = new PVector(i / dpi, j / dpi);
        for (int k = 0; k < LPShapes.size (); k++)
        {
          float d = f.LPDistance(pixel, LPShapes.get(k).position, p_norm);
          if (d < min)
          {
            min = d; 
            smallest_index = k;
          }
        }
        stroke(color(0, 0, 255.0 * (smallest_index + 1) / LPShapes.size()));
        fill(color(0, 0, 255.0 * (smallest_index + 1) / LPShapes.size()));
        rect(f.x + pixel.x * f.w, f.y + pixel.y * f.h, f.w / dpi, f.h / dpi);
      }
    }

    /* Render the point handles */
    for (PVector p : Points)
    {
      /* User clicks on point */
      if (mousePressed) {
        if (f.IsMouseInPoint(p, pAdjuster.value * 25))
        {
          /* Remove if it is a right click */
          if (mouseButton == RIGHT)
          {
            ToRemove.add(p);

            /* Select if standard click, don't allow addition of new points */
          } else {
            IsAdditionAllowed = false;
            IsSelected.set(Points.indexOf(p), true);
          }
        }
        /* User is not clicking */
      } else {
        IsSelected.set(Points.indexOf(p), false);
      }

      /* Move point with mouse if the user has selected it */
      if (IsSelected.get(Points.indexOf(p)) == true)
      {
        fill(255, 0, 0);
        p.x = f.x + 1.0 * mouseX / f.w;
        p.y = f.y + 1.0 * mouseY / f.h;
      } else {
        fill(255);
      }

      /* Draw the point in the graph */
      stroke(0);
      ellipse(f.x + p.x * f.w, f.y + p.y * f.h, 20, 20);
    }

    /* Remove deleted points from graph */
    for (PVector p : ToRemove)
    {
      IsSelected.remove(Points.indexOf(p));
      Points.remove(p);
    }
    ToRemove.clear();

    /* Add a single point to graph when mouse is pressed */
    if (mousePressed) {
      if (f.IsMouseInside() && IsAdditionAllowed) {
        Points.add(new PVector(1.0 * mouseX / f.w, 1.0 * mouseY / f.h));
        LPShapes.add(new LPShape(Points.get(Points.size() - 1), p_norm, .1f));
        IsSelected.add(false);
      }
      IsAdditionAllowed = false;
    } else {
      IsAdditionAllowed = true;
    }
  }
}

