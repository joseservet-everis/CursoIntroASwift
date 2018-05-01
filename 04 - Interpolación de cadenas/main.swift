// Sin interpolación
let cadenaSimple = "3 unidades"

// Composición de cadenas (String interpolation)
let unidades = 3
let cadenaInterpolada = "\(unidades) unidades"

// Valores booleanos
let correoLeido = false
let mensajeEstado = "El correo se ha leido: \(correoLeido)"

// Se puede usar el operador + para concatenar cadenas
var estadoCompuesto = "El correo se ha leido" + ": "
//estadoCompuesto += correoLeido
estadoCompuesto += "\(correoLeido)"

print(estadoCompuesto)