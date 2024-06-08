class GestorMurallas {
  ArrayList<Muro> murallas = new ArrayList<Muro>();
  
  void addMuro(Muro muro) {
    murallas.add(muro);
  }
  
  void verificarColision(ArrayList<Bala> balas) {
    for (int i = balas.size() - 1; i >= 0; i--) {
      Bala bala = balas.get(i);
      for (int j = murallas.size() - 1; j >= 0; j--) {
        Muro muro = murallas.get(j);
        if (bala.transform.x > muro.transform.x && bala.transform.x < muro.transform.x + muro.img.width &&
            bala.transform.y > muro.transform.y && bala.transform.y < muro.transform.y + muro.img.height) {
          muro.resistencia -= 10;
          balas.remove(i);
          if (muro.resistencia <= 0) {
            murallas.remove(j);
          }
          break;
        }
      }
    }
  }
}
