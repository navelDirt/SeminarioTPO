package vista;

import java.awt.BorderLayout;
import java.awt.EventQueue;

import javax.swing.JFrame;
import javax.swing.JPanel;
import javax.swing.border.EmptyBorder;
import javax.swing.JLabel;
import javax.swing.JList;
import javax.swing.JButton;
import java.awt.event.ActionListener;
import java.awt.event.ActionEvent;

public class BuscarHistoriaClinica extends JFrame implements ActionListener{

	private JPanel contentPane;
	private static BuscarHistoriaClinica inst = null;
	/**
	 * Launch the application.
	 */
	public static void main(String[] args) {
		EventQueue.invokeLater(new Runnable() {
			public void run() {
				try {
					BuscarHistoriaClinica frame = new BuscarHistoriaClinica();
					frame.setVisible(true);
				} catch (Exception e) {
					e.printStackTrace();
				}
			}
		});
	}

	
	public static BuscarHistoriaClinica getInstance(){
		if(inst == null){
			inst = new BuscarHistoriaClinica();
		}
		return inst;
	}
	
	/**
	 * Create the frame.
	 */
	public BuscarHistoriaClinica() {
		setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
		setBounds(100, 100, 518, 304);
		contentPane = new JPanel();
		contentPane.setBorder(new EmptyBorder(5, 5, 5, 5));
		setContentPane(contentPane);
		contentPane.setLayout(null);
		
		JLabel lblHistoriasClnicas = new JLabel("Historias Cl\u00EDnicas");
		lblHistoriasClnicas.setBounds(10, 11, 173, 14);
		contentPane.add(lblHistoriasClnicas);
		
		JList list = new JList();
		list.setBounds(20, 36, 297, 167);
		contentPane.add(list);
		
		JButton btnSeleccionar = new JButton("Seleccionar");
		btnSeleccionar.addActionListener(new ActionListener() {
			public void actionPerformed(ActionEvent e) {
				
				if(e.getSource()==btnSeleccionar){
					HistoriaClinica t = HistoriaClinica.getInstance();
					t.setVisible(true);
					inst.setVisible(false);
				}
			}
		});
		btnSeleccionar.setBounds(169, 228, 114, 23);
		contentPane.add(btnSeleccionar);
		
		JButton btnVolver = new JButton("Volver");
		btnVolver.addActionListener(new ActionListener() {
			public void actionPerformed(ActionEvent e) {
				
				if(e.getSource()==btnVolver){
					MenuPrincipal t = MenuPrincipal.getInstance();
					t.setVisible(true);
					inst.setVisible(false);
				}
				
			}
		});
		btnVolver.setBounds(293, 228, 89, 23);
		contentPane.add(btnVolver);
	}

	@Override
	public void actionPerformed(ActionEvent e) {
		// TODO Auto-generated method stub
		
	}

}