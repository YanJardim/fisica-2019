public class Player extends GameObject {

  private PVector destination;
  private final float speed = 5;
  private final float travelTime = 0.5;
  private float velocity = 0;
  private float currentTime = 0;
  private boolean inPlace = true;
  public Player(float x, float y, float size, PImage sprite) {
    super(x, y, size, sprite);
    destination = position.copy();
  }
  @Override
    public void update() {
    super.update();
    move();
    handleMousePress();
    //handleRotation();
  }

  public void move() {
    float dist = dist(position.x, position.y, destination.x, destination.y);
    if (dist > 10) {
      position.add(PVector.sub(destination, position).normalize().mult(velocity * deltaTime));
    } else {
      if (!inPlace) {
        println((millis() - currentTime) / 1000);
        inPlace = true;
      }
    }
  }
  public void handleRotation() {
    float angle = atan2((direction.y) - position.y, (direction.x) - position.x);
    rotate(angle - radians(90));
  }
  public void handleMousePress() {
    if (mousePressed) {
      inPlace = false;
      currentTime = millis();
      velocity = (PVector.sub(destination, position).mag() / travelTime); 
      direction.set(new PVector(mouseX + (width / 2) + position.x, mouseY + (height / 2) + position.x).normalize());
      setDestination(new PVector(mouseX - width / 2, mouseY - height / 2));
    }
  }

  public void setDestination(PVector destination) {
    this.destination = destination;
  }
}
