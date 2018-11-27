object lupuloImportado {

	const constIbu = 2.4
	
	method costo() {
		return 1000
	}

	method constIbu(){
		return constIbu
	}
}

object lupuloLocal {

	method costo() {
		return 800
	}

	method constIbu() {
		return 1.6
	}

}

class Levadura {

	method incremento()
	
	method cepa(){
		return "algo"
	}

}

class FermAlta inherits Levadura {

	override method incremento() {
		return 1.1
	}

}

class FermBaja inherits Levadura {

	override method incremento() {
		return 1
	}

}

class FermMedia inherits Levadura {


}

class LoteClasica {

	const lupulo = 0
	const levadura = 0
	const azucar = 0

	method costo() {
		return lupulo.costo() * levadura.incremento()
	}

//	method costo() {
//		return self.costoBase()
//	}

	method ibus() {
		return (lupulo.constIbu() * azucar) / 2
	}

	method descuento() {
		return 0
	}

	method cerveza() {
		return "clasica"
	}

}

class LoteLager inherits LoteClasica {

	var cantIngredientes = 0

	override method costo() {
		return super() + cantIngredientes * 50
	}

	method agregarIngrediente() {
		if (cantIngredientes <= 10) {
			cantIngredientes++
		}
	}

	override method descuento() {
		if (cantIngredientes > 5) {
			return 0.2
		}
		if (cantIngredientes > 1 && cantIngredientes < 5) {
			return cantIngredientes * 0.02
		}
		return 0
	}

	override method cerveza() {
		return "lager"
	}

}

class LotePorter inherits LoteClasica {

	var distanciaProveedor = 0

	method porcIncremento() {
		return distanciaProveedor * 0.02 + 1
	}

	override method costo() {
		return super() * self.porcIncremento()
	}

	override method descuento() {
		if (distanciaProveedor <= 10) {
			return 0.1
		}
		return 0
	}

	override method cerveza() {
		return "porter"
	}

}

