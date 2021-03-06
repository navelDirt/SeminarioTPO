package vista;

import java.awt.BorderLayout;
import java.awt.EventQueue;
import java.awt.Toolkit;

import javax.swing.JFrame;
import javax.swing.JPanel;
import javax.swing.border.EmptyBorder;

import controlador.Sistema;
import modelo.Odontologo;
import modelo.Radiologo;

import javax.swing.JLabel;
import javax.swing.JTextField;
import javax.swing.JTextPane;
import javax.swing.JButton;
import java.awt.event.ActionListener;
import java.awt.event.ActionEvent;
import javax.swing.JComboBox;

public class Especialistas extends JFrame {

	private JPanel contentPane;
	private JTextField txtNombre;
	private JTextField txtApellido;
	private JTextField txtTipoDni;
	private JTextField txtNmero;
	private JTextField txtDireccin;
	private JTextField txtTelfono;
	private static Especialistas inst = null;
	private JComboBox comboBox;

	/**
	 * Launch the application.
	 */
	public static void main(String[] args) {
		EventQueue.invokeLater(new Runnable() {
			public void run() {
				try {
					Especialistas frame = new Especialistas();
					frame.setVisible(true);
				} catch (Exception e) {
					e.printStackTrace();
				}
			}
		});
	}

	public static Especialistas getInstance(){
		if(inst == null){
			inst = new Especialistas();
		}
		return inst;
	}


	/**
	 * Create the frame.
	 */
	public Especialistas() {
		setTitle("Administrar Especialistas");
		setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);

		setBounds(100, 100, 518, 304);
		contentPane = new JPanel();
		contentPane.setBorder(new EmptyBorder(5, 5, 5, 5));
		setContentPane(contentPane);
		contentPane.setLayout(null);

		JLabel lblAgregarNuevoPaciente = new JLabel("Especialista");
		lblAgregarNuevoPaciente.setBounds(10, 11, 214, 14);
		contentPane.add(lblAgregarNuevoPaciente);

		txtNombre = new JTextField();
		txtNombre.setText("Nombre");
		txtNombre.setToolTipText("Nombre");
		txtNombre.setBounds(10, 36, 214, 20);
		contentPane.add(txtNombre);
		txtNombre.setColumns(10);

		txtApellido = new JTextField();
		txtApellido.setToolTipText("Apellido");
		txtApellido.setText("Apellido");
		txtApellido.setBounds(10, 61, 214, 20);
		contentPane.add(txtApellido);
		txtApellido.setColumns(10);

		txtTipoDni = new JTextField();
		txtTipoDni.setToolTipText("Tipo DNI");
		txtTipoDni.setText("Tipo DNI");
		txtTipoDni.setBounds(10, 85, 86, 20);
		contentPane.add(txtTipoDni);
		txtTipoDni.setColumns(10);

		txtNmero = new JTextField();
		txtNmero.setToolTipText("N\u00FAmero");
		txtNmero.setText("N\u00FAmero");
		txtNmero.setBounds(101, 86, 123, 20);
		contentPane.add(txtNmero);
		txtNmero.setColumns(10);

		txtDireccin = new JTextField();
		txtDireccin.setToolTipText("Direcci\u00F3n");
		txtDireccin.setText("Direcci\u00F3n");
		txtDireccin.setBounds(10, 108, 214, 20); 
		contentPane.add(txtDireccin);
		txtDireccin.setColumns(10);

		txtTelfono = new JTextField();
		txtTelfono.setToolTipText("Tel\u00E9fono");
		txtTelfono.setText("Tel\u00E9fono");
		txtTelfono.setBounds(10, 128, 214, 20);
		contentPane.add(txtTelfono);
		txtTelfono.setColumns(10);

		JTextPane textPane = new JTextPane();
		textPane.setToolTipText("Detalle del Especialista");
		textPane.setBounds(10, 170, 291, 81);
		contentPane.add(textPane);

		comboBox = new JComboBox();
		comboBox.setBounds(10, 149, 214, 20);
		comboBox.addItem("Odontologo");
		comboBox.addItem("Radiologo");
		contentPane.add(comboBox);

		JButton btnAgregar = new JButton("Agregar");
		btnAgregar.addActionListener(new ActionListener() {
			public void actionPerformed(ActionEvent arg0) {
				Odontologo o = null;
				Radiologo r  = null;
				
				
//				if(comboBox.getSelectedItem() == "Odontologo" ){
//					o.setApellido(txtApellido.getText());
//					o.setApellido(txtNombre.getText());
//					o.setTipoDocumento(txtTipoDni.getText());
//					o.setNroDocumento( Integer.parseInt(txtNmero.getText()));
//					o.setDomicilio(txtDireccin.getText());
//					o.setTelefono(Integer.parseInt(txtTelfono.getText()));
//					
//					Sistema.getInstance().agregarOdontologo(o);
//				}else{
//					
//					r.setApellido(txtApellido.getText());
//					r.setApellido(txtNombre.getText());
//					r.setTipoDocumento(txtTipoDni.getText());
//					r.setNroDocumento(Integer.parseInt(txtNmero.getText()));
//					r.setDomicilio(txtDireccin.getText());
//					r.setTelefono(Integer.parseInt(txtTelfono.getText()));
//					
//					Sistema.getInstance().agregarRadiologo(r);
//				}
				}
		});
		btnAgregar.setBounds(322, 159, 89, 23);
		contentPane.add(btnAgregar);

		JButton btnEliminar = new JButton("Eliminar");
		btnEliminar.addActionListener(new ActionListener() {
			public void actionPerformed(ActionEvent arg0) {
				Odontologo odon = Sistema.getInstance().buscarOdontologo(Integer.parseInt(txtNmero.getText()));
				if (odon == null){ Sistema.getInstance().eliminarOdontologo(odon);}
				
				Radiologo rad = Sistema.getInstance().buscarRadiologo(Integer.parseInt(txtNmero.getText()));
				Sistema.getInstance().buscarRadiologo(Integer.parseInt(txtNmero.getText()));
			}
		});
		btnEliminar.setBounds(322, 193, 89, 23);
		contentPane.add(btnEliminar);

		JButton btnVolver = new JButton("Volver");
		btnVolver.addActionListener(new ActionListener() {
			public void actionPerformed(ActionEvent e) {
				if(e.getSource()==btnVolver){
					AdministrarEspecialistas t = AdministrarEspecialistas.getInstance();
					t.setVisible(true);
					inst.setVisible(false);
				}
			}
		});
		btnVolver.setBounds(322, 228, 89, 23);
		contentPane.add(btnVolver);

		JPanelConFondo panelImagen = new JPanelConFondo();
		panelImagen.setImagen(Toolkit.getDefaultToolkit().getImage(MenuPrincipal.class.getResource("/resources/img/Paciente1.jpg")));
		panelImagen.setBounds(265, 34, 123, 114);
		panelImagen.setLayout(null);
		contentPane.add(panelImagen);




	}
}
