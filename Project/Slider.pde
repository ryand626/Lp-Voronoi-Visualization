public class Slider
{
  public float value;
  float radius = 25;
  float barWidth = 10;

  boolean IsPositionUpdating = false;

  public Slider()
  {
    /* Arbitrary! Starting in middle */
    value = .5;
  } 

  void render(Frame f)
  {
    radius = f.w/2;
    barWidth = f.w/4;

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
      value = constrain(1.0 * mouseY / height, 0, 1);
    }

    /* Draw the "tray" */
    fill(255);
    stroke(0);
    rect(f.x + radius - barWidth/2, f.y, barWidth, f.h);

    /* Draw the "handle" */
    fill(80, 100, 150);
    ellipse(f.x + radius, f.y + value * f.h, radius * 2, radius * 2);

    /* Reset the fill color */
    fill(255);
  }
}

