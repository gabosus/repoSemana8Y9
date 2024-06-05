class Comida extends GameObject{
  private PImage imagen;
  private int tamanio;
  
  public Comida(PVector posicion){
    super(posicion);
    this.tamanio=40;
    this.imagen=loadImage("bird.png");
    
  }
  
  public void display(){
    image(imagen, this.posicion.x+tamanio/2, this.posicion.y+tamanio/2, tamanio, tamanio);
  }
}
