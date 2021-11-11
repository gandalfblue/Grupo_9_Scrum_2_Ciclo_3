package com.Tienda_Generica.BO;

import java.util.ArrayList;

import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RestController;

import com.Tienda_Generica.DAO.ClientesDAO;
import com.Tienda_Generica.DTO.ClientesVO;

@RestController
public class ClientesController {
	
	/*
	 * @GetMapping obtener o buscar
	 * @PostMapping insertar o agregar
	 * @PutMapping modificar o actualizar
	 * @DeleteMapping eliminar o borrar
	 * */

	@PostMapping("/registrarclientes")
	public void registrarClientes(ClientesVO user) {
		ClientesDAO Dao = new ClientesDAO();
		Dao.registrarClientes(user);
	}

	@GetMapping("/consultarclientes")
	public ArrayList<ClientesVO> consultarClientes(Integer cedula_cliente) {
		ClientesDAO Dao = new ClientesDAO();
		return Dao.consultarClientes(cedula_cliente);
	}

	@GetMapping("/listarclientes")
	public ArrayList<ClientesVO> listaDeClientes() {
		ClientesDAO Dao = new ClientesDAO();
		return Dao.listaDeClientes();
	}
	
	@DeleteMapping("/eliminarclientes")
	public void eliminarClientes(Integer cedula_cliente) {
		ClientesDAO Dao = new ClientesDAO();
		Dao.eliminarClientes(cedula_cliente);
	}
	
	@PutMapping("/actualizarclientes")
	public void actualizarClientes(ClientesVO user) {
		ClientesDAO Dao = new ClientesDAO();
		Dao.actualizarClientes(user);
	}
}