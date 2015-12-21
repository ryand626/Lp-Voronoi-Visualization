Slider pAdjuster;
Graph g;
PlayButton playButton;

Frame SliderFrame;
Frame GraphFrame;
Frame PlayFrame;

float timer = 0;

void setup() {
  frame.setResizable(true);
  size(600, 600);

  pAdjuster = new Slider();
  g = new Graph();
  playButton = new PlayButton("Play");

  SliderFrame = new Frame(width * .9, 0, width * .1, height);
  GraphFrame = new Frame(0, 0, width * .9, height);
  PlayFrame = new Frame(0, height * .9, width * .9, height * .1);
}

void draw() {
  background(255);

  SliderFrame.readjust(width * .9, 0, width * .1, height);
  GraphFrame.readjust(0, 0, width * .9, height * .9);
  PlayFrame.readjust(0, height * .9, width * .9, height * .1);

  g.render(GraphFrame);
  if (playButton.triggered)
  {
    timer += .01f;
    for (LPShape LP : g.LPShapes)
    {
      LP.render(GraphFrame, timer);
    }
  }
  pAdjuster.render(SliderFrame);
  playButton.render(PlayFrame);
}

