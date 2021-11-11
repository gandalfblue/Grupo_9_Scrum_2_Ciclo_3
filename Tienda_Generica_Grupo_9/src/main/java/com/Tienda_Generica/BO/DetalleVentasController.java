package com.Tienda_Generica.BO;

import java.util.ArrayList;

import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RestController;

import com.Tienda_Generica.DAO.DetalleVentasDAO;
import com.Tienda_Generica.DTO.DetalleVentasVO;

@RestController
public class DetalleVentasController {
	/*
	 * @GetMapping obtener o buscar
	 * @PostMapping insertar o agregar
	 * @PutMapping modificar o actualizar
	 * @DeleteMapping eliminar o borrar
	 * */
	
	@PostMapping("/registrardetalleventa")
	public void registrarDetalleVentas(DetalleVentasVO venta) {
		DetalleVentasDAO Dao = new DetalleVentasDAO();
		Dao.registrarDetalleVentas(venta);
	}

	@GetMapping("/listardetalleventas")
	public ArrayList<DetalleVentasVO> listaDeDetalleVentas() {
		DetalleVentasDAO Dao = new DetalleVentasDAO();
		return Dao.listaDeDetalleVentas();
	}

	@DeleteMapping("/eliminardetalleventa")
	public void eliminarVenta(Integer codigo_venta) {
		DetalleVentasDAO Dao = new DetalleVentasDAO();
		Dao.eliminarDetalleVenta(codigo_venta);
	}

	@PutMapping("/actualizardetalleventa")
	public void actualizarVenta(DetalleVentasVO venta) {
		DetalleVentasDAO Dao = new DetalleVentasDAO();
		Dao.actualizarDetalleVenta(venta);
	}
	
	
	@GetMapping("/contadordetalleventa")
	public Integer contadorVentas() {
		DetalleVentasDAO Dao = new DetalleVentasDAO();
		return Dao.contadorDetalleVenta();
	}
	
	
}
