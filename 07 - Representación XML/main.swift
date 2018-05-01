// Ejemplo: Representación XML
//
// Suponer que estamos haciendo una app y tenemos que conectar a un servicio que nos devuelve un listado de noticias en formato XML.
// ¿Cómo representaríamos el XML con un enum?
// La idea es poder tener la estructura del XML guardada, sabiendo que un tag puede tener un valor si es final, o contener otros tags, que pueden tener un solo elemento o varios.
// 
// XML de ejemplo:
//
// <respuesta>
//  <categoria>MWC 2018</categoria>
//  <noticias>
//    <noticia>
//      <fecha>01/03/2018</fecha>
//      <titular>La tecnología 5G multiplica las velocidaes de descarga actuales</titular>
//    </noticia>
//    <noticia>
//      <fecha>02/03/2018</fecha>
//      <titular>Los móviles chinos copian el iPhone X</titular>
//    </noticia>
//  </noticias>
// </respuesta>

enum XMLNodo {
    case simple(String)
    case diccionario([String: XMLNodo])
    case array([XMLNodo])
    
    func representacionXML() -> String {
      switch self {
        case .simple(let simpleString):
          return simpleString
          
        case .diccionario(let xmlDicccionario):
          var xmlRep = ""
          for (clave, valor) in xmlDicccionario {
            switch valor {
              case .array(let xmlArray):
                var xmlArrayRep = ""
                for nodo in xmlArray {
                  xmlArrayRep += "<\(clave)>\(nodo.representacionXML())</\(clave)>"
                }
                xmlRep = xmlArrayRep
              default:
                xmlRep += "<\(clave)>\(valor.representacionXML())</\(clave)>"
            }
          }
          return xmlRep

        case .array(let xmlArray):
          var xmlRep = ""
          for nodo in xmlArray {
            xmlRep += nodo.representacionXML()
          }
          return xmlRep
      }
    }
}

let arrayNoticias: XMLNodo = .array([.diccionario(["fecha": .simple("01/03/2018"),
                                                   "titular": .simple("La tecnología 5G ...")]),
                                     .diccionario(["fecha": .simple("02/03/2018"),
                                                    "titular": .simple("Los moviles chinos")])])
let representacion: XMLNodo =   .diccionario([  "categoria": .simple("MWC 2018"),
                                                "noticias": .diccionario(["noticia": arrayNoticias])])

let xml = representacion.representacionXML()






