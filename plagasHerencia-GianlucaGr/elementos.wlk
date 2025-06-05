import plagas.*
class Hogar{
  var mugre
  const confort
  method esBueno() {(confort / 2 ) <= mugre}
  method efectoDelAtaque(unaPlaga) {mugre = mugre + unaPlaga.daño()}  
}

class Huerta{
  var produccion
  method esBueno() = produccion > nivelMinimo.nivel()
  method efectoDelAtaque(unaPlaga) {
    produccion = produccion - (unaPlaga.daño() * 0.1 + if(unaPlaga.transmiteEnfermedades()) 10 else 0)
  }
}

class Mascota {
  var nivelDeSalud
  method esBueno() = nivelDeSalud > 250
  method efectoDelAtaque(unaPlaga) {
    if(unaPlaga.transmiteEnfermedades()){
      nivelDeSalud = (nivelDeSalud - unaPlaga.daño()).max(0)
    }
  }

}

object nivelMinimo{
  var property nivel = 0
}


class Barrio {
  const elementos = []
  method agregarElementos(listaElementos) {(elementos.addAll(listaElementos))}
  method losBuenos() = elementos.filter({e => e.esBueno()})
  method losMalos() = elementos.filter({e => not e.esBueno()})
  method esCopado() = self.losBuenos().size() > self.losMalos().size()
  method esBuenoEl(unElemento) = if (elementos.contains(unElemento)) {
    unElemento.esBueno()
    }

  
  }





