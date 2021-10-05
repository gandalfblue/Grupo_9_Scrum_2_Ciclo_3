package com.roca12.misiontic2022.tiendalostiburones.DAO;

import java.sql.*;
import java.util.ArrayList;
import com.roca12.misiontic2022.tiendalostiburones.DTO.ProductosVO;

/**
 * Clase que permite el acceso a la base de datos
 *
 */
public class ProductosDAO {
	/**
	 * Permite registrar un Productos nuevo
	 * 
	 * @param user
	 */
	public void registrarProductos(ProductosVO user) {
		//llama y crea una instancia de la clase encargada de hacer la conexión
		Conexion conex = new Conexion();

		try {
			//sentencia que se ejecutara en la base de datos
			Statement estatuto = conex.getConnection().createStatement();
			
			//String que contiene la sentencia insert a ejecutar
			String sentencia = "INSERT INTO productos VALUES(" 
					+ user.getCodigo_producto() + "," + "'"
					+ user.getIva_compra() + "'," + "'" 
					+ user.getNit_proveedor() + "'," + "'" 
					+ user.getNombre_producto() + "'," + "'" 
					+ user.getPrecio_compra() + "'," + "'"
					+ user.getPrecio_venta() + "'" 
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
			System.out.println("No se pudo insertar el producto");
			System.out.println(e.getMessage());
			System.out.println(e.getErrorCode());
		} catch (Exception e) {
			//si hay cualquier otro error mostrarlo
			System.out.println("------------------- ERROR --------------");
			System.out.println("No se pudo insertar el producto");
			System.out.println(e.getMessage());
			System.out.println(e.getLocalizedMessage());
		}

	}

	/**
	 * permite consultar los productos asociado al codigo del producto enviado como parametro
	 * 
	 * @param documento
	 * @return
	 */
	public ArrayList<ProductosVO> consultarProductos(Integer codigo_producto) {	
		//lista que contendra el o los productos obtenidos
		ArrayList<ProductosVO> listaProductos = new ArrayList<ProductosVO>();		
		//instancia de la conexión
		Conexion conex = new Conexion();
		try {
			//prepare la sentencia en la base de datos
			PreparedStatement consulta = conex.getConnection()
					.prepareStatement("SELECT * FROM productos where codigo_producto = ? ");		
			// se cambia el comodin ? por el dato que ha llegado en el parametro de la funcion
			consulta.setInt(1, codigo_producto);			
			//ejecute la sentencia
			ResultSet res = consulta.executeQuery();			
			//cree un objeto basado en la clase entidad con los datos encontrados
			if (res.next()) {
				ProductosVO Productos = new ProductosVO();
				Productos.setCodigo_producto(Integer.parseInt(res.getString("codigo_producto")));
				Productos.setIva_compra(Double.parseDouble(res.getString("iva_compra")));
				Productos.setNit_proveedor(Integer.parseInt(res.getString("nit_proveedor")));
				Productos.setNombre_producto(res.getString("nombre_producto"));				
				Productos.setPrecio_compra(Double.parseDouble(res.getString("precio_compra")));
				Productos.setPrecio_venta(Double.parseDouble(res.getString("precio_venta")));

				listaProductos.add(Productos);
			}
			//cerrar resultado, sentencia y conexión
			res.close();
			consulta.close();
			conex.desconectar();

		} catch (SQLException e) {
			//si hay un error en el sql mostrarlo
			System.out.println("------------------- ERROR --------------");
			System.out.println("No se pudo consultar el producto");
			System.out.println(e.getMessage());
			System.out.println(e.getErrorCode());
		} catch (Exception e) {
			//si hay cualquier otro error mostrarlo
			System.out.println("------------------- ERROR --------------");
			System.out.println("No se pudo consultar el producto");
			System.out.println(e.getMessage());
			System.out.println(e.getLocalizedMessage());
		}
		return listaProductos;
	}

	public ArrayList<ProductosVO> consultarCodigo_Productos(Integer codigo_producto) {	
		//lista que contendra el o los productos obtenidos
		ArrayList<ProductosVO> listaProductos = new ArrayList<ProductosVO>();		
		//instancia de la conexión
		Conexion conex = new Conexion();
		try {
			//prepare la sentencia en la base de datos
			PreparedStatement consulta = conex.getConnection()
					.prepareStatement("SELECT * FROM productos where codigo_producto = ? ");		
			// se cambia el comodin ? por el dato que ha llegado en el parametro de la funcion
			consulta.setInt(1, codigo_producto);			
			//ejecute la sentencia
			ResultSet res = consulta.executeQuery();			
			//cree un objeto basado en la clase entidad con los datos encontrados
			if (res.next()) {
				ProductosVO Productos = new ProductosVO();
				Productos.setCodigo_producto(Integer.parseInt(res.getString("codigo_producto")));
				Productos.setIva_compra(Double.parseDouble(res.getString("iva_compra")));
				Productos.setNit_proveedor(Integer.parseInt(res.getString("nit_proveedor")));
				Productos.setNombre_producto(res.getString("nombre_producto"));				
				Productos.setPrecio_compra(Double.parseDouble(res.getString("precio_compra")));
				Productos.setPrecio_venta(Double.parseDouble(res.getString("precio_venta")));

				listaProductos.add(Productos);
			}
			//cerrar resultado, sentencia y conexión
			res.close();
			consulta.close();
			conex.desconectar();

		} catch (SQLException e) {
			//si hay un error en el sql mostrarlo
			System.out.println("------------------- ERROR --------------");
			System.out.println("No se pudo consultar los producto");
			System.out.println(e.getMessage());
			System.out.println(e.getErrorCode());
		} catch (Exception e) {
			//si hay cualquier otro error mostrarlo
			System.out.println("------------------- ERROR --------------");
			System.out.println("No se pudo consultar los productos");
			System.out.println(e.getMessage());
			System.out.println(e.getLocalizedMessage());
		}
		return listaProductos;
	}
	
