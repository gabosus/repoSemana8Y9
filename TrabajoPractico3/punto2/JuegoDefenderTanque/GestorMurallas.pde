class GestorMurallas {
    ArrayList<Muro> murallas = new ArrayList<Muro>();

    void addMuro(Muro muro) {
        murallas.add(muro);
    }

    void verificarColision(ArrayList<Bala> balas) {
        for (Bala bala : balas) {
            if (!bala.active) continue; 
            for (int j = murallas.size() - 1; j >= 0; j--) {
                Muro muro = murallas.get(j);
                if (bala.transform.x > muro.transform.x && bala.transform.x < muro.transform.x + muro.img.width &&
                    bala.transform.y > muro.transform.y && bala.transform.y < muro.transform.y + muro.img.height) {
                    muro.resistencia -= 10;
                    bala.deactivate(); 
                    if (muro.resistencia <= 0) {
                        murallas.remove(j);
                    }
                    break;
                }
            }
        }
    }
}
