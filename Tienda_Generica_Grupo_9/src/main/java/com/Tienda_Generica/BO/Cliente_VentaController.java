package com.Tienda_Generica.BO;

import java.util.ArrayList;


import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

import com.Tienda_Generica.DAO.Cliente_VentaDAO;
import com.Tienda_Generica.DTO.Cliente_VentaVO;

@RestController
public class Cliente_VentaController {
	
	/*
	 * @GetMapping obtener o buscar
	 * @PostMapping insertar o agregar
	 * @PutMapping modificar o actualizar
	 * @DeleteMapping eliminar o borrar
	 * */

	@GetMapping("/consultarventa")
	public ArrayList<Cliente_VentaVO> consultarVenta(Integer cedula_cliente) {
		Cliente_VentaDAO Dao = new Cliente_VentaDAO();
		return Dao.consultarVenta(cedula_cliente);
	}

}