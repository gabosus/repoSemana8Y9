abstract class GameObject {
  PImage img;
  Transform transform;
  
  GameObject(PImage img, Transform transform) {
    this.img = img;
    this.transform = transform;
  }
  
  void display() {
    image(img, transform.x, transform.y);
  }
}
