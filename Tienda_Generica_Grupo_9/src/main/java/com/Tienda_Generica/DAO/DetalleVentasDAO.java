package com.Tienda_Generica.DAO;

import java.sql.*;
import java.util.ArrayList;

import com.Tienda_Generica.DTO.DetalleVentasVO;


/**
 * Clase que permite el acceso a la base de datos
 *
 */
public class DetalleVentasDAO {
	/**
	 * Permite registrar una Venta nueva
	 * 
	 * @param codigov
	 */
	public void registrarDetalleVentas(DetalleVentasVO detalleventa) {
		// llama y crea una instancia de la clase encargada de hacer la conexión
		Conexion conex = new Conexion();

		try {
			// sentencia que se ejecutara en la base de datos
			Statement estatuto = conex.getConnection().createStatement();

			// String que contiene la sentencia insert a ejecutar
			String sentencia = "INSERT INTO detalle_ventas VALUES(" + detalleventa.getCodigo_detalle_venta() + ","
					+ detalleventa.getCantidad_producto() + "," 
					+ detalleventa.getCodigo_producto() + ","
					+ detalleventa.getCodigo_venta() + "," 
					+ detalleventa.getValor_total() + ","
					+ detalleventa.getValor_venta() + "," 
					+ detalleventa.getValor_iva() + "" + ");";

			// se ejecuta la sentencia en la base de datos
			estatuto.executeUpdate(sentencia);
			// impresión en consola para verificación
			System.out.println("Registrado " + sentencia);
			// cerrando la sentencia y la conexión
			estatuto.close();
			conex.desconectar();

		} catch (SQLException e) {
			// si hay un error en el sql mostrarlo
			System.out.println("------------------- ERROR --------------");
			System.out.println("No se pudo insertar el detalle venta");
			System.out.println(e.getMessage());
			System.out.println(e.getErrorCode());
		} catch (Exception e) {
			// si hay cualquier otro error mostrarlo
			System.out.println("------------------- ERROR --------------");
			System.out.println("No se pudo insertar la detalleventa");
			System.out.println(e.getMessage());
			System.out.println(e.getLocalizedMessage());
		}

	}

	public ArrayList<DetalleVentasVO> listaDeDetalleVentas() {
		// lista que contendra el o los usuarios obtenidos
		ArrayList<DetalleVentasVO> listadetalle_ventas = new ArrayList<DetalleVentasVO>();

		// instancia de la conexión
		Conexion conex = new Conexion();

		try {
			// prepare la sentencia en la base de datos
			PreparedStatement consulta = conex.getConnection().prepareStatement("SELECT * FROM detalle_ventas");

			// ejecute la sentencia
			ResultSet res = consulta.executeQuery();

			// cree un objeto para cada encontrado en la base de datos basado en la clase
			// entidad con los datos encontrados
			while (res.next()) {
				DetalleVentasVO venta = new DetalleVentasVO();
				venta.setCodigo_detalle_venta(Integer.parseInt(res.getString("codigo_detalle_venta")));
				venta.setCantidad_producto(Integer.parseInt(res.getString("cantidad_producto")));
				venta.setCodigo_producto(Integer.parseInt(res.getString("codigo_producto")));
				venta.setCodigo_venta(Integer.parseInt(res.getString("codigo_venta")));
				venta.setValor_total(Double.parseDouble(res.getString("valor_total")));
				venta.setValor_venta(Double.parseDouble(res.getString("valor_venta")));
				venta.setValor_iva(Double.parseDouble(res.getString("valor_iva")));

				listadetalle_ventas.add(venta);
			}

			// cerrar resultado, sentencia y conexión
			res.close();
			consulta.close();
			conex.desconectar();

		} catch (SQLException e) {
			// si hay un error en el sql mostrarlo
			System.out.println("------------------- ERROR --------------");
			System.out.println("No se pudo consultar todas las detalle_ventas");
			System.out.println(e.getMessage());
			System.out.println(e.getErrorCode());
		} catch (Exception e) {
			// si hay cualquier otro error mostrarlo
			System.out.println("------------------- ERROR --------------");
			System.out.println("No se pudo consultar todas las detalle_ventas");
			System.out.println(e.getMessage());
			System.out.println(e.getLocalizedMessage());
		}

		return listadetalle_ventas;
	}

