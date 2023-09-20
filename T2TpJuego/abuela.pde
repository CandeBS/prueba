class AbuelaClass {
  FBox miaubel;

  AbuelaClass() {
    miaubel = new FBox(300, 150);
    miaubel.setPosition(width/2, height - 40);
    miaubel.setRestitution(0);
    miaubel.setStatic(true);
  }
  
  void attachImage(PImage image) {
    miaubel.attachImage(image);
  }

  void addToWorld(FWorld world) {
    world.add(miaubel);
  }
}
