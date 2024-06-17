protected Comida bird;
protected Snake snake;
void setup(){
  size(600,600);
  frameRate(120);
  snake = new Snake(new PVector(width/2,height/2),new PVector(5,5),30);
  bird = new Comida(new PVector(int(random(width)), int(random(height))));
}

void draw(){
  background(#1C7415);
  stroke(255);
  /*for(int i=0; i<width; i+=30){
    line(0,i,width,i);
    line(i,0,i,height);
  }*/
  bird.display();
  snake.display();
  snake.mover();
  snake.grow();
  snake.verificarCollider(bird);
  textSize(30);
  text("Tiempo: "+millis()/1000, 400, 50);
}
