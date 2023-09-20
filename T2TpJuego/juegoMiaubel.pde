class Juego {

  PImage pantNombre;
  int pantalla = 0;

  Juego() { //Constructor con imagenes
    pantNombre = loadImage ("pantNombre.png");
    mundo.step();
    mundo.draw();
  }

  void funcionar() {
    mundo = new FWorld();
    mundo.setEdges();
    mundo.setGravity(100, 400);

    fondo = loadImage("fondo.png");

    imagenabuela = loadImage("abu.png");
    imagenabuela.resize(300, 150);

    Gatos = new GatosClass();
    Gatos.imgGatos();
    rinoyperros = new Perros();
    rinoyperros.imgPerros();
    gatosList = new ArrayList<FCircle>();
    perrosList = new ArrayList<FCircle>();
    abuela = new AbuelaClass();
    abuela.attachImage(imagenabuela);
    abuela.addToWorld(mundo);
    juegoMiaubel = nego();
    image (fondo, 0, 0);

    //pantallas del juego
    if (pantalla == 0) {
      nombreJuego();
      //poner musica pantalla inicio
    }
    if (pantalla == 1) {
      pantalla = 1;
      jueguito();
    }
  }

  void nombreJuego() {
    image (pantNombre, 0, 0);
  }

  void jueguito() {
    Puntos puntos = new Puntos(35, 25, punto); // Create an instance of the Puntos class
    puntos.dibujar(); // Call the dibujar method to display the points

    Gatos.indxGatos();
    rinoyperros.indxPerros();
  }

  void contactStarted(FContact c) {
    println("VAMOOOS CHOCÓ! " + c.getBody1()+ " con " + c.getBody2() );
    FBody ball = null;
    FBody abuelita = null;

    if (c.getBody1() == abuela.miaubel) {
      abuelita = c.getBody1();
      ball = c.getBody2();
      //println ("abuelita:");
      //println (abuelita);
      //println ("ball:");
      //println (ball);
    } else if (c.getBody2() == abuela.miaubel) {
      abuelita = c.getBody2();
      ball = c.getBody1();
      //println ("abuelita:");
      //println (abuelita);
      //println ("ball:");
      //println (ball);
    }

    if (ball != null) {
      println ("pelota detectada");
      if (ball == Gatos.gatito) {
        punto += 1;
        println ("Se sumó un punto");
      } else if (ball == rinoyperros.perrito) {
        punto -= 1;
        println ("Se restó un punto");
      }

      mundo.remove(ball); // Eliminar el objeto después de procesar la colisión
    }
  }

  void keyPressed() {
    if (key == 'j' || key == 'J' ) {
      pantalla = 1;
    }
  }
}
