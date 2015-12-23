public class Slider
{
  public float value;
  float max_value;
  float min_value;
  float radius = 25;
  float barWidth = 10;

  boolean IsPositionUpdating = false;

  boolean IsVertical;

  public Slider(float min, float max, boolean isVertical)
  {
    /* Arbitrary! Starting in middle */
    IsVertical = isVertical;
    max_value = max;
    min_value = min;
    value = (max + min) / 2;
  } 

  void render(Frame f)
  {
    fill(30);
    rect(f.x, f.y, f.w, f.h);

    if (IsVertical)
    {
      radius = f.w/2;
      barWidth = f.w/4;
    } else {
      radius = f.h / 2; 
      barWidth = f.h/4;
    }


    /* Update Position when user moves slider */
    if (mousePressed)
    {
      if (mouseY > f.y && mouseY < f.y + f.h)
      {
        if (mouseX > f.x && mouseX < f.x + f.w)
        {
          IsPositionUpdating = true;
        }
      }
    } else {
      IsPositionUpdating = false;
    }

    if (IsPositionUpdating == true) {
      if (IsVertical)
      {
        value = constrain((max_value - min_value) * (mouseY - f.y) / f.h, min_value, max_value);
      } else {
        value = constrain((max_value - min_value) * (mouseX - f.x) / f.w, min_value, max_value);
      }
    }

    /* Draw the "tray" */
    fill(175);
    noStroke();
    if (IsVertical) 
    {
      rect(f.x + radius - barWidth/2, f.y, barWidth, f.h);
    } else {
      rect(f.x, f.y + radius - barWidth/2, f.w, barWidth);
    }

    /* Draw the "handle" */
    fill(80, 100, 150);
    noStroke();

    if (IsVertical)
    {
      ellipse(f.x + radius, f.y + ((value - min_value) / (max_value - min_value)) * f.h, radius * 2 - 2, radius * 2 - 2);
    } else {
      ellipse(f.x + ((value - min_value) / (max_value - min_value)) * f.w, f.y + radius, radius * 2 - 2, radius * 2 - 2);
    }

    fill (255);
    textAlign(CENTER,CENTER);
    if (IsVertical) {
      text(value, f.x + radius, f.y + ((value - min_value) / (max_value - min_value)) * f.h);
    } else {
      text(value, f.x + ((value - min_value) / (max_value - min_value)) * f.w, f.y + radius);
    }
    /* Reset the fill color */
    fill(255);
  }
}

