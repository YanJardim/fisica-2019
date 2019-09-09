Player player;
float startTime = millis();
float deltaTime;

void setup() {
  player = new Player(0, 0, 100, loadImage("player.png"));
  size(600, 600);
}

void draw() {
  deltaTime = (millis() - startTime) / 1000f;
  //println(deltaTime);
  background(20);
  translate(width / 2, height / 2);
  player.draw();
  startTime = millis();
}
