class Distribuidora {

	var pedidos = []
	var property minimoParaDescuento = 100

	method agregarPedido(unPedido) {
		pedidos.add(unPedido)
	}

	method totalFacturado() {
		return pedidos.sum({ pedido => pedido.costo() })
	}

	method cantPedidos(tipoCerveza) {
		return pedidos.filter({ pedido => pedido.tipoLote().cerveza().equals(tipoCerveza) }).size()
	}

	method pedidoMasCaro() {
		return pedidos.max({ pedido => pedido.costo() })
	}

}

class Pedido {

	var property tipoLote
	var cantidad
	var distribuidora
//	var lotes = []
//	
//	}
//	method costoTotal(){
//		return lotes.sum( {lote => lote.costo() })
//	}
	
	method costo() {
		return self.costoBase() - self.costoBase() * self.descuento()
	}
	
	method costoBase(){
		return tipoLote.costo() * cantidad
	}

	method descuento() {
		if (self.aplicaDescuento()) {
			return tipoLote.descuento()
		}
		return 0
	}

	method aplicaDescuento() {
		return cantidad >= distribuidora.minimoParaDescuento()
	}

}

