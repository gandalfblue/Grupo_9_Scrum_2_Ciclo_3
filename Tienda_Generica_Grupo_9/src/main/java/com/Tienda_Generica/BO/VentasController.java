package com.Tienda_Generica.BO;

import java.util.ArrayList;

import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RestController;

import com.Tienda_Generica.DAO.VentasDAO;
import com.Tienda_Generica.DTO.VentasVO;


@RestController
public class VentasController {
	
	/*
	 * @GetMapping obtener o buscar
	 * @PostMapping insertar o agregar
	 * @PutMapping modificar o actualizar
	 * @DeleteMapping eliminar o borrar
	 * */

	@PostMapping("/registrarventa")
	public void registrarVenta(VentasVO venta) {
		VentasDAO Dao = new VentasDAO();
		Dao.registrarVentas(venta);
	}

	@GetMapping("/listarventas")
	public ArrayList<VentasVO> listaDeVentas() {
		VentasDAO Dao = new VentasDAO();
		return Dao.listaDeVentas();
	}
	
	@DeleteMapping("/eliminarventa")
	public void eliminarVenta(Integer codigo_venta) {
		VentasDAO Dao = new VentasDAO();
		Dao.eliminarVentas(codigo_venta);
	}	
	
	@PutMapping("/actualizarventas")
	public void actualizarVenta(VentasVO venta) {
		VentasDAO Dao = new VentasDAO();
		Dao.actualizarVentas(venta);
	}
	
	@GetMapping("/contadorventas")
	public Integer contadorVentas() {
		VentasDAO Dao = new VentasDAO();
		return Dao.contadorVentas();
	}

}