class Rutina {
	
	method caloriasQuemadas(tiempo) {
		return 100 * (tiempo - self.descanso(tiempo)) * self.intensidad()
	}
	
	method descanso(tiempo)
	method intensidad()
}

class Running inherits Rutina {
	
	const property intensidad
	
	
	override method descanso(tiempo){
		return if (tiempo > 20) 5 else 2  
	}
}

class Maraton inherits Running {
	
	override method caloriasQuemadas(tiempo) {
		return super(tiempo) * 2
	}
}

class Remo inherits Rutina {

// esto vale	
//	const property intensidad = 1.3
		
	override method intensidad() {
		return 1.3
	}
	
	
	override method descanso(tiempo) {
		return tiempo / 5
	} 

}

class RemoCompeticion inherits Remo {
//esto valia si había una property en remo
//class RemoCompeticion inherits Remo(intensidad=1.7) {

	override method intensidad() {
		return 1.7
	}
	
	override method descanso(tiempo) {
		return 2.max(super(tiempo) - 3)
	}

}


class Persona {
	
	var property peso 
	
	method practicar(rutina) {
		self.validarRutina(rutina)
		peso = peso - self.pesoPerdido(rutina)
	}
	
	method caloriasGastadas(rutina) {
		return rutina.caloriasQuemadas(self.tiempo())
	}
	
	method pesoPerdido(rutina) {
		return self.caloriasGastadas(rutina) / self.kilosPorCaloriaQuePierde()
	}
	
	method tiempo()
	method validarRutina(rutina) {
		if (not self.puedeRealizar(rutina)) {
			self.error("No se pudee realizar " + rutina)
		}
	}
	method puedeRealizar(rutina)
	method kilosPorCaloriaQuePierde()
}

class PersonaSedentaria inherits Persona {
	
	const property tiempo
	
	
	override method puedeRealizar(rutina) {
		return self.peso() > 50
	}
	
	override method kilosPorCaloriaQuePierde() {
		return 7000
	}
	
}

class PersonaAtleta inherits Persona {

	override method tiempo() {
		return 90
	}
	
	override method puedeRealizar(rutina) {
		return self.caloriasGastadas(rutina) > 10000
	}
	
	override method kilosPorCaloriaQuePierde() {
		return 8000
	}

	override method pesoPerdido(rutina) {
		return super(rutina) - 1
	}
		
}

class Club {
	
	const predios = #{}
	
	method mejorPredio(persona) {
		return predios.max({ predio => predio.calorias(persona)})
	}
	
	method prediosTranquis(persona) {
		return predios.filter({predio => predio.esTranqui(persona) })
	}
	
	method rutinasExigentes(persona) {
		return predios.map({predio => predio.masExigente(persona)}).asSet()
	} 
}

class Predio {
	const rutinas = #{}
	
	method calorias(persona) {
		return rutinas.sum( { rutina => persona.caloriasGastadas(rutina)} )
	}
	
	method esTranqui(persona) {
		return rutinas.any({rutina => persona.caloriasGastadas(rutina) < 500})
	}
	
	method masExigente(persona) {
		return rutinas.max({rutina => persona.caloriasGastadas(rutina)})
	}
}






