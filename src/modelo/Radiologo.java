package modelo;

import java.sql.Date;

import javax.persistence.Entity;

@Entity
public class Radiologo extends Usuario
{
	private int nroMatricula;
	
	public Radiologo() {
		
	}

	public Radiologo(int nroMatricula, String nombre, String apellido,
			String tipoDocumento, int nroDocumento, String domicilio,
			int telefono, char sexo, Date fechaNac, String funcion)
	{
		super(nombre, apellido, tipoDocumento, nroDocumento, domicilio,
				telefono, sexo, fechaNac, funcion);
		
		this.nroMatricula = nroMatricula;
	}

	public int getNroMatricula()
	{
		return nroMatricula;
	}

	public void setNroMatricula(int nroMatricula)
	{
		this.nroMatricula = nroMatricula;
	}

}
