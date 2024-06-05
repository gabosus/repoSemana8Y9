class Snake extends GameObject {
  private PVector velocidad;
  private ArrayList<PVector> cuerpoSnake = new ArrayList<PVector>();
  private int lado;

  public Snake(PVector posicion, PVector velocidad, int lado) {
    super(posicion);
    this.velocidad=velocidad;
    cuerpoSnake.add(new PVector(this.posicion.x, this.posicion.y));
    this.lado=lado;
  }

  void display() {
    fill(#9B191B);
    noStroke();
    rectMode(CENTER);

    for (PVector c : cuerpoSnake) {
      rect(c.x+lado/2, c.y+lado/2, lado, lado);
    }
  }

  public void mover() {
    if (key == 'w' || keyCode == UP) {
      this.posicion.y -= this.velocidad.y*lado*Time.getDeltaTime(frameRate);
    } else if (key == 's' || keyCode == DOWN) {
      this.posicion.y += this.velocidad.y*lado*Time.getDeltaTime(frameRate);
    } else if (key == 'a' || keyCode == LEFT) {
      this.posicion.x -= this.velocidad.x*lado*Time.getDeltaTime(frameRate);
    } else if (key == 'd' || keyCode == RIGHT) {
      this.posicion.x += this.velocidad.x*lado*Time.getDeltaTime(frameRate);
    }
    cuerpoSnake.add(new PVector(this.posicion.x, this.posicion.y));
    cuerpoSnake.remove(0);
  }
}
