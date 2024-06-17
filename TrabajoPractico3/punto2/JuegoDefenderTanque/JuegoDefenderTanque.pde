Tanque tanque;
GestorMurallas gestorMurallas;
float deltaTime, lastTime;
boolean reposo = true;

void setup() {
    size(1000, 1000);
    PImage tanqueImg = loadImage("tanque.png");
    tanqueImg.resize(100, 100);
    tanque = new Tanque(tanqueImg, new Transform(width / 2, 800), 200);

    gestorMurallas = new GestorMurallas();
    PImage muroImg = loadImage("muro.png");
    muroImg.resize(700, 200);
    for (int i = 0; i < 5; i++) {
        Muro muro = new Muro(muroImg, new Transform(300, 100), (int) random(10, 30));
        gestorMurallas.addMuro(muro);
    }

    lastTime = millis();
}

void draw() {
    background(255);

    float currentTime = millis();
    deltaTime = (currentTime - lastTime) / 1000.0;
    lastTime = currentTime;

    if (keyPressed) {
        if (keyCode == LEFT) {
            tanque.move(-1);
        } else if (keyCode == RIGHT) {
            tanque.move(1);
        } else if (key == 'k' && reposo) {
            tanque.shoot();
            reposo = false;
        }
    } else {
        reposo = true; 
    }

    tanque.display();
    for (Bala bala : tanque.balas) {
        bala.move();
        bala.display();
    }

   gestorMurallas.verificarColision(tanque.balas);

    for (Muro muro : gestorMurallas.murallas) {
        muro.display();
    }

    fill(0);
    text("Balas: " + tanque.balas.size(), 10, height - 20);
    text("Muros: " + gestorMurallas.murallas.size(), 10, height - 40);
}
