// Ejemplo: Reducción ordenada
//
// En este ejercicio vamos a implementar un algoritmo de ordenación usando programación funcional.
// Usando el método reduce, montaremos un algoritmo de ordenación por inserción directa.
// Básicamente, iremos creando un nuevo array e iremos insertando cada elemento en la posición correspondiente

let unsortedArray = [4, 1, 7, 8, 3, 0]

let empty: [Int] = []
let sortedArray = unsortedArray.reduce(empty) {
  loQueLlevamosAcumlado, elementoQueMiramos in
  
  if loQueLlevamosAcumlado.isEmpty {
    return [elementoQueMiramos]
  } else {
    var indiceDondeInsertar = loQueLlevamosAcumlado.count
    for posicion in 0..<loQueLlevamosAcumlado.count {
      if loQueLlevamosAcumlado[posicion] > elementoQueMiramos {
        indiceDondeInsertar = posicion
        break
      }
    }
    var mutable = loQueLlevamosAcumlado
    mutable.insert(elementoQueMiramos, at: indiceDondeInsertar)
    return mutable
  }
}