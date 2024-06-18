class Tanque extends GameObject {
    ArrayList<Bala> balas = new ArrayList<Bala>();
    float velocidad;

    Tanque(PImage img, Transform transform, float velocidad) {
        super(img, transform);
        this.velocidad = velocidad;
    }

    void move(float dir) {
      
        transform.x += dir * velocidad * Time.getDeltaTime(frameRate);
    }

    void shoot() {
        PImage balaImg = loadImage("bala.png");
        Bala bala = new Bala(balaImg, new Transform(transform.x + img.width / 2, transform.y));
        balas.add(bala);
    }

    void display() {
        image(img, transform.x, transform.y);
    }
}
