class Muro extends GameObject {
    int resistencia;
    float velocidad;
    
    Muro(PImage img, Transform transform, int resistencia, float velocidad) {
        super(img, transform);
        this.resistencia = resistencia;
        this.velocidad = velocidad;
    }

    void mover() {
        transform.x += velocidad * Time.getDeltaTime(frameRate);
    }

    void display() {
        image(img, transform.x, transform.y);
    }
}
