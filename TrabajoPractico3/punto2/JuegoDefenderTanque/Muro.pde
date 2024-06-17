class Muro extends GameObject {
    int resistencia;

    Muro(PImage img, Transform transform, int resistencia) {
        super(img, transform);
        this.resistencia = resistencia;
    }

    void display() {
        image(img, transform.x, transform.y);
    }
}
