class Bala {
  PImage img;
  Transform transform;
  float velocidad;
  
  Bala(PImage img, Transform transform) {
    this.img = img;
      img.resize(10,20);
    this.transform = transform;
    velocidad = 100;
    
  }
  
  void move() {
    transform.y -= velocidad;
  }
  
  void display() {
    image(img, transform.x, transform.y);
     
  }
}
