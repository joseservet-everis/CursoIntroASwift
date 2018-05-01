// Ejemplo: Definiendo países
//
// En este ejemplo, vamos a definir los países que hicimos en el ejemplo anterior con tuplas.
// Además del nombre del país y del idioma que hablan, vamos a incluir la población de cada país.
// Para el caso de la población, cada año la actualizaremos con el nuevo censo de la población.
// Hay que tener en cuenta que al cambiar la población, no podremos cambiarla en constantes, solo en variables

// España: 46M
// Francia: 67M
// Reino Unido: 65M
// Alemania: 87M

struct Pais {
  let nombre: String
  let idioma: String
  var poblacionEnMillones: Int

  // Atentos a esta función  
  mutating func cambiarPoblacion(_ nuevaPoblacion: Int) {
    poblacionEnMillones = nuevaPoblacion
  }
}

var españa = Pais(nombre: "España", idioma: "español", poblacionEnMillones: 40)
españa.cambiarPoblacion(46)

print(españa)







