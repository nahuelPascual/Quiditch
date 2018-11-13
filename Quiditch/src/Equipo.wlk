class Equipo {
	var jugadores
	var puntos = 0
	
//	method mejorJugador() = jugadores.m
	method jugadorEstrella(equipoRival) = 
		equipoRival.jugadores().forEach{ jug => self.mejorJugador().lePasaElTrapoA(jug)}
	method tieneLaQuaffle() = jugadores.filter{jug=>jug.tieneLaQuaffle()}.size() > 0
	method jugarContra(equipo){
		jugadores.forEach{jug=>jug.jugarTurno()}
	}
	method ganarPuntos(val) {
		puntos += val
	}
}
