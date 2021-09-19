package com.grupo_9.mision_tic_2022.tienda_generica.DTO;

import java.io.Serializable;

// Clase entidad deben ser serializables y encapsuladas
public class Usuarios_VO implements Serializable{
	
	//identificador unico de la clase entidad
	private static final long serialVersionUID = 2L;
	
	private Integer cedula_usuario;
	private String email_usuario;
	private String nombre_usurio;
	private String password;
	private String usuario;
	
	/**
	 * @return the cedula_usuario
	 */
	public Integer getCedula_usuario() {
		return cedula_usuario;
	}
	/**
	 * @param cedula_usuario the cedula_usuario to set
	 */
	public void setCedula_usuario(Integer cedula_usuario) {
		this.cedula_usuario = cedula_usuario;
	}
	/**
	 * @return the email_usuario
	 */
	public String getEmail_usuario() {
		return email_usuario;
	}
	/**
	 * @param email_usuario the email_usuario to set
	 */
	public void setEmail_usuario(String email_usuario) {
		this.email_usuario = email_usuario;
	}
	/**
	 * @return the nombre_usurio
	 */
	public String getNombre_usurio() {
		return nombre_usurio;
	}
	/**
	 * @param nombre_usurio the nombre_usurio to set
	 */
	public void setNombre_usurio(String nombre_usurio) {
		this.nombre_usurio = nombre_usurio;
	}
	/**
	 * @return the password
	 */
	public String getPassword() {
		return password;
	}
	/**
	 * @param password the password to set
	 */
	public void setPassword(String password) {
		this.password = password;
	}
	/**
	 * @return the usuario
	 */
	public String getUsuario() {
		return usuario;
	}
	/**
	 * @param usuario the usuario to set
	 */
	public void setUsuario(String usuario) {
		this.usuario = usuario;
	}
	
	
}