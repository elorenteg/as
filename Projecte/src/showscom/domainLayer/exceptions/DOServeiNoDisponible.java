package showscom.domainLayer.exceptions;

/**
 * Classe de gestio d'Excepcions. Gestiona l'excepcio de no disponibilitat d'un
 * Servei.
 */
public class DOServeiNoDisponible extends Exception {
	public static final long serialVersionUID = 1L;

	/**
	 * Metode creador de la classe que invoca a la constructora de la classe
	 * Exception
	 */
	public DOServeiNoDisponible() {
		super();
	}
}
