// Ejercicio: Quicksort
//
// Vamos a implementar el algoritmo Quicksort para ordenar arrays de enteros.
// Lo vamos a hacer como una función que reciba un array de enteros sin ordenar y devuelva un array ordenado.
//
// Pseudo código del Quicksort: http://www.algorithmist.com/index.php/Quicksort

func partition(_ unsortedArray: inout [Int], _ low: Int, _ high: Int) -> Int {
  let pivot = unsortedArray[low]
  var leftwall = low
  
  for i in (low+1)..<high {
    if unsortedArray[i] < pivot {
      let temp = unsortedArray[i]
      unsortedArray[i] = unsortedArray[leftwall + 1]
      unsortedArray[leftwall + 1] = temp
      
      leftwall += 1
    }
  }
  unsortedArray[low] = unsortedArray[leftwall]
  unsortedArray[leftwall] = pivot
  
  return leftwall
}

func doQuickSort(_ unsortedArray: inout [Int], _ low: Int, _ high: Int) {
  if low < high {
    let pivot = partition(&unsortedArray, low, high)
    doQuickSort(&unsortedArray, low, pivot)
    doQuickSort(&unsortedArray, pivot + 1, high)
  }
}

func quicksort(unsortedArray: [Int]) -> [Int] {
  var mutable = unsortedArray
  doQuickSort(&mutable, 0, mutable.count)
  return mutable
}

let input = [1, 4, 3, 2, 9, 7, 5]
let output = quicksort(unsortedArray: input)

print (output)