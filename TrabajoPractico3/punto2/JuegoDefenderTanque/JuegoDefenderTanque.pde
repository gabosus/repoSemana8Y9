ArrayList<Muro> muros;
ArrayList<Bala> balas;
Tanque tanque;
GestorMurallas gestorMurallas;
PImage tanqueImagen, muroImagen, balaImagen;
float deltaTime;
int lastTime;

void setup() {
  size(800, 600);
  tanqueImagen = loadImage("tanque.png");
  muroImagen = loadImage("muro.png");
  balaImagen = loadImage("bala.png");

  tanque = new Tanque(new Transform(width / 2, height - 50, 50, 50), tanqueImagen);
  gestorMurallas = new GestorMurallas();
  balas = new ArrayList<Bala>();

  lastTime = millis();
  crearMuros();
}

void draw() {
  background(255);
  deltaTime = (millis() - lastTime) / 1000.0;
  lastTime = millis();
  
  tanque.mostrar();
  tanque.mover(deltaTime);

  for (Bala bala : balas) {
    bala.mover(deltaTime);
    bala.mostrar();
  }

  gestorMurallas.mostrarMuros();
  gestorMurallas.verificarColision(balas);

  eliminarBalasFueraDePantalla();
}

void keyPressed() {
  if (key == ' ') {
    balas.add(tanque.disparar());
  }
}

// Función para crear muros en diferentes posiciones
void crearMuros() {
  for (int i = 0; i < 5; i++) {
    int x = (i * 160) + 50;
    int y = 200;
    gestorMurallas.agregarMuro(new Muro(new Transform(x, y, 50, 50), muroImagen, int(random(10, 31))));
  }
}

// Clase Transform
class Transform {
  float x, y, width, height;

  Transform(float x, float y, float width, float height) {
    this.x = x;
    this.y = y;
    this.width = width;
    this.height = height;
  }
}
