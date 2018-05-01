// Ejemplo: Claves opcionales
//
// Suponemos que estamos haciendo una app para consultar la programación de televisión
// Suponemos que estamos usando un framework que traduce el JSON o XML que leemos a un diccionario.
// Este sería un ejemplo de diccionario:

let programacion: [String: Any] = [
"Canal": "La 2",
"Programas": [["Título": "Documental de animales", "Hora": "14:30"],["Título": "Documental de África", "Hora": "15:00"],
["Título": "Saber y ganar", "Hora": "15:30", "Categoría": "Concurso"], ["Título": "Documental de sobremesa", "Hora": "16:30"]]
]

// ¿Cómo sacaríamos todas las categorías de los programas?

if let programas = programacion["Programas"] as? [[String: String]] {
  // Programas ya no es opcionales
  let categorias = programas.map { $0["Categoría"] }
}