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
<title>Eliminar producto</title>
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


<body>
	<nav class="navbar" id ="titulo_2">
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
			<a class="navbar-brand links" href="listareportes.jsp">
			<i class="fas fa-clipboard-list"></i> Reportes</a>
		</div>
	</nav>

	<div style="padding-left: 5px">
		<h2>
			<i class="fas fa-plus-circle"></i> Codigo del producto a eliminar
		</h2>
		
		<div class="container">		
		
			<div id="error" class="alert alert-danger visually-hidden"
					role="alert">Error al eliminar el producto,</div>
					
			<div id="no_encontrado" class="alert alert-danger visually-hidden"
					role="alert">Producto no encontrado, verifique que este ingresando
					un numero de codigo registrado</div>
					
			<div id="correcto" class="alert alert-success visually-hidden"
				role="alert">Producto eliminado con exito</div>

			<form id="form1">
				<div class="input-group mb-3">
					<span class="input-group-text" id="basic-addon1">Codigo del producto</span>
					 <input type="text" class="form-control"
						placeholder="Inserte codigo aqui..."
						aria-describedby="basic-addon1" required id="productosearch">
				</div>

			</form>

			<div class="container p-4">
				<div class="col text-center">
					
					<button type="button" class="btn btn-success" onclick="buscar()">
						<i class="fas fa-check"></i> Buscar producto
					</button>
		 			<button type="button" class="btn btn-danger" onclick="eliminar()">
						<i class="fas fa-check"></i> Eliminar producto
					</button>
	 			</div>
			</div>
			
			<div id="tabla" class="contenedor visually-hidden">
					
			<h2><i class="fas fa-list-ol"></i> Datos del producto a eliminar</h2>
			<div class="container">
				<div class="row">
					<!--  Aqui es donde se autogenera la tabla basado en el script -->
					<div class="col align-self-center" id="productoinfo">
					
					</div>
	
				</div>
			</div>
		</div>
			
			<h2>
				<i class="fas fa-cogs"></i> Operaciones
				
			</h2>
			
			<div class="container">
				<div class="row">
					<button type="button" class="btn btn-success" 
				  		onclick="window.location.href='/insertarproductos.jsp'">
					<i class="fas fa-plus-circle"></i> Agregar producto</button>
					<button type="button" class="btn btn-warning"
						onclick="window.location.href='/actualizarproductos.jsp'">
					<i class="fas fa-pen-alt"></i> Actualizar producto</button>
					<button type="button" class="btn btn-dark"
						onclick="window.location.href='/buscarproductos.jsp'">
					<i class="fas fa-search"></i> Buscar un producto</button>
					<button type="button" class="btn btn-primary"
						onclick="window.location.href='/listaproductos.jsp'">
					<i class="fas fa-search"></i> Lista de productos</button>
				</div>

			</div>
		</div>

	</div>
	
	<nav class="navbar2 fixed-bottom" id="titulo">
			<div class="row justify-content-between">
				<div class="col-4">
					<a class="navbar-brand links" href="#"><i class="fab fa-battle-net"></i>
					Diseñado y programado por Carol Martínez, Claudia González, David Muñoz, Andrés Lozada
					<i class="fas fa-cogs"></i></a>
				</div>
			</div>
	</nav>
	
	<script>	
	
	function buscar() {
		
		var req = new XMLHttpRequest();
		var coincidencia = false;
		var codigo_producto =   document.getElementById("productosearch").value;
		req.open('GET', 'http://localhost:8080/consultarcodigo_productos?codigo_producto='+ codigo_producto, false);
		req.send(null);
		var productos = null;
			
			if (req.readyState == 4 && req.status == 200) {
				productos = JSON.parse(xmlhttp.responseText);
				console.log(JSON.parse(req.responseText));
				var main = "";
				for (i = 0; i < productos.length; i++) {
					
					console.log(productos[i].codigo_producto);					
					
					if (productos[i].codigo_producto ==codigo_producto ) {
						console.log("si");
						var tbltop = "<table class='table table-hover' id='tabla' align='center';><tr><th>Codigo del producto</th><th>Iva de compra</th><th>Nit proveedor</th><th>Nombre del producto</th><th>Precio de compra</th><th>Precio de venta</th></tr>";
						var element = document.getElementById("tabla");
						element.classList.remove("visually-hidden");
						console.log(productos[i].codigo_producto +" " + codigo_producto);	
					
						main += "<tr><td>" + productos[i].codigo_producto
						+ "</td><td>" + productos[i].iva_compra
						+ "</td><td>" + productos[i].nit_proveedor
						+ "</td><td>" + productos[i].nombre_producto
						+ "</td><td>" + productos[i].precio_compra
						+ "</td><td>" + productos[i].precio_venta + "</td></tr>";
			
						break;
					
					} else {
						console.log("Producto no encontrado");
						var element = document.getElementById("no_encontrado");
						element.classList.remove("visually-hidden");
						document.getElementById("clientesearch").value = "";
						return;			
				}
				
				var tblbottom = "</table>";
				var tbl = tbltop + main + tblbottom;
				document.getElementById("productoinfo").innerHTML = tbl;
			}
				console.log("no encontrado");
				var element = document.getElementById("no_encontrado");
				element.classList.remove("visually-hidden");
				document.getElementById("productosearch").value = "";
				return;
		} else{
			console.log("error al comunicar con la base de datos");
		};
		req.send();
	}
	
	function eliminar() {
		var y = document.getElementById("productosearch").value;
		var req = new XMLHttpRequest();
		var coincidencia = false;
		req.open('GET', 'http://localhost:8080/listarproductos', false);
		req.send(null);
		var productos = null;
		if (req.status == 200)
			productos = JSON.parse(req.responseText);
		console.log(JSON.parse(req.responseText));

		for (i = 0; i < productos.length; i++) {
			
			console.log(productos[i].codigo_producto);
			if (productos[i].codigo_producto == y) {
				console.log(productos[i].codigo_producto + " " + y);
				coincidencia = true
				break;
			}
		}
		console.log(coincidencia);

		if (coincidencia != false) {
			var codigo=document.getElementById("productosearch").value;
			
			var xhr = new XMLHttpRequest();
			xhr.open("DELETE", "http://localhost:8080/eliminarproductos?codigo_producto="+codigo);
			
			var element = document.getElementById("error");
			element.classList.add("visually-hidden");
			
			var element2 = document.getElementById("correcto");
			element2.classList.remove("visually-hidden");

			document.getElementById("productosearch").value = "";
			xhr.send();

		} else {
			var element = document.getElementById("error");
			element.classList.remove("visually-hidden");
			
			var element2 = document.getElementById("correcto");
			element2.classList.add("visually-hidden");
			
			document.getElementById("productosearch").value = "";;
		}
	}
</script>

</body>
</html>