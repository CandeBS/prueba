class GatosClass {
  PImage[] gatos = new PImage[7];
  FCircle gatito;

  void imgGatos() {
    for (int i = 0; i < gatos.length; i++) {
      PImage dibujosGatos = loadImage("gato" + i + ".png");
      dibujosGatos.resize(150, 150);
      gatos[i] = dibujosGatos;
    }
  }

  void indxGatos() {
    // Gatitos cayendo
    if (frameCount % 60 == 0) {
      gatito = new FCircle(50); // hitbox
      gatito.setPosition(random(0 + 10, width - 10), 2); // De donde salen los gatos
      gatito.setVelocity(0, 200); //Velocidad de gatitos
      gatito.setRestitution(1.5);
      gatito.setNoStroke();
      mundo.add(gatito);
      
      int index = int(random(gatos.length)); // Elige imagen random
      gatito.attachImage(gatos[index]);
    }
  }
}
