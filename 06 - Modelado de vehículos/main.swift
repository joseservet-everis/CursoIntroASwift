// Ejemplo: Modelado de vehículos
//
// Parte 1:
//
// Suponemos que estamos haciendo un estudio de los principales medios de transporte que usan los ciudadanos de Alicante.
// Para cada vehículo nos interesa saber si tiene motor y el combustible que usan, bien electricidad o gasolina.
// ¿Cómo modelaríais el tipo de vehículo?

enum TipoMotor {
  case electrico
  case gasolina
}

enum Vehiculo {
  case sinMotor
  case conMotor(TipoMotor)
}

//
// Parte 2:
// 
// Hacer una función que devuelva cada uno de los tipos, de forma que se pueda reutilizar en otros programas o partes del programa

func bicicleta() -> Vehiculo {
  return .sinMotor
}

let miBici = bicicleta()
print(miBici)


func cocheElectrico() -> Vehiculo {
  ??
}

func cocheGasolina() -> Vehiculo {
  ??
}











