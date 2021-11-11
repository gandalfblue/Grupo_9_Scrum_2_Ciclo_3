package com.Tienda_Generica.BO;

import java.util.ArrayList;

import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RestController;

import com.Tienda_Generica.DAO.ProductosDAO;
import com.Tienda_Generica.DTO.ProductosVO;

@RestController
public class ProductosController {

	/*
	 * @GetMapping obtener o buscar
	 * @PostMapping insertar o agregar
	 * @PutMapping modificar o actualizar
	 * @DeleteMapping eliminar o borrar
	 * */

	@PostMapping("/registrarproductos")
	public void registrarProductos(ProductosVO user) {
		ProductosDAO Dao = new ProductosDAO();
		Dao.registrarProductos(user);
	}

	@GetMapping("/consultarproductos")
	public ArrayList<ProductosVO> consultarProductos(Integer codigo_producto) {
		ProductosDAO Dao = new ProductosDAO();
		return Dao.consultarProductos(codigo_producto);
	}

	@GetMapping("/consultarcodigo_productos")
	public ArrayList<ProductosVO> consultarCodigo_Productos(Integer codigo_producto) {
		ProductosDAO Dao = new ProductosDAO();
		return Dao.consultarCodigo_Productos(codigo_producto);
	}
	
	@GetMapping("/listarproductos")
	public ArrayList<ProductosVO> listaDeProductos() {
		ProductosDAO Dao = new ProductosDAO();
		return Dao.listaDeProductos();
	}
	
	@DeleteMapping("/eliminarproductos")
	public void eliminarProductos(Integer codigo_producto) {
		ProductosDAO Dao = new ProductosDAO();
		Dao.eliminarProductos(codigo_producto);
	}
	
	@DeleteMapping("/eliminar_tablaproductos")
	public void eliminarTablaProductos() {
		ProductosDAO Dao = new ProductosDAO();
		Dao.eliminarTablaProductos();
	}
	
	@PutMapping("/actualizarproductos")
	public void actualizarProductos(ProductosVO user) {
		ProductosDAO Dao = new ProductosDAO();
		Dao.actualizarProductos(user);
	}
}
