public class PlayButton
{
  String text;
  public boolean triggered = false;

  public PlayButton(String _text)
  {
    text = _text;
  }

  void render(Frame f)
  {
    textAlign(CENTER, CENTER);

    stroke(0);
    if (f.IsMouseInside()) {
      fill(100, 100, 100);
      if (mousePressed && !triggered)
      {
        triggered = true;
      }
    } else {
      fill(255);
    }
    rect(f.x, f.y, f.w, f.h);

    fill(0);
    text(text, f.x + f.w / 2, f.y + f.h / 2);
  }
}

