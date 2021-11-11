package com.Tienda_Generica.DAO;

import java.sql.*;
import java.util.ArrayList;

import com.Tienda_Generica.DTO.Cliente_VentaVO;

public class Cliente_VentaDAO {
	
	public ArrayList<Cliente_VentaVO> consultarVenta(Integer cedula_cliente) {	
		//lista que contendra el o los Ventas obtenidos
		ArrayList<Cliente_VentaVO> listaventas = new ArrayList<Cliente_VentaVO>();		
		//instancia de la conexión
		Conexion conex = new Conexion();
		try {
			//prepare la sentencia en la base de datos
			PreparedStatement consulta = conex.getConnection()
					.prepareStatement("SELECT c.cedula_cliente, c.nombre_cliente, v.valor_venta "
									+ "FROM clientes AS c LEFT OUTER JOIN ventas AS v "
									+ "ON c.cedula_cliente = v.cedula_cliente "
									+ "WHERE c.cedula_cliente = ?" + ";");
			
			consulta.setInt(1, cedula_cliente);
			
			//ejecute la sentencia
			ResultSet res = consulta.executeQuery();
			
			//cree un objeto para cada encontrado en la base de datos basado en la clase entidad con los datos encontrados
			
			if (res.next()) {
				Cliente_VentaVO Venta_Cliente = new Cliente_VentaVO();
				
				Venta_Cliente.setCedula_cliente(Integer.parseInt(res.getString("cedula_cliente")));
				Venta_Cliente.setNombre_cliente(res.getString("nombre_cliente"));
				Venta_Cliente.setValor_venta(Double.parseDouble(res.getString("valor_venta"))); 
				
				listaventas.add(Venta_Cliente);
			}
			//cerrar resultado, sentencia y conexión
			res.close();
			consulta.close();
			conex.desconectar();

		} catch (SQLException e) {
			//si hay un error en el sql mostrarlo
			System.out.println("------------------- ERROR --------------");
			System.out.println("No se pudo consultar la ventas de ese cliente");
			System.out.println(e.getMessage());
			System.out.println(e.getErrorCode());
		} catch (Exception e) {
			//si hay cualquier otro error mostrarlo
			System.out.println("------------------- ERROR --------------");
			System.out.println("No se pudo consultar las ventas del cliente");
			System.out.println(e.getMessage());
			System.out.println(e.getLocalizedMessage());
		}
		return listaventas;
	}
}