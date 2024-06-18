class Bala {
    PImage img;
    Transform transform;
    float velocidad;
    boolean active;

    Bala(PImage img, Transform transform) {
        this.img = img;
        img.resize(10, 20);
        this.transform = transform;
        this.velocidad = 200;
        this.active = true;
    }

    void move() {
        if (active) {
            transform.y -= velocidad * Time.getDeltaTime(frameRate); 
        }
    }

    void display() {
        if (active) {
            image(img, transform.x, transform.y);
        }
    }

    void deactivate() {
        this.active = false;
    }
}
