package com.Tienda_Generica.DTO;

import java.io.Serializable;

//todas las clases entidad deben ser serializables, y deben estar encapsuladas
public class DetalleVentasVO implements Serializable {

	//identificador unico de las clases entidad
	private static final long serialVersionUID = -7823811509082856845L ;
	
	private Integer codigo_detalle_venta;
	private Integer cantidad_producto;
	private Integer codigo_producto;
	private Integer codigo_venta;
	private Double valor_total;
	private Double valor_venta;
	private Double valor_iva;
	/**
	 * @return the codigo_detalle_venta
	 */
	public Integer getCodigo_detalle_venta() {
		return codigo_detalle_venta;
	}
	/**
	 * @param codigo_detalle_venta the codigo_detalle_venta to set
	 */
	public void setCodigo_detalle_venta(Integer codigo_detalle_venta) {
		this.codigo_detalle_venta = codigo_detalle_venta;
	}
	/**
	 * @return the cantidad_producto
	 */
	public Integer getCantidad_producto() {
		return cantidad_producto;
	}
	/**
	 * @param cantidad_producto the cantidad_producto to set
	 */
	public void setCantidad_producto(Integer cantidad_producto) {
		this.cantidad_producto = cantidad_producto;
	}
	/**
	 * @return the codigo_producto
	 */
	public Integer getCodigo_producto() {
		return codigo_producto;
	}
	/**
	 * @param codigo_producto the codigo_producto to set
	 */
	public void setCodigo_producto(Integer codigo_producto) {
		this.codigo_producto = codigo_producto;
	}
	/**
	 * @return the codigo_venta
	 */
	public Integer getCodigo_venta() {
		return codigo_venta;
	}
	/**
	 * @param codigo_venta the codigo_venta to set
	 */
	public void setCodigo_venta(Integer codigo_venta) {
		this.codigo_venta = codigo_venta;
	}
	/**
	 * @return the valor_total
	 */
	public Double getValor_total() {
		return valor_total;
	}
	/**
	 * @param valor_total the valor_total to set
	 */
	public void setValor_total(Double valor_total) {
		this.valor_total = valor_total;
	}
	/**
	 * @return the valor_venta
	 */
	public Double getValor_venta() {
		return valor_venta;
	}
	/**
	 * @param valor_venta the valor_venta to set
	 */
	public void setValor_venta(Double valor_venta) {
		this.valor_venta = valor_venta;
	}
	/**
	 * @return the valor_iva
	 */
	public Double getValor_iva() {
		return valor_iva;
	}
	/**
	 * @param valor_iva the valor_iva to set
	 */
	public void setValor_iva(Double valor_iva) {
		this.valor_iva = valor_iva;
	}

	
}