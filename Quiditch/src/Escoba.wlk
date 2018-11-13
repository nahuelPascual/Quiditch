class Escoba {
	const property anioFabricacion
	var property salud = 100
	
	constructor(fab) {
		anioFabricacion = fab
	}
	
	method velocidad()
	method recibirGolpe(){}
	method restarSalud(val) {
		salud -= val
	}
}

object nimbus inherits Escoba(2001, 100) {
	override method velocidad() = (80- (anioFabricacion-new Date().year())) * salud	
	override method recibirGolpe() {
		self.restarSalud(salud*0.1)
	}
}
object saetaDeFuego inherits Escoba (2018, 100) {
	
	override method velocidad() = 100
}

