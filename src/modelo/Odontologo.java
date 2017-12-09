package modelo;

import java.sql.Date;
import java.util.ArrayList;
import java.util.List;

import javax.persistence.Entity;
import javax.persistence.OneToMany;

@Entity
public class Odontologo extends Usuario
{
	private int nroMatricula;
	
	@OneToMany(mappedBy = "odontologo")
	private List<PlanTratamiento> planesTratamiento = new ArrayList<PlanTratamiento>();	
	
	@OneToMany(mappedBy = "odontologo")
	private List<ConsentimientoTratamiento> consentimientosTratamiento = new ArrayList<ConsentimientoTratamiento>();
	
	@OneToMany(mappedBy = "odontologo")
	private List<Turno> turnos = new ArrayList<Turno>();
	
	public Odontologo() {
		
	}
	
	public Odontologo(int nroMatricula, String nombre, String apellido,
			String tipoDocumento, int nroDocumento, String domicilio,
			int telefono, char sexo, Date fechaNac, String funcion)
	{
		super(nombre, apellido, tipoDocumento, nroDocumento, domicilio,
				telefono, sexo, fechaNac, funcion);
		
		this.setNroMatricula(nroMatricula);
	}
	
	@Override
	public String toString()
	{
		return getNroDocumento() + " - " + getApellido() + ", " + getNombre();
	}
	
	@Override
	public boolean equals(Object p)
	{
		if (p instanceof Odontologo) {
			return this.getUsuarioId() == ((Odontologo) p).getUsuarioId();
		}
		return super.equals(p);
	}

	public int getNroMatricula()
	{
		return nroMatricula;
	}

	public void setNroMatricula(int nroMatricula)
	{
		this.nroMatricula = nroMatricula;
	}
	
	public List<ConsentimientoTratamiento> getConsentimientosTratamiento()
	{
		return consentimientosTratamiento;
	}

	public List<PlanTratamiento> getPlanesTratamiento()
	{
		return planesTratamiento;
	}

	public List<Turno> getTurnos()
	{
		return turnos;
	}

	public void setTurnos(List<Turno> turnos)
	{
		this.turnos = turnos;
	}	
}