	/**
	 * permite consultar la lista de todos los Productos
	 * 
	 * @return
	 */
	public ArrayList<ProductosVO> listaDeProductos() {
		//lista que contendra el o los Productos obtenidos
		ArrayList<ProductosVO> listaProductos = new ArrayList<ProductosVO>();
		
		//instancia de la conexión
		Conexion conex = new Conexion();

		try {
			//prepare la sentencia en la base de datos
			PreparedStatement consulta = conex.getConnection().prepareStatement("SELECT * FROM productos");
			
			//ejecute la sentencia
			ResultSet res = consulta.executeQuery();
			
			//cree un objeto para cada encontrado en la base de datos basado en la clase entidad con los datos encontrados
			while (res.next()) {
				ProductosVO Productos = new ProductosVO();
				Productos.setCodigo_producto(Integer.parseInt(res.getString("codigo_producto")));
				Productos.setIva_compra(Double.parseDouble(res.getString("iva_compra")));
				Productos.setNit_proveedor(Integer.parseInt(res.getString("nit_proveedor")));
				Productos.setNombre_producto(res.getString("nombre_producto"));				
				Productos.setPrecio_compra(Double.parseDouble(res.getString("precio_compra")));
				Productos.setPrecio_venta(Double.parseDouble(res.getString("precio_venta")));

				listaProductos.add(Productos);
			}
			
			//cerrar resultado, sentencia y conexión
			res.close();
			consulta.close();
			conex.desconectar();

		} catch (SQLException e) {
			//si hay un error en el sql mostrarlo
			System.out.println("------------------- ERROR --------------");
			System.out.println("No se pudo consultar todos los productos");
			System.out.println(e.getMessage());
			System.out.println(e.getErrorCode());
		} catch (Exception e) {
			//si hay cualquier otro error mostrarlo
			System.out.println("------------------- ERROR --------------");
			System.out.println("No se pudo consultar todos los productos");
			System.out.println(e.getMessage());
			System.out.println(e.getLocalizedMessage());
		}

		return listaProductos;
	}

	public void eliminarProductos(Integer codigo_producto) {
		
		//instancia de la conexion
		Conexion conex = new Conexion();

		try {
			//sentencia inicializada
			Statement consulta = conex.getConnection().createStatement();
			
			//preparando sentencia a realizar
			String sentencia = "DELETE FROM productos WHERE codigo_producto =" + codigo_producto + ";";
			
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
			System.out.println("No se pudo eliminar el producto");
			System.out.println(e.getMessage());
			System.out.println(e.getErrorCode());
		} catch (Exception e) {
			//si hay cualquier otro error mostrarlo
			System.out.println("------------------- ERROR --------------");
			System.out.println("No se pudo eliminar el producto");
			System.out.println(e.getMessage());
			System.out.println(e.getLocalizedMessage());
		}

	}

public void eliminarTablaProductos() {
		
		//instancia de la conexion
		Conexion conex = new Conexion();

		try {
			//sentencia inicializada
			Statement consulta = conex.getConnection().createStatement();
			
			//preparando sentencia a realizar
			String sentencia = "DELETE FROM productos;";
			
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
			System.out.println("No se pudo eliminar la tabla de productos");
			System.out.println(e.getMessage());
			System.out.println(e.getErrorCode());
		} catch (Exception e) {
			//si hay cualquier otro error mostrarlo
			System.out.println("------------------- ERROR --------------");
			System.out.println("No se pudo eliminar la tabla de productos");
			System.out.println(e.getMessage());
			System.out.println(e.getLocalizedMessage());
		}
}
	
	public void actualizarProductos(ProductosVO user) {
		
		//instancia de conexion
		Conexion conex = new Conexion();

		try {
			//inicializando sentencia
			Statement estatuto = conex.getConnection().createStatement();
			
			//String con la sentencia a ejecutar
			String sentencia = "UPDATE productos "
					+ "SET iva_compra = '"+user.getIva_compra() +"',"
					+ "nit_proveedor = '"+user.getNit_proveedor() +"',"
					+ "nombre_producto = '"+user.getNombre_producto() +"',"
					+ "precio_compra = '"+user.getPrecio_compra() +"',"
					+ "precio_venta = '"+user.getPrecio_venta() +"' "
					+ "WHERE codigo_producto = "+user.getCodigo_producto() +";";
			
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
			System.out.println("No se pudo actualizar  el producto");
			System.out.println(e.getMessage());
			System.out.println(e.getErrorCode());
		} catch (Exception e) {
			//si hay cualquier otro error mostrarlo
			System.out.println("------------------- ERROR --------------");
			System.out.println("No se pudo eliminar el producto");
			System.out.println(e.getMessage());
			System.out.println(e.getLocalizedMessage());
		}
	}
}