class Bala {
  PImage img;
  Transform transform;
  float velocidad;
  
  Bala(PImage img, Transform transform, float velocidad) {
    this.img = img;
    this.transform = transform;
    this.velocidad = velocidad;
  }
  
  void move() {
    transform.y -= velocidad * deltaTime;
  }
  
  void display() {
    image(img, transform.x, transform.y);
  }
}
