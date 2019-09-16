public class Player extends GameObject {

  private PVector destination;
  private final float speed = 5;
  private final float travelTime = 0.5;
  private float velocity = 0;
  private float angle = 0;
  private float currentTime = 0;
  private boolean inPlace = true;
  private boolean canRotate = false;
  private float rotTimer = 0;
  private float currentAngle = 0;
  private final float totalRotationTime = 0.12;
  public Player(float x, float y, float size, PImage sprite) {
    super(x, y, size, sprite);
    destination = position.copy();
  }

  @Override
    public void draw() {
    update();
    translate(position.x, position.y);
    handleRotation();
    imageMode(CENTER);
    image(sprite, 0, 0, size.x, size.y);
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
    if (dist > 10 && !inPlace) {
      position.add(PVector.sub(destination, position).normalize().mult(velocity * deltaTime));
    } else {
      if (!inPlace) {
        //println((millis() - currentTime) / 1000);
        inPlace = true;
      }
    }
  }
  public void handleRotation() {
    rotate((currentAngle - radians(270)));
    if (canRotate && inPlace) {
      float timer =(millis() - currentTime) / 1000;
      float increment = deltaTime / (totalRotationTime - timer);
      println("Increment: ", increment);
      currentAngle = lerp(currentAngle, angle, increment);
      
      if (currentAngle + radians(10) >= angle && currentAngle - radians(10) <= angle && inPlace && canRotate) {
        //println(currentAngle, angle);
        println("Elapsed: ", timer);
        //println("Igual");
        canRotate = false;
        inPlace = false;
      }
    }
  }
  public void handleMousePress() {
    if (mousePressed) {
      //inPlace = false;
      canRotate = true;
      currentTime = millis();
      velocity = (PVector.sub(destination, position).mag() / travelTime); 
      direction.set(new PVector(mouseX + (width / 2) + position.x, mouseY + (height / 2) + position.x).normalize());
      setDestination(new PVector(mouseX - width / 2, mouseY - height / 2));
      angle = atan2((destination.y) - position.y, (destination.x) - position.x);
    }
  }

  public void setDestination(PVector destination) {
    this.destination = destination;
  }
}
