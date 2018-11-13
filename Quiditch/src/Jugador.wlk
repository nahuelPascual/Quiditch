class Jugador {
	const vision
	const peso
	const punteria
	const fuerza
	const reflejos
	var property skills
	const property equipo
	var escoba
	var property estado
	
	method manejoDeEscoba() = skills / peso
	method velocidad() = escoba.velocidad() * self.manejoDeEscoba()
	method lePasaElTrapoA(otro) = self.habilidad() >= otro.habilidad()*2
	method esGroso() = self.esHabilidoso() && self.esVeloz()
	method restarSkills(val){
		skills -= val		
	}
	method esGolpeadoPor(bludger) {
		self.restarSkills(2)
		escoba.recibirGolpe()
		self.efectoGolpe()
	}
	method evitaBloqueos(rival) = rival.forEach{jug=>!jug.puedeBloquear(self)}
	/* Auxiliares */
	method esHabilidoso() = self.habilidad() > equipo.habilidadPromedio()
	method esVeloz() = self.velocidad() > escoba.valorArbitrario()
	/* Abstractos */
	method jugarTurno(equipoRival)
	method puedeBloquear(rival)
	method habilidad()
	method esBlancoUtil()
	method efectoGolpe()
}

class Cazador inherits Jugador {
	override method habilidad() = self.velocidad() + skills + punteria*fuerza
	
	override method puedeBloquear(cazador) = self.lePasaElTrapoA(cazador)
	override method esBlancoUtil() = self.estado().tieneLaQuaffle()
	override method efectoGolpe() {
		
	}
	override method jugarTurno(equipoRival){
		self.estado().jugar(equipoRival)
	}
}
class Guardian inherits Jugador(){
	override method habilidad() = self.velocidad() + skills + reflejos + fuerza
	override method puedeBloquear(cazador) = 3 == (1.3).atRandom()
	override method esBlancoUtil() = !equipo.tieneLaQuaffle()
	override method efectoGolpe() {}
	
}
class Golpeador inherits Jugador(){
	override method habilidad() = self.velocidad() + skills + punteria + fuerza
	override method puedeBloquear(cazador) = self.esGroso()
		override method esBlancoUtil() = false
	
}
class Buscador inherits Jugador(){
	override method habilidad() = self.velocidad() + skills + reflejos*vision
	override method puedeBloquear() = false
	override method esBlancoUtil() = self.persiguiendoSnitch() || self.leFaltan()<1000
	method efectoGolpe() {
		self.reiniciarBusqueda()
	}
}

/* Estados */
class Atacando { // intentando meter gol
	const jugador
	method jugar (equipoRival) = if(jugador.evitaBloqueos(equipoRival)){ 
										jugador.equipo().ganarPuntos(10)
										jugador.restarSkills(-5)
									} else {
										jugador.restarSkils(2)
									}
	method tieneQuaffle() = true
}
