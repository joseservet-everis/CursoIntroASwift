// Ejercicio: Devoluciones
//
// El objetivo de este ejercicio es calcular las devoluciones en billetes y monedas al hacer una compra.
// El input será la cantidad a pagar y la cantidad entregada.
// La complicación del ejercicio es que debemos hacer el sistema portable para cualquier moneda, ya que no todas las monedas tienen los mismos billetes y monedas.
// Ejemplo: en euros tenemos billetes de 500, 200, 100, 50, 20, 10 y 5 euros, y monedas de 2 y 1 euro y de 50, 20, 10, 5, 2, y 1 céntimo, pero en yenes están los billetes de 10000, 5000 y 1000 yenes, y monedas de 500, 100, 50, 10, 5 y 1 yen.

let total = 451
let pago = 500

struct Divisa {
  let multiplicador: Int
  let menor: String
  let billetes: [Int]
  let monedas: [Int]
}

let eur = Divisa(multiplicador: 100, menor: "céntimo(s)", billetes: [500*100, 200*100, 100*100, 50*100, 20*100, 10*100, 5*100], monedas: [2*100, 1*100, 50, 20, 10, 5, 2, 1])
let yen = Divisa(multiplicador: 1, menor: "", billetes: [10000, 5000, 1000], monedas: [500, 100, 50, 10, 5, 1])

func cambio(total: Double, pagado: Double, divisa: Divisa) {
  let totalReal = Int(total * Double(divisa.multiplicador))
  let pagadoReal = Int(pagado * Double(divisa.multiplicador))
  
  var cambio: [String] = []
  var diferencia = pagadoReal - totalReal
  for billete in divisa.billetes {
    if diferencia < billete {
      continue
    }
    let numBilletes = diferencia / billete
    let billeteStr = numBilletes == 1 ? "billete" : "billetes"
    cambio.append("\(numBilletes) \(billeteStr) de \(billete / divisa.multiplicador)")
    diferencia -= (numBilletes * billete)
  }
  
  let empty: [String] = []
  let billetesFunc = divisa.billetes.reduce((diferencia, empty)) {
    tupla, billete in
    
    if tupla.0 < billete {
      return tupla
    }
    
    let numBilletes = tupla.0 / billete
    let billeteStr = numBilletes == 1 ? "billete" : "billetes"
    
    var vueltas = tupla.1
    vueltas.append("\(numBilletes) \(billeteStr) de \(billete / divisa.multiplicador)")
    return (tupla.0 - (numBilletes * billete), vueltas)
  }
  
  for moneda in divisa.monedas {
    if diferencia < moneda {
      continue
    }
    let numMonedas = diferencia / moneda
    let monedaStr = numMonedas == 1 ? "moneda" : "monedas"
    let texto = moneda >= divisa.multiplicador ? "\(moneda / divisa.multiplicador)" : "\(moneda) \(divisa.menor)"
    cambio.append("\(numMonedas) \(monedaStr) de \(texto)")
    diferencia -= (numMonedas * moneda)
  }
  
  print("Hay que devolver \(cambio.joined(separator: ", "))")
}

cambio(total: 400, pagado: 711.40, divisa: eur)
cambio(total: 400, pagado: 711.40, divisa: yen)
