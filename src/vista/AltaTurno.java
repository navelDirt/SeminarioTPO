package vista;

import java.awt.EventQueue;
import java.awt.Font;
import javax.swing.DefaultComboBoxModel;
import javax.swing.JButton;
import javax.swing.JComboBox;
import javax.swing.JDesktopPane;
import javax.swing.JFrame;
import javax.swing.JTextField;
import javax.swing.border.EmptyBorder;

import com.toedter.calendar.DateUtil;
import com.toedter.calendar.JDateChooser;

import controlador.Sistema;
import modelo.*;

import java.awt.BorderLayout;
import java.awt.GridLayout;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;
import java.util.Date;
import java.util.List;

import javax.swing.JLabel;
import javax.swing.JOptionPane;
import javax.swing.JPanel;
import java.awt.Color;

public class AltaTurno extends JFrame implements ActionListener
{	

	private static AltaTurno inst = null;
	private JDesktopPane contentPane;
	private JComboBox<Usuario> comboBoxProfesional;
	private JComboBox<Paciente> comboBoxPaciente;
	private JDateChooser dateChooser;
	private JComboBox<Integer> hora;
	private JComboBox<Integer> minutos;
	private Turnos vistaTurnos;

	/**
	 * Launch the application.
	 */
	public static void main(String[] args)
	{
		EventQueue.invokeLater(new Runnable()
		{
			public void run()
			{
				try
				{
					AltaTurno frame = new AltaTurno();
					frame.setVisible(true);
				} catch (Exception e)
				{
					e.printStackTrace();
				}
			}
		});
	}

	public static AltaTurno getInstance(){
		if(inst == null){
			inst = new AltaTurno();
		}
		return inst;
	}
	/**
	 * Create the application.
	 */
	public AltaTurno()
	{
		super();
		inst = this;
		initialize();
	}

	/**
	 * Initialize the contents of the frame.
	 */
	private void initialize()
	{

		setTitle("Alta Turno");
//		setBounds(100, 100, 450, 300);
		setBounds(100, 100, 518, 304);
		setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
		
		contentPane = new JDesktopPane();
		contentPane.setBackground(Color.WHITE);
		contentPane.setBorder(new EmptyBorder(5, 5, 5, 5));
		contentPane.setLayout(null);
		setContentPane(contentPane);
		
		dateChooser = new JDateChooser();
		Date date = new Date();
		dateChooser.setDate(date);
		dateChooser.setBounds(158, 126, 226, 20);
		contentPane.add(dateChooser);
		
		hora = new JComboBox<Integer>();
		hora.setModel(new DefaultComboBoxModel(new Integer[] {10, 11, 12, 13, 14, 15, 16, 17}));
		hora.setBounds(158, 155, 115, 22);
		contentPane.add(hora);
		
		minutos = new JComboBox<Integer>();
		minutos.setModel(new DefaultComboBoxModel(new Integer[] {0, 30}));
		minutos.setBounds(158, 188, 115, 22);
		contentPane.add(minutos);
		
		JLabel lblAltaTurno = new JLabel("Alta Turno");
		lblAltaTurno.setFont(new Font("Tahoma", Font.BOLD, 14));
		lblAltaTurno.setBounds(176, 11, 79, 20);
		contentPane.add(lblAltaTurno);
		
		JLabel lblProfesional = new JLabel("Profesional");
		lblProfesional.setBounds(43, 52, 105, 14);
		contentPane.add(lblProfesional);
		
		JLabel lblPaciente = new JLabel("Paciente");
		lblPaciente.setBounds(43, 87, 105, 14);
		contentPane.add(lblPaciente);
		
		JLabel lblDia = new JLabel("Dia");
		lblDia.setBounds(43, 126, 105, 14);
		contentPane.add(lblDia);
		
		JLabel lblHora = new JLabel("Hora");
		lblHora.setBounds(43, 159, 105, 14);
		contentPane.add(lblHora);
		
		JLabel lblMinuto = new JLabel("Minuto");
		lblMinuto.setBounds(43, 189, 105, 14);
		contentPane.add(lblMinuto);
		
		comboBoxProfesional = new JComboBox<Usuario>();
		comboBoxProfesional.setBounds(158, 48, 226, 22);
		
		for (Odontologo o : Sistema.getInstance().recuperarOdontologos()) {
			comboBoxProfesional.addItem(o);
		}
		for (Radiologo r : Sistema.getInstance().recuperarRadiologos()) {
			comboBoxProfesional.addItem(r);
		}
		
		//comboBoxProfesional.addItem("Pepito");
		contentPane.add(comboBoxProfesional);
		
		comboBoxPaciente = new JComboBox<Paciente>();
		comboBoxPaciente.setBounds(158, 83, 226, 22);

		for (Paciente p : Sistema.getInstance().recuperarPacientes()) {
			comboBoxPaciente.addItem(p);
		}
		
		contentPane.add(comboBoxPaciente);
		
		JButton btnAceptar_1 = new JButton("Aceptar");
		btnAceptar_1.setBounds(271, 239, 91, 23);
		contentPane.add(btnAceptar_1);
		
		JButton btnVolver = new JButton("Volver");
		btnVolver.addActionListener(new ActionListener() {
			public void actionPerformed(ActionEvent e) {
				if(e.getSource()==btnVolver){
					Turnos o = Turnos.getInstance();
					o.setVisible(true);
					inst.setVisible(false);
				}
			}
		});
		btnVolver.setBounds(372, 239, 89, 23);
		contentPane.add(btnVolver);
		
		btnAceptar_1.addActionListener(new ActionListener() {
			public void actionPerformed(ActionEvent e) {
				Date date = dateChooser.getDate();
				int horaTurno = (int) hora.getSelectedItem();
				int minutoturno = (int) minutos.getSelectedItem();
				//date.setHours((int) hora.getSelectedItem());
				//date.setMinutes((int) minutos.getSelectedItem());
				System.out.println("DATE CHOOSER "+date.toString());
				System.out.println("Hora: "+hora.getSelectedItem());
				System.out.println("Minutos: "+minutos.getSelectedItem());
				
				Turno turno = null;
				
				if (comboBoxProfesional.getSelectedItem() instanceof Odontologo) {
					turno = new Turno(new java.sql.Date(date.getTime()), horaTurno, minutoturno, true, (Paciente)(comboBoxPaciente.getSelectedItem()), 
							(Odontologo)(comboBoxProfesional.getSelectedItem()), null);
				}
				else if (comboBoxProfesional.getSelectedItem() instanceof Radiologo) {
					turno = new Turno(new java.sql.Date(date.getTime()), horaTurno, minutoturno, true, (Paciente)(comboBoxPaciente.getSelectedItem()), 
							null, (Radiologo)(comboBoxProfesional.getSelectedItem()));
				}
				else
					JOptionPane.showMessageDialog(inst, "Error: el profesional seleccionado no es ni Odontologo ni Radiologo.");
				
				Sistema.getInstance().agregarTurno(turno);
				
				JOptionPane.showMessageDialog(inst, "Turno creado.");
				
				if (vistaTurnos != null) {
					vistaTurnos.agregarTurnoCreado(turno);					
				}
				else {
					System.out.println("Error: no se puede actualizar la lista de turnos desde el alta turno.");
				}
			}
		});
	}

	@Override
	public void actionPerformed(ActionEvent e) {
		// TODO Auto-generated method stub
		
	}

	public void setVistaTurnos(Turnos vistaTurnos) {
		this.vistaTurnos = vistaTurnos;		
	}
}
