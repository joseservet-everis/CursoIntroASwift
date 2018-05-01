// Ejemplo: Paises y monedas
//
// En este ejemplo vamos a ver herencia, inicialización en 2 pasos y modificación de propiedaes
//
// Vamos a definir los países con clases, en vez de con structs. Vamos a añadir una propiedad moneda, que será la divisa.
// En clases sí que necesitamos un inicializador, por lo que crearemos el inicializador con todas las propiedades.
//

public class Pais {
  let nombre: String
  let idioma: String
  let moneda: String
  
  init(nombre: String, idioma: String, moneda: String) {
    self.nombre = nombre
    self.idioma = idioma
    self.moneda = moneda
  }
}

let uk = Pais(nombre: "Reino Unido", idioma: "inglés", moneda: "GBP")

// Parte 2
//
// Después crearemos una clase PaisEurozona que herede de Pais, que inicializará la moneda a EUR automáticamente.
// Como en Reino Unido utilizan libras, cambiaremos la moneda de Reino Unido a GBP, después de crearla.

class PaisEurozona: Pais {
  init(nombre: String, idioma: String) {
    super.init(nombre: nombre, idioma: idioma, moneda: "EUR")
  }
}









