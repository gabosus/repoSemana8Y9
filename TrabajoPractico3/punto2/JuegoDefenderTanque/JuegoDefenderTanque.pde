Tanque tanque;
GestorMurallas gestorMurallas; 
boolean reposo = true;

void setup() {
    size(1000, 1000);
   
    PImage tanqueImg = loadImage("tanque.png");
    tanqueImg.resize(100, 100);
    tanque = new Tanque(tanqueImg, new Transform(width / 2, 800), 200);

   gestorMurallas = new GestorMurallas();
    PImage muroImg = loadImage("muro.png");
    muroImg.resize(100, 20); 
    for (int i = 0; i < 10; i++) {
        float x = random(0, width - muroImg.width); 
        float y = random(0, height / 4); 
        Muro muro = new Muro(muroImg, new Transform(x, y),30, 50);
        gestorMurallas.addMuro(muro);
    
    }

    frameRate(500);
}

void draw() {
    background(255); 

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

 boolean changeDirection = false;
    for (Muro muro : gestorMurallas.murallas) {
        muro.mover(); // Mover los muros
        if (muro.transform.x < 0 || muro.transform.x + muro.img.width > width) {
            changeDirection = true;
        }
        muro.display();
    }

    if (changeDirection) {
        for (Muro muro : gestorMurallas.murallas) {
            muro.velocidad *= -1; 
            muro.transform.y += 20; 
        }
    }

    fill(0);
    text("Balas: " + tanque.balas.size(), 10, height - 20);
    text("Muros: " + gestorMurallas.murallas.size(), 10, height - 40);
}
