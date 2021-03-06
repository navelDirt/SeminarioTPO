package persistencia;

import java.util.List;

import modelo.Odontologo;
import modelo.Radiologo;
import utils.HibernateUtil;

public class RadiologoDAO {

	private static RadiologoDAO instancia;
	
	public static RadiologoDAO getInstancia() {
		if (instancia == null)
			instancia = new RadiologoDAO();
		return instancia;
	}

	public List<Radiologo> findAll() {
		return HibernateUtil.getSessionFactory().openSession().createQuery("from Radiologo").list();
	}
	
	public void save(Radiologo r) {
		HibernateUtil.guardarEntidad(r);
	}
	
	public void update(Radiologo r) {
		HibernateUtil.actualizarEntidad(r);
	}
	
	public void remove(Radiologo r) {
		HibernateUtil.eliminarEntidad(r);
	}


}
