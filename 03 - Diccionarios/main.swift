// Diccionarios

let clavePais = "pais"
let claveIdioma = "idioma"

// Inferencia de tipo
let estadosUnidos: [String: String] = [clavePais: "Estados Unidos", claveIdioma: "inglés"] // explícito
let italia = [clavePais: "Italia", claveIdioma: "italiano"] // inferido

// Mutaciones
var alemania: [String: String] = [:]  // Por qué da error?
alemania[clavePais] = "Alemania"
alemania[claveIdioma] = "alemán"
print(alemania)
