public abstract class GameObject {
  protected PVector position;
  protected PVector direction;
  protected PVector size;
  protected PImage sprite;

  public GameObject(float x, float y, float size, PImage sprite) {
    this.position = new PVector(x, y);
    this.size = new PVector(size, size);
    this.direction = new PVector(0, 0);
    this.sprite = sprite;
  }

  public void draw() {
    update();
    //imageMode(CENTER);
    image(sprite, position.x - size.x / 2, position.y - size.y / 2, size.x, size.y);
  }
  public void update() {
   
  }
  
   public void setPosition(PVector position){
      this.position = position;
  }  
}
