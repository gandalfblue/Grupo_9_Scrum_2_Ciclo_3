<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>


<!-- paquete de caracteres -->
<meta charset="utf-8">
<!-- Tamaño de la pantalla -->
<meta name="viewport" content="width=device-width">
<!-- titulo de la pestaña -->
<title>Actualizar productos</title>
<!-- bootstrap-->
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC"
	crossorigin="anonymous">

<!-- font awesome -->
<link rel="stylesheet"
	href="https://use.fontawesome.com/releases/v5.15.4/css/all.css"
	integrity="sha384-DyZ88mC6Up2uqS4h/KRgHuoeGwBcD4Ng9SiP4dIRy0EXTlnuz47vAwmeGwVChigm"
	crossorigin="anonymous">

<!-- Cargando mi hoja de estilo -->
<link href="style.css" rel="stylesheet" type="text/css" />



</head>


<body id="body_productos"> 
	<!-- Navbar-->
	<nav class="navbar navbar-dark bg-dark">
		<div class="container-fluid">
			<a class="navbar-brand links" href="index.html">
			<i class="fas fa-shopping-basket"></i> Tienda Generica</a>
			<a class="navbar-brand links" href="listausuarios.jsp">
			<i class="fas fa-users"></i> Usuarios</a> 
			<a class="navbar-brand links" href="listaclientes.jsp">
			<i class="fas fa-address-book"></i> Clientes</a>
			<a class="navbar-brand links" href="listaproveedores.jsp">
			<i class="fas fa-truck"></i> Proveedores</a>
			<a class="navbar-brand links" href="listaproductos.jsp">
			<i class="fas fa-apple-alt"></i> Productos</a>
			<a class="navbar-brand links" href="listaventas.jsp">
			<i class="fas fa-money-check-alt"></i> Ventas</a>
			<a class="navbar-brand links" href="reportes.jsp">
			<i class="fas fa-clipboard-list"></i> Reportes</a>
		</div>
	</nav>
	
			<div class="container p-4">
				<div class="col text-center">
					<button type="button" class="btn btn-success" 
				  		onclick="window.location.href='/insertarproductos.jsp'">
					<i class="fas fa-plus-circle"></i> Insertar productos</button>
					<button type="button" class="btn btn-danger"
						onclick="window.location.href='/eliminarproductos.jsp'">
					<i class="fas fa-trash"></i> Eliminar productos</button>
					<button type="button" class="btn btn-warning"
						onclick="window.location.href='/actualizarproductos.jsp'">
					<i class="fas fa-pen-alt"></i> Actualizar productos</button>
					<button type="button" class="btn btn-secondary"
						onclick="window.location.href='/buscarproductos.jsp'">
					<i class="fas fa-search"></i> Buscar productos</button>
					<button type="button" class="btn btn-primary"
						onclick="window.location.href='/listaproductos.jsp'">
					<i class="fas fa-list-ol"></i> Lista productos</button>
					
				</div>
			</div>
			<div class="header">
				<h1 style="color:black;" >
					<i class="fas fa-pen-alt"></i> Actualizar producto
				</h1>		
			</div>
			
	<div style="padding-left: 5px">
		
		<div class="container">


			<div id="error" class="alert alert-danger visually-hidden"
				role="alert">Error al actualizar el producto, verifique que el codigo del producto sea valido</div>
			
			<div id="error_buscar" class="alert alert-danger visually-hidden"
				role="alert">Error al buscar el producto, verifique que el codigo del producto sea valido</div>
			
			<div id="correcto" class="alert alert-success visually-hidden"
				role="alert">Producto actualizado con exito</div>

			<form id="form1" class="preselection">
				<div class="input-group mb-3">
					<span class="input-group-text" id="basic-addon1">Codigo del producto</span> <input
						type="text" class="form-control"
						placeholder="Inserte el codigo del producto aqui..."
						aria-describedby="basic-addon1" required id="codigo_producto">
				</div>

				<button type="button" class="btn btn-secondary" onclick="enviar()">
				<i class="fas fa-search"></i> Buscar producto
				</button>				
				<br>
				<br>
				
				<div class="input-group mb-3">
					<span class="input-group-text" id="basic-addon4">Iva de compra</span> <input
						type="text" class="form-control"
						placeholder="Inserte el iva de compra aqui..."
						aria-describedby="basic-addon4" required id="iva_compra" disabled="disabled">
				</div>

				<div class="input-group mb-3">
					<span class="input-group-text" id="basic-addon2">Nit del proveedor</span> <input
						type="text" class="form-control" 
						placeholder="Inserte el nit del proveedor aqui..."
						aria-describedby="basic-addon2" required id="nit_proveedor" disabled="disabled">
				</div>

				<div class="input-group mb-3">
					<span class="input-group-text" id="basic-addon3">Nombre del producto</span>
					<input type="text" class="form-control"
						placeholder="Inserte el nombre del producto aqui..."
						aria-describedby="basic-addon3" required id="nombre_producto" disabled="disabled">
				</div>				

				<div class="input-group mb-3">
					<span class="input-group-text" id="basic-addon5">Precio de compra</span> <input
						type="text" class="form-control"
						placeholder="Inserte el precio de compra aqui..."
						aria-describedby="basic-addon5" required id="precio_compra" disabled="disabled">
				</div>
				
				<div class="input-group mb-3">
					<span class="input-group-text" id="basic-addon5">Precio de venta</span> <input
						type="text" class="form-control"
						placeholder="Inserte el precio de venta aqui..."
						aria-describedby="basic-addon5" required id="precio_venta" disabled="disabled">
				</div>
			</form>

			<button type="button" class="btn btn-warning" onclick="actualizar()">
				<i class="fas fa-edit"></i> Actualizar producto
			</button>

			<br>
			<br>
			<br>
			<br>
		</div>

	</div>
	
	<nav class="navbar fixed-bottom navbar-dark bg-dark">
		<div class="row justify-content-between">
			<div class="col-4">
				<a class="navbar-brand links" href="#"><i class="fas fa-code"></i>
					Diseñado y programado por Carol Martínez, Claudia González, David Muñoz, Andrés Lozada <i
					class="fas fa-code-branch"></i></a>
			</div>
		</div>
	</nav>
	
	<script>
	
	function enviar() {
		
		var req = new XMLHttpRequest();
		var coincidencia = false;
		var user =   document.getElementById("codigo_producto").value;
		var iva = document.getElementById("iva_compra");
		var nit = document.getElementById("nit_proveedor");
		var nombre = document.getElementById("nombre_producto");
		var compra = document.getElementById("precio_compra");
		var venta = document.getElementById("precio_venta");
		req.open('GET', 'http://localhost:8080/consultarproductos?codigo_producto='+user, false);
		req.send(null);
		var productos = null;
		if (req.status == 200)
			productos = JSON.parse(req.responseText);
		console.log(JSON.parse(req.responseText));				

		var element = document.getElementById("error_buscar");
		element.classList.add("visually-hidden");
		
		console.log(productos.toString());
		
	if (productos.toString()!=""){

		document.getElementById("iva_compra").value = productos[0].iva_compra;
		iva.disabled = false;
		document.getElementById("nit_proveedor").value = productos[0].nit_proveedor;
		nit.disabled = false;
		document.getElementById("nombre_producto").value = productos[0].nombre_producto;
		nombre.disabled = false;
		document.getElementById("precio_compra").value = productos[0].precio_compra;
		compra.disabled = false;
		document.getElementById("precio_venta").value = productos[0].precio_venta;
		venta.disabled = false;
		
	} else {
		var element = document.getElementById("error_buscar");
		element.classList.remove("visually-hidden");
		
		document.getElementById("iva_compra").value = "";
		document.getElementById("nit_proveedor").value = "";
		document.getElementById("nombre_producto").value = "";
		document.getElementById("precio_compra").value = "";
		document.getElementById("precio_venta").value = "";
	}
}
	
		function actualizar() {
			var y = document.getElementById("codigo_producto").value;
			var req = new XMLHttpRequest();
			var coincidencia = false;
			req.open('GET', 'http://localhost:8080/listarproductos', false);
			req.send(null);
			var producto = null;
			if (req.status == 200)
				producto = JSON.parse(req.responseText);
			console.log(JSON.parse(req.responseText));

			for (i = 0; i < producto.length; i++) {
				
				console.log(producto[i].codigo_producto);

				if (producto[i].codigo_producto == y) {
					console.log(producto[i].codigo_producto + " " + y);
					coincidencia = true
					break;
				}
			}
			console.log(coincidencia);

			if (coincidencia != false) {
				var formData = new FormData();
				formData.append("codigo_producto", document
						.getElementById("codigo_producto").value);
				formData.append("iva_compra", document
						.getElementById("iva_compra").value);
				formData.append("nit_proveedor", document
						.getElementById("nit_proveedor").value);
				formData.append("nombre_producto",
						document.getElementById("nombre_producto").value);
				formData.append("precio_compra",
						document.getElementById("precio_venta").value);
				var xhr = new XMLHttpRequest();
				xhr.open("PUT", "http://localhost:8080/actualizarproductos");

				var element = document.getElementById("error");
				element.classList.add("visually-hidden");
				var element2 = document.getElementById("correcto");
				element2.classList.remove("visually-hidden");

				document.getElementById("codigo_producto").value = "";
				document.getElementById("iva_producto").value = "";
				document.getElementById("nit_proveedor").value = "";
				document.getElementById("nombre_producto").value = "";
				document.getElementById("precio_compra").value = "";
				document.getElementById("precio_venta").value = "";
				xhr.send(formData);

			} else {
				var element = document.getElementById("error");
				element.classList.remove("visually-hidden");
				var element2 = document.getElementById("correcto");
				element2.classList.add("visually-hidden");
				document.getElementById("codigo_producto").value = "";
				document.getElementById("iva_producto").value = "";
				document.getElementById("nit_proveedor").value = "";
				document.getElementById("nombre_producto").value = "";
				document.getElementById("precio_compra").value = "";
				document.getElementById("precio_venta").value = "";
			}
		}
	</script>

</body>
</html>