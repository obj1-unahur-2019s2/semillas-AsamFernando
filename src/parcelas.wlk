class Parcela {
	var property ancho
	var property largo
	var property horasSol
	const property plantas = #{}
	
	method superficie() = ancho*largo
	method seAsociaBien(planta)
	
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
		return self.plantasQueTiene() < self.cantMaxPlantas() or horasSol - planta.horasDeSolTolera()<2
	}
	method cantBienAsociadas() {
		return plantas.count{ p => self.seAsociaBien(p) }
	}
	method porcentajeAsociadas() {
		return (self.cantBienAsociadas()*100)/self.plantasQueTiene()
	}
}

class Ecologica inherits Parcela {
	override method seAsociaBien(planta) {
		return not self.tieneComplicaciones() and planta.parcelaIdeal(self)
	}
}

class Industrial inherits Parcela {
	override method seAsociaBien(planta) {
		return self.plantasQueTiene()<=2 and planta.esFuerte()
	}
}


object inta {
	const property parcelas=[]
	
	method agregarParcela(parcela) {
		parcelas.add(parcela)
	}
	method sumaPlantas() {
		return parcelas.sum{ p => p.plantasQueTiene() }
	}
	method totalParcelas() {
		return parcelas.size()
	}
	method promPlantas() {
		return self.sumaPlantas()/self.totalParcelas()
	}
	method parcMasDeCuatro() {
		return parcelas.filter{ p => p.plantasQueTiene()>4 }
	}
	method masAuto() {
		return self.parcMasDeCuatro().max{ p => p.porcentajeAsociadas() }
	}
}













