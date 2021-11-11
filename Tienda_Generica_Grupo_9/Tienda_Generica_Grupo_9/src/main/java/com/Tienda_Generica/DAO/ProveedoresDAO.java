package com.Tienda_Generica.DAO;

import java.sql.*;
import java.util.ArrayList;

import com.Tienda_Generica.DTO.ProveedoresVO;

/**
 * Clase que permite el acceso a la base de datos
 *
 */
public class ProveedoresDAO {
	/**
	 * Permite registrar un Proveedores nuevo
	 * 
	 * @param user
	 */
	public void registrarProveedores(ProveedoresVO user) {
		//llama y crea una instancia de la clase encargada de hacer la conexión
		Conexion conex = new Conexion();

		try {
			//sentencia que se ejecutara en la base de datos
			Statement estatuto = conex.getConnection().createStatement();
			
			//String que contiene la sentencia insert a ejecutar
			String sentencia = "INSERT INTO proveedores VALUES(" 
					+ user.getNit_proveedor() + "," + "'"
					+ user.getCiudad_proveedor() + "'," + "'" 
					+ user.getDireccion_proveedor() + "'," + "'" 
					+ user.getNombre_proveedor() + "'," + "'" 
					+ user.getTelefono_proveedor() + "'" 
					+ ");";
			
			//se ejecuta la sentencia en la base de datos
			estatuto.executeUpdate(sentencia);
			//impresión en consola para verificación 
			System.out.println("Registrado " + sentencia);
			//cerrando la sentencia y la conexión
			estatuto.close();
			conex.desconectar();

		} catch (SQLException e) {
			//si hay un error en el sql mostrarlo
			System.out.println("------------------- ERROR --------------");
			System.out.println("No se pudo insertar el proveedor");
			System.out.println(e.getMessage());
			System.out.println(e.getErrorCode());
		} catch (Exception e) {
			//si hay cualquier otro error mostrarlo
			System.out.println("------------------- ERROR --------------");
			System.out.println("No se pudo insertar el proveedor");
			System.out.println(e.getMessage());
			System.out.println(e.getLocalizedMessage());
		}

	}

	/**
	 * permite consultar el proveedor asociado al user enviado como parametro
	 * 
	 * @param documento
	 * @return
	 */
	public ArrayList<ProveedoresVO> consultarProveedores(Integer nit_proveedor) {	
		//lista que contendra el o los Proveedores obtenidos
		ArrayList<ProveedoresVO> listaproveedores = new ArrayList<ProveedoresVO>();		
		//instancia de la conexión
		Conexion conex = new Conexion();
		try {
			//prepare la sentencia en la base de datos
			PreparedStatement consulta = conex.getConnection()
					.prepareStatement("SELECT * FROM proveedores where nit_proveedor = ? ");		
			// se cambia el comodin ? por el dato que ha llegado en el parametro de la funcion
			consulta.setInt(1, nit_proveedor);			
			//ejecute la sentencia
			ResultSet res = consulta.executeQuery();			
			//cree un objeto basado en la clase entidad con los datos encontrados
			if (res.next()) {
				ProveedoresVO Proveedores = new ProveedoresVO();
				Proveedores.setNit_proveedor(Integer.parseInt(res.getString("nit_proveedor")));
				Proveedores.setCiudad_proveedor(res.getString("ciudad_proveedor"));
				Proveedores.setDireccion_proveedor(res.getString("direccion_proveedor"));
				Proveedores.setNombre_proveedor(res.getString("nombre_proveedor"));				
				Proveedores.setTelefono_proveedor(res.getString("telefono_proveedor"));

				listaproveedores.add(Proveedores);
			}
			//cerrar resultado, sentencia y conexión
			res.close();
			consulta.close();
			conex.desconectar();

		} catch (SQLException e) {
			//si hay un error en el sql mostrarlo
			System.out.println("------------------- ERROR --------------");
			System.out.println("No se pudo consultar el proveedor");
			System.out.println(e.getMessage());
			System.out.println(e.getErrorCode());
		} catch (Exception e) {
			//si hay cualquier otro error mostrarlo
			System.out.println("------------------- ERROR --------------");
			System.out.println("No se pudo consultar los proveedor");
			System.out.println(e.getMessage());
			System.out.println(e.getLocalizedMessage());
		}
		return listaproveedores;
	}
	