	public void eliminarDetalleVenta(Integer codigo_detalleventa) {

		// instancia de la conexion
		Conexion conex = new Conexion();

		try {
			// sentencia inicializada
			Statement consulta = conex.getConnection().createStatement();

			// preparando sentencia a realizar
			String sentencia = "delete from detalle_ventas where codigo_detalle_venta=" + codigo_detalleventa + ";";

			// impresion de verificación
			System.out.println("Registrado " + sentencia);

			// ejecutando la sentencia en la base de datos
			consulta.execute(sentencia);

			// cerrando sentencia y conexión
			consulta.close();
			conex.desconectar();

		} catch (SQLException e) {
			// si hay un error en el sql mostrarlo
			System.out.println("------------------- ERROR --------------");
			System.out.println("No se pudo eliminar la detalleventa");
			System.out.println(e.getMessage());
			System.out.println(e.getErrorCode());
		} catch (Exception e) {
			// si hay cualquier otro error mostrarlo
			System.out.println("------------------- ERROR --------------");
			System.out.println("No se pudo eliminar la detalleventa");
			System.out.println(e.getMessage());
			System.out.println(e.getLocalizedMessage());
		}

	}

	public void actualizarDetalleVenta( DetalleVentasVO detalleventa) {

		// instancia de conexion
		Conexion conex = new Conexion();

		try {
			// inicializando sentencia
			Statement estatuto = conex.getConnection().createStatement();

			// String con la sentencia a ejecutar
			String sentencia = "UPDATE detalle_ventas " + 
			"SET cantidad_producto = " + detalleventa.getCantidad_producto()+ ", " 
			+ "valor_total = " + detalleventa.getValor_total() + ", "
			+ "valor_venta = " + detalleventa.getValor_venta() + ", "
			+ "valor_iva = " + detalleventa.getValor_iva()+ " "
			+ "WHERE codigo_detalle_venta = " + detalleventa.getCodigo_detalle_venta()+ ";";

			// ejecuta la sentencia
			estatuto.executeUpdate(sentencia);

			// verificación por consola de la sentencia
			System.out.println("Registrado " + sentencia);

			// cerrando sentencia y conexión
			estatuto.close();
			conex.desconectar();

		} catch (SQLException e) {
			// si hay un error en el sql mostrarlo
			System.out.println("------------------- ERROR --------------");
			System.out.println("No se pudo actualizar  la venta");
			System.out.println(e.getMessage());
			System.out.println(e.getErrorCode());
		} catch (Exception e) {
			// si hay cualquier otro error mostrarlo
			System.out.println("------------------- ERROR --------------");
			System.out.println("No se pudo actualizar  la venta");
			System.out.println(e.getMessage());
			System.out.println(e.getLocalizedMessage());
		}

	}

	public int contadorDetalleVenta() {
		// lista que contendra el o los usuarios obtenidos
		int contador = 0;

		// instancia de la conexión
		Conexion conex = new Conexion();

		try {
			// prepare la sentencia en la base de datos
			PreparedStatement consulta = conex.getConnection().prepareStatement("select COUNT(*) FROM detalle_ventas;");

			// ejecute la sentencia
			ResultSet res = consulta.executeQuery();

			// cree un objeto para cada encontrado en la base de datos basado en la clase
			// entidad con los datos encontrados
			while (res.next()) {
				contador = (res.getInt("COUNT(*)")) + 1;
			}

			// cerrar resultado, sentencia y conexión
			res.close();
			consulta.close();
			conex.desconectar();

		} catch (SQLException e) {
			// si hay un error en el sql mostrarlo
			System.out.println("------------------- ERROR --------------");
			System.out.println("si hay un error en el sql mostrarlo");
			System.out.println(e.getMessage());
			System.out.println(e.getErrorCode());
		} catch (Exception e) {
			// si hay cualquier otro error mostrarlo
			System.out.println("------------------- ERROR --------------");
			System.out.println("No se pudo consultar contador");
			System.out.println(e.getMessage());
			System.out.println(e.getLocalizedMessage());
		}

		return contador;
	}

	}