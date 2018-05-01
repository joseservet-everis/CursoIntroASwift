let españa = ("España", "español", "EUR")
let francia = ("Francia", "francés", "EUR")
let reinoUnido = ("Reino Unido", "inglés", "GBP")

let paises = [españa, francia, reinoUnido]



let paisesFiltrados = paises.filter { $0.2 == "EUR" }.filter { $0.1 == "español" }
print(paisesFiltrados)