	/**
	 * permite consultar la lista de todos los Proveedoress
	 * 
	 * @return
	 */
	public ArrayList<ProveedoresVO> listaDeProveedores() {
		//lista que contendra el o los Proveedoress obtenidos
		ArrayList<ProveedoresVO> listaproveedores = new ArrayList<ProveedoresVO>();
		
		//instancia de la conexión
		Conexion conex = new Conexion();

		try {
			//prepare la sentencia en la base de datos
			PreparedStatement consulta = conex.getConnection().prepareStatement("SELECT * FROM proveedores");
			
			//ejecute la sentencia
			ResultSet res = consulta.executeQuery();
			
			//cree un objeto para cada encontrado en la base de datos basado en la clase entidad con los datos encontrados
			while (res.next()) {
				ProveedoresVO Proveedores = new ProveedoresVO();
				Proveedores.setNit_proveedor(Integer.parseInt(res.getString("nit_proveedor")));
				Proveedores.setCiudad_proveedor(res.getString("ciudad_proveedor"));
				Proveedores.setDireccion_proveedor(res.getString("direccion_proveedor"));
				Proveedores.setNombre_proveedor(res.getString("nombre_proveedor"));				
				Proveedores.setTelefono_proveedor(res.getString("telefono_proveedor"));

				listaproveedores.add(Proveedores);
			}
			
			//cerrar resultado, sentencia y conexión
			res.close();
			consulta.close();
			conex.desconectar();

		} catch (SQLException e) {
			//si hay un error en el sql mostrarlo
			System.out.println("------------------- ERROR --------------");
			System.out.println("No se pudo consultar todos los proveedores");
			System.out.println(e.getMessage());
			System.out.println(e.getErrorCode());
		} catch (Exception e) {
			//si hay cualquier otro error mostrarlo
			System.out.println("------------------- ERROR --------------");
			System.out.println("No se pudo consultar todos los proveedores");
			System.out.println(e.getMessage());
			System.out.println(e.getLocalizedMessage());
		}

		return listaproveedores;
	}

	public void eliminarProveedores(Integer nit_proveedor) {
		
		//instancia de la conexion
		Conexion conex = new Conexion();

		try {
			//sentencia inicializada
			Statement consulta = conex.getConnection().createStatement();
			
			//preparando sentencia a realizar
			String sentencia = "DELETE FROM proveedores WHERE nit_proveedor =" + nit_proveedor + ";";
			
			//impresion de verificación
			System.out.println("Registrado " + sentencia);
			
			//ejecutando la sentencia en la base de datos
			consulta.execute(sentencia);
			
			//cerrando sentencia y conexión
			consulta.close();
			conex.desconectar();

		} catch (SQLException e) {
			//si hay un error en el sql mostrarlo
			System.out.println("------------------- ERROR --------------");
			System.out.println("No se pudo eliminar el proveedor");
			System.out.println(e.getMessage());
			System.out.println(e.getErrorCode());
		} catch (Exception e) {
			//si hay cualquier otro error mostrarlo
			System.out.println("------------------- ERROR --------------");
			System.out.println("No se pudo eliminar el Proveedor");
			System.out.println(e.getMessage());
			System.out.println(e.getLocalizedMessage());
		}

	}

	public void actualizarProveedores(ProveedoresVO user) {
		
		//instancia de conexion
		Conexion conex = new Conexion();

		try {
			//inicializando sentencia
			Statement estatuto = conex.getConnection().createStatement();
			
			//String con la sentencia a ejecutar
			String sentencia = "UPDATE proveedores "
					+ "SET ciudad_proveedor= '"+user.getCiudad_proveedor() +"',"
					+ "direccion_proveedor = '"+user.getDireccion_proveedor() +"',"
					+ "nombre_proveedor = '"+user.getNombre_proveedor() +"',"
					+ "telefono_proveedor = '"+user.getTelefono_proveedor() +"'"
					+ "WHERE nit_proveedor = "+user.getNit_proveedor() +";";
			
			//ejecuta la sentencia 
			estatuto.executeUpdate(sentencia);
			
			//verificación por consola de la sentencia
			System.out.println("Registrado " + sentencia);
			
			//cerrando sentencia y conexión
			estatuto.close();
			conex.desconectar();

		} catch (SQLException e) {
			//si hay un error en el sql mostrarlo
			System.out.println("------------------- ERROR --------------");
			System.out.println("No se pudo actualizar  el proveedor");
			System.out.println(e.getMessage());
			System.out.println(e.getErrorCode());
		} catch (Exception e) {
			//si hay cualquier otro error mostrarlo
			System.out.println("------------------- ERROR --------------");
			System.out.println("No se pudo eliminar el proveedor");
			System.out.println(e.getMessage());
			System.out.println(e.getLocalizedMessage());
		}

	}

}