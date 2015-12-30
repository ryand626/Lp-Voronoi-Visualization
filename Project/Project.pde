Slider pAdjuster, rAdjuster;
Graph g;

Frame SliderFrame;
Frame GraphFrame;
Frame PlayFrame;

float timer = 0;

void setup() {
  frame.setResizable(true);
  size(600, 600);

  pAdjuster = new Slider(1, 25, true);
  rAdjuster = new Slider(0, 1, false);
  pAdjuster.value = 2;
  rAdjuster.value = 0;
  g = new Graph();

  SliderFrame = new Frame(width * .9, 0, width * .1, height * .9);
  GraphFrame = new Frame(0, 0, width * .9, height);
  PlayFrame = new Frame(0, height * .9, width * .9, height * .1);
}

void draw() {
  background(60);

  SliderFrame.readjust(width * .9, 0, width * .1, height * .9);
  GraphFrame.readjust(0, 0, width * .9, height * .9);
  PlayFrame.readjust(0, height * .9, width * .9, height * .1);
  
  g.growth_rate = rAdjuster.value;
  g.render(GraphFrame);
  
  pAdjuster.render(SliderFrame);
  rAdjuster.render(PlayFrame);
}

