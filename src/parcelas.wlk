class Parcela {
	var property ancho
	var property largo
	var property horasSol
	const property plantas = []
	
	method superficie() {
		return ancho*largo
	}
	
	method cantMaxPlantas() {
		return if(ancho>largo) { self.superficie()/5 }
				else { self.superficie()/3 + largo }
		}
	method tieneComplicaciones() {
		return plantas.any{ planta => planta.horasDeSolTolera() < horasSol }
	}
	method plantaPlanta(planta) {
		if(self.puedePlantar(planta)) {
			plantas.add(planta)	
		}
		self.error("no se puede plantar")
	}
	
	method plantasQueTiene() = plantas.size()
	
	method puedePlantar(planta) {
		return not (self.plantasQueTiene() < self.cantMaxPlantas() and horasSol - planta.horasDeSolTolera()>2)
	}
	
}
