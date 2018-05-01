// Ejemplo: Avanzar
//
// Los protocolos se usan para modelar capacidades sobre diferentes tipos de objetos.
// En este caso, vamos a modelar vehículos en un juego, con motor y sin motor. Vamos a hacer que avancen.
// Vamos a tener al menos una clase Coche y una clase Bicicleta. Ambos pueden avanzar, pero para ello en cada vehículo se requieren cosas distintas y van a provocar reacciones distintas.
// En el protocolo vamos a definir una función para avanzar un número determinado de metros. Cada clase va a implementar el protocolo.
// En un vehículo se aprieta el acelerador y se consume gasolina, y en una bicicleta se necesita pedalear y se produce cansancio.

class Bicicleta {
  // ...
  var cansancio: Int = 0
  
  init(cansancio: Int) {
    self.cansancio = cansancio
  }
  
  func pedalear(veces: Int) {
    print("Mira como pedaleo")
  }
}

class Coche {
  var gasolina: Int = 50 
  
  init(gasolina: Int) {
    self.gasolina = gasolina
  }
}

protocol VehiculoQuePuedeAvanzar {
  func avanzar(metros: Int)
}

extension Bicicleta: VehiculoQuePuedeAvanzar {
  public func avanzar(metros: Int) {
    pedalear(veces: metros * 2)
    cansancio += 1
  }
}

extension Coche: VehiculoQuePuedeAvanzar {
  public func avanzar(metros: Int) {
    gasolina -= metros / 100000
    print("Mira como acelero")
  }
}

let bici = Bicicleta(cansancio: 0)
let coche = Coche(gasolina: 50)

bici.avanzar(metros: 10)
coche.avanzar(metros: 10)

let vehiculos: [VehiculoQuePuedeAvanzar] = [bici, coche]
for vehiculo in vehiculos {
  vehiculo.avanzar(metros: 10)
}











