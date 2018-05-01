// Ejemplo: Categorías de programas
//
// Sobre el ejemplo anterior, vamos a usar el operador ?? nil coalescing operator para poner un valor por defecto a los programas que no tienen categoría, en este caso será "Documental"


let programacion: [String: Any] = [
"Canal": "La 2",
"Programas": [["Título": "Documental de animales", "Hora": "14:30"],["Título": "Documental de África", "Hora": "15:00"],
["Título": "Saber y ganar", "Hora": "15:30", "Categoría": "Concurso"], ["Título": "Documental de sobremesa", "Hora": "16:30"]]
]

// ¿Cómo sacaríamos todas las categorías de los programas?

if let programas = programacion["Programas"] as? [[String: String]] {
  // Programas ya no es opcionales
  let categorias = programas.flatMap { $0["Categoría"] ?? "Documental" }
  print(categorias)
}