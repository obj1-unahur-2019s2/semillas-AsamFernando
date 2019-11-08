class Planta {
	var property anioObtencionSemilla
	var property altura
	
	method horasDeSolTolera()
	//method condicionAlternativa()// se utiliza para sumarlo al super de daNuevasSemillas
	
	method esFuerte() {
		return self.horasDeSolTolera() > 10
	}
	
	method daNuevasSemillas() {
		return self.esFuerte() //or self.condicionAlternativa()
	}
	method espacioQOcupa()
	
	method parcelaIdeal(parcela)
}


class Menta inherits Planta {
	//const property horasDeSolTolera =6
	var property horasDeSolTolera=6
	//override method condicionAlternativa() { altura>0.4 }
	
	override method daNuevasSemillas() {
		return super() or altura>0.4 
	}
	override method espacioQOcupa() { return altura*3 }
	
	override method parcelaIdeal(parcela) {
		return parcela.superficie()>6
	}
}


class Soja inherits Planta {
	override method horasDeSolTolera() {
		if(altura<0.5) { return 6 }
		else if(altura<1) { return 7 }
		else { return 9 }
	}
	override method daNuevasSemillas() {
		return super() or (anioObtencionSemilla>2007 and altura>1)
	}
	override method espacioQOcupa() { return altura/2 }
	
	override method parcelaIdeal(parcela) {
		return parcela.horasSol()==self.horasDeSolTolera()
	}
}


class Quinoa inherits Planta {
	var property horasDeSolTolera
		
	override method espacioQOcupa() { return 0.5 }
	
	override method daNuevasSemillas() {
		return super() or anioObtencionSemilla<2005
	}
	override method parcelaIdeal(parcela) {
		return parcela.plantas().all{ planta => planta.altura()<1.5}
	}
}

class SojaTrans inherits Soja {
	override method daNuevasSemillas() { return false }
	
	override method parcelaIdeal(parcela) {
		return parcela.plantasQTiene()==1
	}
}

class HierbaBuena inherits Menta {
	override method espacioQOcupa() { return super()*2 }
	
}












