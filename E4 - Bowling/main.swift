// Ejercicio: Bowling
//
// En este caso vamos a implementar un marcador de una partida de bolos. Hay que pensar cómo modelar todos los puntos y actores, como tiradas, plenos, semiplenos, etc.
// Las reglas están en http://kata-log.rocks/bowling-game-kata por si alguien no las conoce.

// En una tirada 10 puntos - Pleno. Esta tirada vale 10 + puntos tirada siguiente + puntos en la 2ª tirada siguiente
// En una turno, primera tirada + segunda tirada = 10 - semipleno. Esta tirada vale 10 + puntos de la siguiente tirada
// En un turno primera tirada + segunda tirada < 10. Caso normal, sumar las dos tiradas
// Hay 10 turnos
// Como máximo hay 21 tiradas (n n n n n n n n n P e1 e2)

enum TipoTirada {
  case pleno
  case semipleno
  case normal
}

class Acumulador {
  var acumulado: Int
  var numTirada: Int
  
  init() {
    acumulado = 0
    numTirada = 0
  }
  
  func tipoTirada() -> TipoTirada {
    switch (acumulado, numTirada) {
      case (10, 1):
        return .pleno
        
      case (10, 2):
        return .semipleno
        
      default:
        return .normal
    }
  }
  
  func roll(pins: Int) {
    acumulado += pins
    numTirada += 1
  }
  
  func reset() {
    if acumulado == 10 || numTirada == 2 {
      acumulado = 0 
      numTirada = 0
    }
  }
}

class Game {
  
  var scoreUpToRoll: Int
  var acumulador: Acumulador
  
  init() {
    scoreUpToRoll = 0
    acumulador = Acumulador()
    tiradasDeBonus = 0
  }

  func roll(pins: Int) {
    // RELLENAR
    
    
    // Almacenar en algun sitio que en esta tirada has derribado n bolos
    
    acumulador.roll(pins: pins)
    scoreUpToRoll += (pins * multiplicador) 
    tiradasDeBonus -= 1
    let tipoTirada = acumulador.tipoTirada()
    switch tipoTirada {
      case .pleno:
        // Indicar que tengo que sumar en la siguiente tirada y en la otra
        
      case .semipleno:
        // Indicar que tengo que sumar en la siguiente tirada
        
      case .normal:
        // Indicar que no se suma nada
    }
    acumulador.reset()
    
    scoreUpToRoll += pins
  }
  
  func score() -> Int {
    // RELLENAR
    return scoreUpToRoll
  }
}

let rolls = [2, 4, 5, 5, 10, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2]
let game = Game()
for pins in rolls {
  game.roll(pins: pins)
}
let score = game.score()
print (score)

