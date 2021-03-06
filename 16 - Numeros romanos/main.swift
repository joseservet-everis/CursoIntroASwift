// Ejemplo: Números romanos
//
// Hacer una extensión sobre los números enteros añadiendo una función o propiedad computada que devuelva la representación del entero en números romanos
//
// Reglas: http://agilekatas.co.uk/katas/RomanNumerals-Kata

extension Int {
  //func convertirANumerosRomanos() -> String {
  //  return "Por implementar"
  //}
  
  var romano: String {
  
    var cadena = ""
    var numero = self
    if numero > 1000 {
      for i in 0..<(numero / 1000) {
        cadena += "M"
      }
    }
    
    numero = numero % 1000
    
    let factores = [100, 10, 1]
    for factor in factores {
      if numero > factor {
        let unidad = numero / factor
        cadena += convertir(numero: unidad, factor: factor)
        numero = numero % factor
      }
    }
    
    return cadena
  }
  
  func convertir(numero: Int, factor: Int) -> String {
    let especiales = [0: "",
                      1: "I",
                      4: "IV",
                      5: "V",
                      9: "IX",
                      10: "X",
                      40: "XL",
                      50: "L",
                      90: "XC",
                      100: "C",
                      400: "CD",
                      500: "D",
                      900: "CM",
                      1000: "M"]
                      
    if let cadena = especiales[numero * factor] {
      return cadena
    }
    
    if numero <= 3 {
      if let uno = especiales[(1 * factor)] {
        var cadena = ""
        for _ in 0..<numero {
          cadena += uno
        }
        return cadena
      }
    } else if numero >= 5 {
      return convertir(numero: 5, factor: factor) + convertir(numero: numero - 5, factor: factor)
    }
    
    return "Por implementar"
  }
}

let uno = 1.romano
let dos = 2.romano
let tres = 3.romano
let cuatro = 4.romano
let cinco = 5.romano
let seis = 6.romano
let siete = 7.romano
let quince = 15.romano
let veinte = 20.romano
let treintayseis = 36.romano
let cincuentaycinco = 55.romano
let setentaysiete = 77.romano
let cientosiete = 107.romano
let cuatrocientossetentaynueve = 479.romano

let quinceArray = quince.characters.map { String($0) }









